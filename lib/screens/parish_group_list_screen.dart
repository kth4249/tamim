import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish_group_info.dart';
import 'package:tamim/models/role.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/main_provider.dart';
import 'package:tamim/screens/my_page_screen.dart';
import 'package:tamim/theme/app_theme.dart';

class ParishGroupListScreen extends StatefulWidget {
  const ParishGroupListScreen({super.key});

  @override
  State<ParishGroupListScreen> createState() => _ParishGroupListScreenState();
}

class _ParishGroupListScreenState extends State<ParishGroupListScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context
        .read<MainProvider>()
        .loadData(context.read<AuthProvider>().user!.id);
    context.read<CalendarProvider>().fetchIcsEvents();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _joinGroup(ParishGroupInfo group) async {
    try {
      await supabase.from('parish_group_members').upsert({
        'group_id': group.id,
        'user_id': context.read<AuthProvider>().user!.id,
        'role_id': roleIdMap[GroupRole.member],
        'status': 'pending',
      });

      if (mounted) {
        context.read<MainProvider>().setMemberStatus(group.id, 'pending');
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('가입 신청이 완료되었습니다')),
        );
      }
    } catch (e) {
      logger.e('Error joining group: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('가입 신청에 실패했습니다')),
        );
      }
    }
  }

  Future<void> _cancelJoinGroup(ParishGroupInfo group) async {
    await supabase
        .from('parish_group_members')
        .delete()
        .eq('group_id', group.id)
        .eq('user_id', context.read<AuthProvider>().user!.id);
    if (mounted) {
      context.read<MainProvider>().setMemberStatus(group.id, 'inactive');
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('가입 신청이 취소되었습니다')),
      );
    }
  }

  Widget buildGroupList(List<ParishGroupInfo> groups) {
    final categories = context.read<MainProvider>().categories;
    final memberStatusMap = context.read<MainProvider>().memberStatusMap;

    return RefreshIndicator(
      onRefresh: () async {
        await context
            .read<MainProvider>()
            .loadData(context.read<AuthProvider>().user!.id);
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final group = groups[index];
                final category =
                    categories.firstWhere((c) => c.id == group.categoryId);
                final memberStatus = memberStatusMap[group.id];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: memberStatus == 'active'
                          ? () => context.push('/parish-groups/${group.id}')
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.church,
                                          size: 14,
                                          color: Colors.grey.shade600),
                                      const SizedBox(width: 4),
                                      Text(
                                        group.parish.parishName,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    category.categoryName,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                if (memberStatus == 'inactive')
                                  FilledButton(
                                    onPressed: () => _joinGroup(group),
                                    style: FilledButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                    ),
                                    child: const Text('가입하기'),
                                  )
                                else if (memberStatus == 'pending')
                                  FilledButton(
                                    onPressed: () => _cancelJoinGroup(group),
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.grey.shade100,
                                      foregroundColor: Colors.grey.shade700,
                                    ),
                                    child: Text(
                                      '가입신청 취소',
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                if (memberStatus == 'active')
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.grey.shade400,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              group.groupName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              group.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey.shade700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: groups.length,
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 32),
                  child: _ConnectionMethodInfoCard(
                    icon: Icons.link_rounded,
                    title: '빠른 가입 방법이 있나요?',
                    subtitle:
                        '모임 관리자가 전달한 URL이나 QR 코드를 통해 즉시 가입할 수 있습니다. 가입 신청을 기다리지 않고도 바로 모임에 참여할 수 있어요.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (_isLoading) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

    final groups = context.watch<MainProvider>().groups;
    final myGroups = context.watch<MainProvider>().myGroups;

    Widget currentScreen = Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppTheme.primaryColor,
          tabs: const [
            Tab(text: '내가 가입한 모임'),
            Tab(text: '전체 모임'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              buildGroupList(myGroups),
              buildGroupList(groups),
            ],
          ),
        ),
      ],
    );

    if (_selectedIndex == 1) {
      currentScreen = const MyPageScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('모임 목록'),
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.push('/create-group');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ConnectionMethodInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ConnectionMethodInfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
