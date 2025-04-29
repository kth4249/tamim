import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/splash_screen.dart';

class ParishGroupListScreen extends StatefulWidget {
  const ParishGroupListScreen({super.key});

  @override
  State<ParishGroupListScreen> createState() => _ParishGroupListScreenState();
}

class _ParishGroupListScreenState extends State<ParishGroupListScreen> {
  @override
  void initState() {
    supabase
        .from('parish_group_members')
        .select('*')
        .eq(
            'user_id',
            context
                .read<AuthProvider>()
                .user!
                .id) // TODO: 로그인 로그아웃하면서 좀 불안정함.. redirect도 확인
        .eq('status', 'active')
        .limit(1)
        .single()
        .then((value) {
      context.go('/parish-groups/${value['group_id']}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
