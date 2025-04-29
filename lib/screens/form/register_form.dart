import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _baptismalNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _baptismalNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_add_outlined,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '환영합니다',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '회원정보를 입력해주세요',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  autofocus: true,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '이름',
                    border: OutlineInputBorder(),
                    hintText: '실명을 입력해주세요',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이름을 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _baptismalNameController,
                  decoration: const InputDecoration(
                    labelText: '세례명 (선택)',
                    border: OutlineInputBorder(),
                    hintText: '세례명을 입력해주세요',
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '세례명은 가톨릭에서 세례를 받을 때 선택하는 이름으로, 보통 성인의 이름을 따서 지어집니다. 세례를 받지 않으신 분들은 입력하지 않으셔도 됩니다.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
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
              await context.read<AuthProvider>().upsetUser({
                'id': supabase.auth.currentUser!.id,
                'name': _nameController.text,
                'baptismal_name': _baptismalNameController.text,
                'status': 'active',
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('다음'),
          ),
        ],
      ),
    );
  }
}
