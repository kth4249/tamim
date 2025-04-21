import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish_group_member_info.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import '../theme/app_theme.dart';

class PositionManagementScreen extends StatefulWidget {
  const PositionManagementScreen({super.key});

  @override
  State<PositionManagementScreen> createState() =>
      _PositionManagementScreenState();
}

class _PositionManagementScreenState extends State<PositionManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  Set<MemberPositionKey> _assigned = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _loadData() async {
    final mapRes = await supabase
        .from('member_positions')
        .select('group_id, user_id, position_id');

    setState(() {
      _assigned = (mapRes as List)
          .map((e) => MemberPositionKey(
              groupId: e['group_id'] as int,
              userId: e['user_id'] as String,
              positionId: e['position_id'] as int))
          .toSet();
    });
  }

  Future<void> _toggleAssignment(
      int groupId, String userId, int positionId, bool newValue) async {
    final key = MemberPositionKey(
        groupId: groupId, userId: userId, positionId: positionId);
    if (newValue) {
      // 추가
      await supabase.from('member_positions').insert({
        'group_id': groupId,
        'user_id': userId,
        'position_id': positionId,
      });
      setState(() => _assigned.add(key));
    } else {
      // 삭제
      await supabase.from('member_positions').delete().match(
          {'group_id': groupId, 'user_id': userId, 'position_id': positionId});
      setState(() => _assigned.remove(key));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Position> positions = context.read<ParishGroupProvider>().positions;
    List<ParishGroupMemberInfo> members =
        context.read<ParishGroupProvider>().parishGroupMemberInfos;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          '봉사 포지션 관리',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 검색창
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: '이름으로 검색',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 포지션 목록
              const Text(
                '포지션 목록',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              ...positions.map(
                (position) => _buildPositionCard(
                  position.positionName,
                  position.description ?? '',
                  onEdit: () {},
                  onDelete: () {},
                ),
              ),
              const SizedBox(height: 24),

              // 봉사자 관리 섹션
              const Text(
                '봉사자 관리',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // 봉사자 목록 테이블
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // 테이블 헤더
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              '이름',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          ...positions.map(
                            (position) => Expanded(
                              child: Center(
                                child: Text(
                                  position.positionName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    // 봉사자 목록
                    ...members.map(
                      (member) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                member.user.name ?? '',
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                            ...positions.map(
                              (e) => Expanded(
                                child: Center(
                                  child: _buildCheckbox(
                                    MemberPositionKey(
                                      groupId: member.groupId,
                                      userId: member.userId,
                                      positionId: e.id,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      // 새 포지션 추가 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPositionCard(
    String title,
    String description, {
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Colors.grey),
                    onPressed: onEdit,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.grey),
                    onPressed: onDelete,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(MemberPositionKey key) {
    final value = _assigned.contains(key);
    return InkWell(
      onTap: () =>
          _toggleAssignment(key.groupId, key.userId, key.positionId, !value),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: value ? AppTheme.primaryColor : Colors.grey[300]!,
            width: 2,
          ),
          color: value ? AppTheme.primaryColor : Colors.white,
        ),
        child: value
            ? const Icon(Icons.check, size: 16, color: Colors.white)
            : null,
      ),
    );
  }
}

// 매핑 키
class MemberPositionKey {
  final int groupId;
  final String userId;
  final int positionId;
  MemberPositionKey(
      {required this.groupId, required this.userId, required this.positionId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberPositionKey &&
          groupId == other.groupId &&
          userId == other.userId &&
          positionId == other.positionId;

  @override
  int get hashCode => groupId.hashCode ^ userId.hashCode ^ positionId.hashCode;
}
