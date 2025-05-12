import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/role.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/splash_screen.dart';

class JoinScreen extends StatefulWidget {
  final String joinKey;

  const JoinScreen({super.key, required this.joinKey});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  late AuthProvider authProvider;

  @override
  void initState() {
    authProvider = context.read<AuthProvider>();
    join();
    super.initState();
  }

  void join() async {
    try {
      final parishGroup = await supabase
          .from('parish_groups')
          .select('id')
          .eq('join_key', widget.joinKey)
          .single();

      await supabase.from('parish_group_members').upsert({
        'group_id': parishGroup['id'],
        'user_id': authProvider.user!.id,
        "role_id": roleIdMap[GroupRole.member],
        "status": "active",
        "updated_at": DateTime.now().toIso8601String(),
      });
      if (mounted) {
        context.push('/parish-groups/${parishGroup['id']}').then((value) {
          mounted ? context.go('/') : null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("존재하지 않는 모임입니다."),
          ),
        );
        context.go('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
