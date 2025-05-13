import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/screens/connection_method_screen.dart';
import 'package:tamim/screens/create_group_screen.dart';
import 'package:tamim/screens/edit_profile_screen.dart';
import 'package:tamim/screens/join.dart';
import 'package:tamim/screens/login_screen.dart';
import 'package:tamim/screens/member_management_screen.dart';
import 'package:tamim/screens/parish_group_list_screen.dart';
import 'package:tamim/screens/parish_group_screen.dart';
import 'package:tamim/screens/position_management_screen.dart';
import 'package:tamim/screens/register_screen.dart';
import 'package:tamim/screens/volunteer_management_screen.dart';
import 'package:tamim/screens/create_volunteer_schedule_screen.dart';
import 'package:tamim/screens/edit_group_screen.dart';

class RouterConfigClass {
  late GoRouter router;

  RouterConfigClass(AuthProvider authProvider) {
    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/deeplink',
          builder: (context, state) => const ParishGroupListScreen(),
        ),
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
          path: '/edit-profile',
          builder: (context, state) => const EditProfileScreen(),
        ),
        GoRoute(
          path: '/connection-method',
          builder: (context, state) => const ConnectionMethodScreen(),
        ),
        GoRoute(
          path: '/create-group',
          builder: (context, state) => const CreateGroupScreen(),
        ),
        GoRoute(
          path: '/create-volunteer-schedule',
          builder: (context, state) => const CreateVolunteerScheduleScreen(),
        ),
        GoRoute(
          path: '/position-management',
          builder: (context, state) => const PositionManagementScreen(),
        ),
        GoRoute(
          path: '/member-management',
          builder: (context, state) => const MemberManagementScreen(),
        ),
        GoRoute(
          path: '/join/:joinKey',
          builder: (context, state) =>
              JoinScreen(joinKey: state.pathParameters['joinKey']!),
        ),
        GoRoute(
          path: '/volunteer-management',
          builder: (context, state) => const VolunteerManagementScreen(),
        ),
        GoRoute(
          path: '/edit-group',
          builder: (context, state) => const EditGroupScreen(),
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
        final user = context.read<AuthProvider>().user!;
        final isProfilingIn = matchedLocation == '/register';

        if (user.status == null || user.status == 'inactive') {
          return isProfilingIn ? null : '/register$savedLocation';
        }
        if (isProfilingIn) return state.uri.queryParameters['from'] ?? '/';

        // 해당 모임에 가입이 안되어있을 경우 리다이렉트 처리
        final joinedGroups = await supabase
            .from('parish_group_members')
            .select('*')
            .eq('user_id', user.id)
            .eq('status', 'active');

        final currentPath = state.uri.path;
        final pathParams = state.pathParameters;
        if (currentPath.startsWith("/parish-groups")) {
          final groupId = pathParams['id'];
          final result = joinedGroups
              .any((e) => e['group_id'].toString() == groupId.toString());
          if (!result) {
            return "/";
          }
        }

        return null;
      },
    );
  }
}
