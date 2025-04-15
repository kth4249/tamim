import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/screens/connection_method_screen.dart';
import 'package:tamim/screens/create_meeting_screen.dart';
import 'package:tamim/screens/login_screen.dart';
import 'package:tamim/screens/main_screen.dart';
import 'package:tamim/screens/register_screen.dart';
import 'package:tamim/screens/volunteer_confirmation_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
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
      builder: (context, state) => const CreateMeetingScreen(),
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
    if (authProvider.user['status'] == null) {
      return '/register';
    }
    if (authProvider.user['status'] == 'profile_completed') {
      return '/connection-method';
    }
    if (authProvider.user['status'] == 'pending_group_creation') {
      return '/create-meeting';
    }

    return null;
  },
);
