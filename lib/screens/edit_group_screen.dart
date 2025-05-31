import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/main_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';

class EditGroupScreen extends StatefulWidget {
  const EditGroupScreen({super.key});

  @override
  State<EditGroupScreen> createState() => _EditGroupScreenState();
}

class _EditGroupScreenState extends State<EditGroupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  int? _selectedCategory;
  int? _selectedParishId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<MainProvider>().fetchParishs();
    context.read<MainProvider>().fetchCategories();

    final group = context.read<ParishGroupProvider>().parishGroup!;
    setState(() {
      _nameController.text = group.groupName;
      _descController.text = group.description;
      _selectedCategory = group.categoryId;
      _selectedParishId = group.parishId;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _updateGroup() async {
    if (!_formKey.currentState!.validate() ||
        _selectedParishId == null ||
        _selectedCategory == null) {
      return;
    }
    setState(() => _isLoading = true);
    final group = context.read<ParishGroupProvider>().parishGroup;
    await supabase.from('parish_groups').update({
      'parish_id': _selectedParishId,
      'category_id': _selectedCategory,
      'group_name': _nameController.text,
      'description': _descController.text,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', group!.id);
    await context.read<ParishGroupProvider>().fetchData(group.id);
    setState(() => _isLoading = false);
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('모임 정보가 수정되었습니다.')));
      context.pop();
    }
  }

  Future<void> _deleteGroup() async {
    final group = context.read<ParishGroupProvider>().parishGroup;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('모임 삭제'),
        content: const Text('정말로 이 모임을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('취소')),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('삭제')),
        ],
      ),
    );
    if (confirm != true) return;
    await context
        .read<ParishGroupProvider>()
        .updateGroup(group!.copyWith(status: 'inactive'));
    if (mounted) {
      context
          .read<MainProvider>()
          .loadData(context.read<AuthProvider>().user!.id);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('모임이 삭제되었습니다.')));
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final group = context.watch<ParishGroupProvider>().parishGroup!;
    final parishs = context.watch<MainProvider>().parishs;
    final categories = context.watch<MainProvider>().categories;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('모임 정보 수정'),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline, color: colorScheme.primary),
                          const SizedBox(width: 8),
                          Text('모임 기본 정보',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // 본당
                      Text('본당',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface)),
                      const SizedBox(height: 8),
                      Autocomplete<Parish>(
                        initialValue: TextEditingValue(
                            text: context
                                    .read<ParishGroupProvider>()
                                    .parish
                                    ?.parishName ??
                                ''),
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') return parishs;
                          return parishs.where((Parish parish) {
                            return parish.parishName
                                .contains(textEditingValue.text);
                          });
                        },
                        displayStringForOption: (Parish parish) =>
                            parish.parishName,
                        onSelected: (Parish parish) {
                          setState(() => _selectedParishId = parish.id);
                        },
                        fieldViewBuilder: (context, controller, focusNode,
                            onEditingComplete) {
                          return TextFormField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: '본당명을 입력하거나 선택하세요.',
                              filled: true,
                              fillColor: colorScheme.surface,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: colorScheme.outlineVariant),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                            ),
                            validator: (value) {
                              if (_selectedParishId == null) {
                                return '본당을 선택해주세요.';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 18),
                      // 카테고리
                      Text('카테고리',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<int>(
                        value: _selectedCategory,
                        items: categories
                            .map((c) => DropdownMenuItem(
                                  value: c.id,
                                  child: Text(c.categoryName),
                                ))
                            .toList(),
                        onChanged: (val) =>
                            setState(() => _selectedCategory = val),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colorScheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: colorScheme.outlineVariant),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          hintText: '카테고리를 선택하세요.',
                        ),
                        validator: (val) => val == null ? '카테고리를 선택하세요.' : null,
                      ),
                      const SizedBox(height: 18),
                      // 모임명
                      Text('모임명',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface)),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: '모임명을 입력하세요.',
                          filled: true,
                          fillColor: colorScheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: colorScheme.outlineVariant),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '모임명을 입력하세요.';
                          }
                          if (value.length > 10) return '모임명은 10자 이하로 입력해주세요.';
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      // 설명
                      Text('설명',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface)),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _descController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: '모임에 대한 설명을 입력하세요.',
                          filled: true,
                          fillColor: colorScheme.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: colorScheme.outlineVariant),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                        validator: (value) {
                          if (value != null && value.length > 50) {
                            return '설명은 50자 이하로 입력해주세요.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // 수정 버튼
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _isLoading ? null : _updateGroup,
                  icon: const Icon(Icons.save),
                  label: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('수정하기', style: TextStyle(fontSize: 16)),
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 삭제 버튼
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _isLoading ? null : _deleteGroup,
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  label: const Text('모임 삭제',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  '모임을 삭제하면 모든 데이터가 복구 불가하게 삭제됩니다.',
                  style: TextStyle(color: colorScheme.error, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: colorScheme.surface,
    );
  }
}
