import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/screens/form/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원정보 등록'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.read<AuthProvider>().signOut(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: RegisterForm()),
    );
  }
}
