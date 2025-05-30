import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tamim/models/role.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/models/parish_group_member_info.dart';

class MemberManagementScreen extends StatelessWidget {
  const MemberManagementScreen({super.key});

  void _showMemberActionDialog(
      BuildContext context, ParishGroupMemberInfo member) {
    final isCurrentUser =
        member.userId == context.read<AuthProvider>().user?.id;
    final isGroupLeader = member.roleId == 1;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member.user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          isGroupLeader ? '모임장' : '모임원',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (!isCurrentUser && !isGroupLeader) ...[
                ListTile(
                  leading: const Icon(Icons.leaderboard_outlined),
                  title: const Text('모임장 위임'),
                  onTap: () async {
                    Navigator.pop(context);
                    _showTransferLeadershipDialog(context, member);
                  },
                ),
                const Divider(),
              ],
              if (!isCurrentUser) ...[
                ListTile(
                  leading: const Icon(Icons.person_remove_outlined,
                      color: Colors.red),
                  title: const Text(
                    '탈퇴',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    _showWithdrawConfirmDialog(context, member);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showTransferLeadershipDialog(
      BuildContext context, ParishGroupMemberInfo member) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.leaderboard_outlined,
                size: 48,
                color: Color(0xFF1A73E8),
              ),
              const SizedBox(height: 16),
              const Text(
                '모임장 위임',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${member.user.name}님에게 모임장을 위임하시겠습니까?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final groupId =
                          context.read<ParishGroupProvider>().parishGroup!.id;

                      // 새로운 모임장 권한 부여
                      await supabase
                          .from('parish_group_members')
                          .update({'role_id': roleIdMap[GroupRole.leader]})
                          .eq('group_id', groupId)
                          .eq('user_id', member.userId);

                      // 기존 모임장 권한 해제
                      await supabase
                          .from('parish_group_members')
                          .update({'role_id': roleIdMap[GroupRole.member]})
                          .eq('group_id', groupId)
                          .eq('user_id', supabase.auth.currentUser!.id);

                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        await context
                            .read<ParishGroupProvider>()
                            .fetchData(groupId);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A73E8),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '위임',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWithdrawConfirmDialog(
      BuildContext context, ParishGroupMemberInfo member) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.person_remove_outlined,
                size: 48,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              const Text(
                '모임원 탈퇴',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${member.user.name}님을 모임에서 탈퇴시키겠습니까?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final groupId =
                          context.read<ParishGroupProvider>().parishGroup!.id;

                      await supabase
                          .from('parish_group_members')
                          .update({'status': 'inactive'})
                          .eq('group_id', groupId)
                          .eq('user_id', member.userId);

                      if (context.mounted) {
                        Navigator.pop(context);
                        context.read<ParishGroupProvider>().fetchData(groupId);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '탈퇴',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ParishGroupProvider>();
    final pendingMembers = provider.parishGroupMemberInfos
        .where((m) => m.status == 'pending')
        .toList();
    final members = provider.parishGroupMemberInfos
        .where((m) => m.status == 'active')
        .toList();
    final groupId = provider.parishGroup?.id;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('모임원 관리'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              child: Column(
                children: [
                  QrImageView(
                    data:
                        'https://tamim-landing.vercel.app/bridge?key=${context.read<ParishGroupProvider>().parishGroup!.joinKey}',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final url = Uri.parse(
                          'https://tamim-landing.vercel.app/bridge?key=${context.read<ParishGroupProvider>().parishGroup!.joinKey}');
                      Clipboard.setData(ClipboardData(text: url.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('링크가 복사되었습니다.')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A73E8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '링크로 초대하기',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (pendingMembers.isNotEmpty) ...[
              const SizedBox(height: 30),
              const Text(
                '가입 신청자',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A73E8)),
              ),
              const SizedBox(height: 16),
              ...pendingMembers.map((member) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      title: Text(
                          '${member.user.name} (${member.user.userInfo?.nickname})'),
                      subtitle: Text(
                          '가입 신청일: ${member.createdAt.toLocal().toString().substring(0, 10)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check_circle,
                                color: Colors.green),
                            tooltip: '수락',
                            onPressed: () async {
                              await provider.acceptMember(
                                  groupId, member.userId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('가입이 승인되었습니다.')),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.red),
                            tooltip: '거절',
                            onPressed: () async {
                              await provider.rejectMember(
                                  groupId, member.userId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('가입이 거절되었습니다.')),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
            const SizedBox(height: 30),
            const Text(
              '모임원 목록',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ...members.map((member) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${member.user.name} (${member.user.userInfo?.nickname})',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '가입일: ${member.createdAt.toLocal().toString().substring(0, 10)}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            _showMemberActionDialog(context, member),
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Member {
  final int id;
  final String name;
  final String joinDate;
  final String profileImage;

  Member({
    required this.id,
    required this.name,
    required this.joinDate,
    required this.profileImage,
  });
}
