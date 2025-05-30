import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/providers/auth_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nicknameController;
  late TextEditingController _baptismalNameController;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthProvider>().user!;
    final userInfo = user.userInfo!;
    _nicknameController = TextEditingController(text: userInfo.nickname);
    _baptismalNameController =
        TextEditingController(text: userInfo.baptismalName);
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _baptismalNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final authProvider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보 수정'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                TextFormField(
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    labelText: '닉네임',
                    labelStyle: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.outlineVariant),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.primary),
                    ),
                    hintText: '닉네임을 입력해주세요',
                    hintStyle: TextStyle(color: colorScheme.outlineVariant),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '닉네임을 입력해주세요';
                    }
                    if (value.length < 2 || value.length > 10) {
                      return '닉네임은 2글자 이상 10글자 이하여야 합니다.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (!(value == null || value.isEmpty) &&
                        (value.length < 2 || value.length > 15)) {
                      return '세례명은 2글자 이상 15글자 이하여야 합니다.';
                    }
                    return null;
                  },
                  controller: _baptismalNameController,
                  decoration: InputDecoration(
                    labelText: '세례명 (선택)',
                    labelStyle: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.outlineVariant),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.primary),
                    ),
                    hintText: '세례명을 입력해주세요',
                    hintStyle: TextStyle(color: colorScheme.outlineVariant),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: const Text(
                    '세례명은 가톨릭에서 세례를 받을 때 선택하는 이름으로, 보통 성인의 이름을 따서 지어집니다. 세례를 받지 않으신 분들은 입력하지 않으셔도 됩니다.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('필수 입력 값을 입력해주세요.'),
                          showCloseIcon: true,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    authProvider.updateUserInfo({
                      'id': authProvider.user?.id,
                      'nickname': _nicknameController.text,
                      'baptismal_name': _baptismalNameController.text,
                    });
                    if (context.mounted) {
                      context.pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('내 정보가 성공적으로 수정되었습니다.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  child: const Text('저장'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
