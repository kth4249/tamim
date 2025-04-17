import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish_group.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/screens/calendar_sample.dart';
import 'package:tamim/screens/connection_method_screen.dart';
import 'package:tamim/screens/create_group_screen.dart';
import 'package:tamim/screens/login_screen.dart';
import 'package:tamim/screens/parish_group_list_screen.dart';
import 'package:tamim/screens/parish_group_screen.dart';
import 'package:tamim/screens/register_screen.dart';
import 'package:tamim/screens/volunteer_confirmation_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/parish-groups',
  routes: [
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const CalendarPage(),
    ),
    GoRoute(
      path: '/parish-groups',
      builder: (context, state) => ParishGroupListScreen(),
    ),
    GoRoute(
      path: '/parish-groups/:id',
      builder:
          (context, state) =>
              ParishGroupScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/connection-method',
      builder: (context, state) => const ConnectionMethodScreen(),
    ),
    GoRoute(
      path: '/create-meeting',
      builder: (context, state) => const CreateGroupScreen(),
    ),
    GoRoute(
      path: '/volunteer-confirmation',
      builder: (context, state) => const VolunteerConfirmationScreen(),
    ),
  ],
  redirect: (context, state) async {
    final authProvider = context.read<AuthProvider>();
    logger.d('redirect:: ${authProvider.isAuthenticated}');
    if (!authProvider.isAuthenticated) {
      return '/login';
    }
    final user = authProvider.user!;
    if (user.status == null) {
      return '/register';
    }
    if (user.status == 'profile_completed') {
      return '/connection-method';
    }
    if (user.status == 'pending_group_creation') {
      return '/create-meeting';
    }
    // if (state.path == '/parish-groups') {
    //   final data =
    //       await supabase
    //           .from('parish_groups')
    //           .select('*')
    //           .eq('id', user.id)
    //           .limit(1)
    //           .single();
    //   final group = ParishGroup.fromJson(data);
    //   return '/parish-groups/${group.id}';
    // }
    return null;
  },
);
