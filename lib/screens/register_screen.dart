import 'package:flutter/material.dart';
import 'package:tamim/screens/connection_method_screen.dart';
import 'package:tamim/screens/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _taxiNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _taxiNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('회원정보 등록'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      child: Icon(
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
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: '이름',
                      border: OutlineInputBorder(),
                      hintText: '실명을 입력해주세요',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _taxiNumberController,
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
                      '세례명은 가톨릭이나 개신교에서 세례를 받을 때 선택하는 이름으로, 본통 성인의 이름을 따서 지어집니다. 세례를 받지 않으신 분들은 입력하지 않으셔도 됩니다.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: 회원정보 저장 로직 구현
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConnectionMethodScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}
