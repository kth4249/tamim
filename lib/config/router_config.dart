import 'package:go_router/go_router.dart';
import 'package:tamim/screens/connection_method_screen.dart';
import 'package:tamim/screens/create_meeting_screen.dart';
import 'package:tamim/screens/login_screen.dart';
import 'package:tamim/screens/main_screen.dart';
import 'package:tamim/screens/register_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/parish-groups',
      builder: (context, state) => const MainScreen(),
    ),
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
  ],
);
