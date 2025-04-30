import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish.dart';

class CreateGroupScreen extends StatefulWidget {
  final String registerKey;

  const CreateGroupScreen({super.key, required this.registerKey});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _meetingNameController = TextEditingController();
  final TextEditingController _meetingDescriptionController =
      TextEditingController();
  int? selectedCategory;
  late Parish _parish;

  var _isLoading = false;

  final categories = supabase.from('parish_group_categories').select('*');

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final registerKey = widget.registerKey;
    final parishRes = await supabase
        .from('parishs')
        .select('*')
        .eq('register_key', registerKey)
        .maybeSingle();
    if (parishRes == null) {
      context.go('/');
      return;
    }
    final joinedGroupRes = await supabase
        .from('parish_group_members')
        .select('*')
        .eq('user_id', supabase.auth.currentUser!.id)
        .eq('status', 'active')
        .maybeSingle();
    if (joinedGroupRes != null) {
      context.go('/');
      return;
    }

    _parish = Parish.fromJson(parishRes);
  }

  @override
  void dispose() {
    _meetingNameController.dispose();
    _meetingDescriptionController.dispose();
    super.dispose();
  }

  void _showSuccessDialog(Map<String, dynamic> response) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        var joinUrl = 'https://kth4249.github.io/join/${response['join_key']}';
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
                    onPressed: () =>
                        context.go('/parish-groups/${response['id']}'),
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
    return Scaffold(
      appBar: AppBar(title: const Text('단체 생성'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '카테고리 선택',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder(
                  future: categories,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox.shrink();
                    }
                    return Row(
                      children: snapshot.data!.map((item) {
                        final int category = item['id']!;
                        final isSelected = selectedCategory == category;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(item['category_name']!),
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
                    );
                  },
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
              TextField(
                controller: _meetingDescriptionController,
                decoration: InputDecoration(
                  hintText: '단체에 대한 설명을 작성해주세요.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 32),
              SizedBox(
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
                      return;
                    }
                    final response = await _createGroup();
                    _showSuccessDialog(response);
                    setState(() => _isLoading = false);
                    context.go('/parish-groups/${response['id']}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> _createGroup() async {
    final groupResponse = await supabase
        .from('parish_groups')
        .insert({
          'parish_id': _parish.id,
          'category_id': selectedCategory,
          'group_name': _meetingNameController.text,
          'description': _meetingDescriptionController.text,
          'created_by': supabase.auth.currentUser!.id,
          'status': 'active',
          'updated_by': supabase.auth.currentUser!.id,
        })
        .select()
        .single();
    await supabase.from('parish_group_members').insert({
      'group_id': groupResponse['id'],
      'user_id': supabase.auth.currentUser!.id,
      'role_id': 1,
      'status': 'active',
    });

    return groupResponse;
  }
}
