import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish_group_member_info.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';
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
    context.read<VolunteerScheduleProvider>().fetchMemberPositions(groupId);
  }

  void _showPositionDialog({Position? position}) {
    final TextEditingController nameController =
        TextEditingController(text: position?.positionName);
    final TextEditingController descController =
        TextEditingController(text: position?.description);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      position == null
                          ? Icons.add_circle_outline
                          : Icons.edit_outlined,
                      color: AppTheme.primaryColor,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      position == null ? '새 포지션 추가' : '포지션 수정',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '포지션 이름을 입력해주세요';
                    }
                    if (value.length >= 10) {
                      return '포지션 이름은 10글자 미만이어야 합니다';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: '포지션 이름',
                    hintText: '포지션 이름 입력 (10글자 미만)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.work_outline),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descController,
                  validator: (value) {
                    if (value != null && value.length >= 30) {
                      return '설명은 30글자 미만이어야 합니다';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: '설명',
                    hintText: '포지션에 대한 설명을 입력하세요 (30글자 미만)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.description_outlined),
                  ),
                  maxLines: 3,
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
                        if (!formKey.currentState!.validate()) return;

                        if (position == null) {
                          await supabase.from('positions').insert({
                            'position_name': nameController.text,
                            'description': descController.text,
                            'group_id': context
                                .read<ParishGroupProvider>()
                                .parishGroup!
                                .id,
                            'created_by': context.read<AuthProvider>().user?.id,
                            "updated_by": context.read<AuthProvider>().user?.id,
                            "updated_at": DateTime.now().toIso8601String(),
                          });
                        } else {
                          await supabase.from('positions').update({
                            'position_name': nameController.text,
                            'description': descController.text,
                            "updated_by": context.read<AuthProvider>().user?.id,
                            "updated_at": DateTime.now().toIso8601String(),
                          }).eq('id', position.id);
                        }
                        _loadData();

                        if (context.mounted) {
                          Navigator.pop(context);
                          context.read<ParishGroupProvider>().loadPositions();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        position == null ? '추가' : '수정',
                        style: const TextStyle(
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
      ),
    );
  }

  void _showDeleteConfirmDialog(Position position) {
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
                Icons.warning_rounded,
                color: Colors.red,
                size: 48,
              ),
              const SizedBox(height: 16),
              const Text(
                '포지션 삭제',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${position.positionName} 포지션을 삭제하시겠습니까?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '이 작업은 되돌릴 수 없습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
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
                      await supabase
                          .from('positions')
                          .delete()
                          .eq('id', position.id);
                      _loadData();

                      if (mounted) {
                        Navigator.pop(context);
                        context.read<ParishGroupProvider>().loadPositions();
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
                      '삭제',
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
    List<Position> positions = context.watch<ParishGroupProvider>().positions;
    List<ParishGroupMemberInfo> members = context
        .watch<ParishGroupProvider>()
        .parishGroupMemberInfos
        .where((e) => e.status == 'active')
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 포지션 목록
              const Text(
                '포지션 목록',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              if (positions.isEmpty)
                Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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
                      Icon(
                        Icons.work_outline,
                        size: 48,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '포지션이 없습니다',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '봉사자들을 관리하기 위해서는 먼저 포지션을 생성해야 합니다.\n오른쪽 하단의 + 버튼을 눌러 포지션을 추가해보세요!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
              else
                ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onReorder: (oldIndex, newIndex) async {
                    if (newIndex > oldIndex) newIndex--;
                    final newPositions = List<Position>.from(positions);
                    final item = newPositions.removeAt(oldIndex);
                    newPositions.insert(newIndex, item);
                    // order 값 업데이트
                    for (int i = 0; i < newPositions.length; i++) {
                      final pos = newPositions[i];
                      if (pos.order != i) {
                        await supabase
                            .from('positions')
                            .update({'order': i}).eq('id', pos.id);
                      }
                    }
                    context.read<ParishGroupProvider>().loadPositions();
                  },
                  buildDefaultDragHandles: false,
                  children: [
                    for (int i = 0; i < positions.length; i++)
                      _buildPositionCard(
                        ValueKey(positions[i].id),
                        positions[i].positionName,
                        positions[i].description ?? '',
                        index: i,
                        onEdit: () =>
                            _showPositionDialog(position: positions[i]),
                        onDelete: () => _showDeleteConfirmDialog(positions[i]),
                      ),
                  ],
                ),
              const SizedBox(height: 24),

              // 봉사자 관리 섹션
              if (positions.isNotEmpty) ...[
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
                                  member.user.name,
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
                const SizedBox(height: 70),
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      // 새 포지션 추가 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPositionDialog(),
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPositionCard(
    Key key,
    String title,
    String description, {
    required int index,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 드래그 핸들
          ReorderableDragStartListener(
            index: index,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(Icons.drag_handle, color: Colors.grey[400], size: 28),
            ),
          ),
          // 내용
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined, color: Colors.grey),
                      onPressed: onEdit,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon:
                          const Icon(Icons.delete_outline, color: Colors.grey),
                      onPressed: onDelete,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ],
            ),
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
