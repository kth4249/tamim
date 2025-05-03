import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';

class GroupMypageScreen extends StatefulWidget {
  const GroupMypageScreen({Key? key}) : super(key: key);

  @override
  State<GroupMypageScreen> createState() => _GroupMypageScreenState();
}

class _GroupMypageScreenState extends State<GroupMypageScreen> {
  @override
  void initState() {
    final parishGroupId = context.read<ParishGroupProvider>().parishGroup!.id;
    context
        .read<VolunteerScheduleProvider>()
        .fetchAvailableDateByMember(parishGroupId);
    context
        .read<VolunteerScheduleProvider>()
        .fetchMemberPositions(parishGroupId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final myInfo = context.watch<ParishGroupProvider>().myInfo;
    final authProvider = context.read<AuthProvider>();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  // 프로필 섹션
                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.primary,
                              width: 3,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          myInfo?.user.name ?? '이름',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          myInfo?.user.baptismalName ?? '세례명',
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // 관리 메뉴 섹션
                  if (myInfo?.roleId == 1) ...[
                    Text(
                      '관리 메뉴',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildMenuCard(
                      context: context,
                      label: '모임원 관리',
                      icon: Icons.group,
                      routeName: '/member-management',
                      color: colorScheme.primaryContainer,
                      iconColor: colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    _buildMenuCard(
                      context: context,
                      label: '봉사 관리',
                      icon: Icons.work_outline,
                      routeName: '/volunteer-management',
                      color: colorScheme.primaryContainer,
                      iconColor: colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    _buildMenuCard(
                      context: context,
                      label: '봉사 일정 생성',
                      icon: Icons.calendar_month,
                      routeName: '/create-volunteer-schedule',
                      color: colorScheme.primaryContainer,
                      iconColor: colorScheme.primary,
                    ),
                  ],
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {
                        // 모임장의 경우 탈퇴하지 못한다는 안내메시지
                        if (myInfo?.roleId == 1) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('안내'),
                              content: const Text('모임장을 위임 후 탈퇴가 가능합니다.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('확인'),
                                ),
                              ],
                            ),
                          );
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('탈퇴 확인'),
                            content: const Text('정말로 탈퇴하시겠습니까?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('취소'),
                              ),
                              FilledButton(
                                onPressed: () async {
                                  await authProvider.withdraw();
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('탈퇴하기'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text('탈퇴하기'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String label,
    required IconData icon,
    required String routeName,
    required Color color,
    required Color iconColor,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: color,
      child: InkWell(
        onTap: () => context.push(routeName),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
