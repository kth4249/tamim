import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group.dart';
import 'package:tamim/models/role.dart';
import 'package:tamim/providers/main_provider.dart';
import 'package:tamim/widgets/custom_scaffold.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _meetingNameController = TextEditingController();
  final TextEditingController _meetingDescriptionController =
      TextEditingController();

  int? selectedCategory;
  Parish? _parish;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _meetingNameController.dispose();
    _meetingDescriptionController.dispose();
    super.dispose();
  }

  void _showSuccessDialog(ParishGroup response) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        var joinUrl =
            'https://tamim-landing.vercel.app/bridge?key=${response.joinKey}';
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFE8F5E9),
                  child: Icon(Icons.check, color: Colors.green),
                ),
                const SizedBox(height: 16),
                const Text(
                  '모임이 생성되었습니다',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('아래 링크를 공유하여 멤버들을 초대하세요'),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          joinUrl,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: joinUrl));
                        },
                        child: const Text('복사'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {
                      context.pop(),
                      context.replace('/parish-groups/${response.id}'),
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      '모임으로 이동',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.read<MainProvider>().categories;
    final parishes = context.read<MainProvider>().parishs;

    return CustomScaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('단체 생성'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '본당 선택',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Autocomplete<Parish>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return parishes;
                  }
                  return parishes.where((Parish parish) {
                    return parish.parishName.contains(textEditingValue.text);
                  });
                },
                displayStringForOption: (Parish parish) => parish.parishName,
                onSelected: (Parish parish) {
                  setState(() {
                    _parish = parish;
                  });
                },
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
                  return TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: '본당명을 입력하거나 선택하세요.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (_parish == null) {
                        return '본당을 선택해주세요.';
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text(
                '카테고리 선택',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((item) {
                    final int category = item.id;
                    final isSelected = selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(item.categoryName),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => selectedCategory = category);
                          }
                        },
                        backgroundColor: Colors.white,
                        selectedColor: Colors.blue,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '단체명 입력',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _meetingNameController,
                decoration: InputDecoration(
                  hintText: '단체명을 입력해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '단체명을 입력해주세요.';
                  }
                  if (value.length > 10) {
                    return '단체명은 10자 이하로 입력해주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Tooltip(
                message: '단체 이미지 변경 기능은 준비 중 입니다.',
                triggerMode: TooltipTriggerMode.tap,
                child: Row(
                  children: [
                    Text(
                      '단체 이미지',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.info_outline),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Image.asset('assets/images/parish_group_default.png'),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '단체 설명 (선택사항)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                validator: (value) {
                  if (value != null && value.length > 50) {
                    return '단체 설명은 50자 이하로 입력해주세요.';
                  }
                  return null;
                },
                controller: _meetingDescriptionController,
                decoration: InputDecoration(
                  hintText: '단체에 대한 설명을 작성해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 87),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            if (_isLoading) return;
            setState(() => _isLoading = true);
            if (!_formKey.currentState!.validate() ||
                selectedCategory == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('필수 입력 값을 입력해주세요.'),
                  showCloseIcon: true,
                  duration: Duration(seconds: 2),
                ),
              );
              setState(() => _isLoading = false);
              return;
            }
            final response = await _createGroup();
            _showSuccessDialog(response);
            setState(() => _isLoading = false);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: _isLoading
              ? const CircularProgressIndicator()
              : const Text(
                  '모임 생성하기',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
        ),
      ),
    );
  }

  Future<ParishGroup> _createGroup() async {
    final groupResponse = await supabase
        .from('parish_groups')
        .insert({
          'parish_id': _parish!.id,
          'category_id': selectedCategory,
          'group_name': _meetingNameController.text,
          'description': _meetingDescriptionController.text,
          'created_by': supabase.auth.currentUser!.id,
          'status': 'active',
          'updated_by': supabase.auth.currentUser!.id,
        })
        .select()
        .single();
    final parishGroup = ParishGroup.fromJson(groupResponse);
    await supabase.from('parish_group_members').insert({
      'group_id': groupResponse['id'],
      'user_id': supabase.auth.currentUser!.id,
      'role_id': roleIdMap[GroupRole.leader],
      'status': 'active',
    });

    return parishGroup;
  }
}
