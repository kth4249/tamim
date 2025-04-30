import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/splash_screen.dart';

class JoinScreen extends StatefulWidget {
  final String joinKey;

  const JoinScreen({super.key, required this.joinKey});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  @override
  void initState() {
    join();
    super.initState();
  }

  void join() async {
    final joinedGroup = await supabase
        .from('parish_group_members')
        .select('*')
        .eq('user_id', context.read<AuthProvider>().user!.id)
        .eq('status', 'active')
        .maybeSingle();

    final parishGroup = await supabase
        .from('parish_groups')
        .select('id')
        .eq('join_key', widget.joinKey)
        .maybeSingle();

    if ((joinedGroup != null || parishGroup == null) && mounted) {
      context.go('/');
      return;
    }

    await supabase.from('parish_group_members').upsert({
      'group_id': parishGroup!['id'],
      'user_id': context.read<AuthProvider>().user!.id,
      "role_id": 2,
      "status": "active",
    });
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
