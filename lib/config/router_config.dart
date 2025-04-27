import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/screens/connection_method_screen.dart';
import 'package:tamim/screens/create_group_screen.dart';
import 'package:tamim/screens/join.dart';
import 'package:tamim/screens/login_screen.dart';
import 'package:tamim/screens/member_management_screen.dart';
import 'package:tamim/screens/parish_group_list_screen.dart';
import 'package:tamim/screens/parish_group_screen.dart';
import 'package:tamim/screens/position_management_screen.dart';
import 'package:tamim/screens/register_screen.dart';
import 'package:tamim/screens/schedule_management_screen.dart';
import 'package:tamim/screens/volunteer_confirmation_screen.dart';

class RouterConfigClass {
  late GoRouter router;

  RouterConfigClass(AuthProvider authProvider) {
    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ParishGroupListScreen(),
        ),
        GoRoute(
          path: '/parish-groups/:id',
          builder: (context, state) =>
              ParishGroupScreen(id: state.pathParameters['id']!),
        ),
        GoRoute(
            path: '/login', builder: (context, state) => const LoginScreen()),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/connection-method',
          builder: (context, state) => const ConnectionMethodScreen(),
        ),
        GoRoute(
          path: '/create/:registerKey',
          builder: (context, state) => CreateGroupScreen(
            registerKey: state.pathParameters['registerKey']!,
          ),
        ),
        GoRoute(
          path: '/volunteer-confirmation',
          builder: (context, state) => const VolunteerConfirmationScreen(),
        ),
        GoRoute(
          path: '/position-management',
          builder: (context, state) => const PositionManagementScreen(),
        ),
        GoRoute(
          path: '/member-management',
          builder: (context, state) => MemberManagementScreen(),
        ),
        GoRoute(
          path: '/join/:joinKey',
          builder: (context, state) =>
              JoinScreen(joinKey: state.pathParameters['joinKey']!),
        ),
        GoRoute(
          path: '/schedule-management',
          builder: (context, state) => const ScheduleManagementScreen(),
        ),
      ],
      refreshListenable: authProvider,
      redirect: (context, state) async {
        final matchedLocation = state.matchedLocation;
        logger.d('redirect:: ${state.uri}');

        // login redirect 처리
        final isLoggedIn = context.read<AuthProvider>().isAuthenticated;
        final isLoggingIn = matchedLocation == '/login';

        final savedLocation =
            matchedLocation == '/' ? '' : '?from=$matchedLocation';

        if (!isLoggedIn) return isLoggingIn ? null : '/login$savedLocation';
        if (isLoggingIn) return state.uri.queryParameters['from'] ?? '/';

        // 로그인 후 리다이렉트 처리
        final user = context.read<AuthProvider>().user;
        final isProfilingIn = matchedLocation == '/register';

        if (user == null) {
          return isProfilingIn ? null : '/register$savedLocation';
        }
        if (isProfilingIn) return state.uri.queryParameters['from'] ?? '/';

        // 모임 가입이 안되어있을 경우 리다이렉트 처리
        final joinedGroups = await supabase
            .from('parish_group_members')
            .select('*')
            .eq('user_id', user.id)
            .eq('status', 'active');
        if (joinedGroups.isEmpty &&
            (matchedLocation == '/join' || matchedLocation == '/create')) {
          return null;
        }
        if (joinedGroups.isEmpty && matchedLocation == '/') {
          return '/connection-method';
        }

        return null;
      },
    );
  }
}
