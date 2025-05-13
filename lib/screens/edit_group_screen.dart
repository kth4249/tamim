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
  Parish? _selectedParish;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final group = context.read<ParishGroupProvider>().parishGroup;
    if (group != null) {
      _nameController.text = group.groupName;
      _descController.text = group.description;
      _selectedCategory = group.categoryId;
      // parishId로 Parish 객체를 찾음 (비동기라서 FutureBuilder에서 처리)
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _updateGroup() async {
    if (!_formKey.currentState!.validate() ||
        _selectedParish == null ||
        _selectedCategory == null) return;
    setState(() => _isLoading = true);
    final group = context.read<ParishGroupProvider>().parishGroup;
    await supabase.from('parish_groups').update({
      'parish_id': _selectedParish!.id,
      'category_id': _selectedCategory,
      'group_name': _nameController.text,
      'description': _descController.text,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', group!.id);
    await context.read<ParishGroupProvider>().fetchData(group.id.toString());
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
    final parishes = context.read<MainProvider>().parishes;
    final categories = context.read<MainProvider>().categories;
    return Scaffold(
      appBar: AppBar(
        title: const Text('모임 정보 수정'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('본당',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Autocomplete<Parish>(
                initialValue: TextEditingValue(
                    text: parishes
                        .firstWhere((parish) => parish.id == group.parishId)
                        .parishName),
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') return parishes;
                  return parishes.where((Parish parish) {
                    return parish.parishName.contains(textEditingValue.text);
                  });
                },
                displayStringForOption: (Parish parish) => parish.parishName,
                onSelected: (Parish parish) {
                  setState(() => _selectedParish = parish);
                },
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
                  return TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: '본당명을 입력하거나 선택하세요.',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (value) {
                      if (_selectedParish == null) return '본당을 선택해주세요.';
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text('카테고리',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                value: _selectedCategory,
                items: categories
                    .map((c) => DropdownMenuItem(
                          value: c.id,
                          child: Text(c.categoryName),
                        ))
                    .toList(),
                onChanged: (val) => setState(() => _selectedCategory = val),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: '카테고리를 선택하세요.',
                ),
                validator: (val) => val == null ? '카테고리를 선택하세요.' : null,
              ),
              const SizedBox(height: 24),
              const Text('모임명',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: '모임명을 입력하세요.',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return '모임명을 입력하세요.';
                  if (value.length > 10) return '모임명은 10자 이하로 입력해주세요.';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Text('설명',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: '모임에 대한 설명을 입력하세요.',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                validator: (value) {
                  if (value != null && value.length > 50)
                    return '설명은 50자 이하로 입력해주세요.';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _updateGroup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('수정하기',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _isLoading ? null : _deleteGroup,
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label:
                      const Text('모임 삭제', style: TextStyle(color: Colors.red)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
