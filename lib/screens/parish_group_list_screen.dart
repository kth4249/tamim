import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tamim/main.dart';
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
        .eq('user_id', supabase.auth.currentUser!.id)
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
