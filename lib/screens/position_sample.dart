import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tamim/main.dart';

class PositionSample extends StatefulWidget {
  const PositionSample({super.key});

  @override
  State<PositionSample> createState() => _PositionSampleState();
}

class _PositionSampleState extends State<PositionSample> {
  final supabase = Supabase.instance.client;

  List<MemberMap> _members = [];
  List<PositionMap> _positions = [];
  Set<MemberPositionKey> _assigned = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // 1) 멤버 + 유저 이름
    final memRes = await supabase
        .from('parish_group_members')
        .select('group_id, user:users(id, name)')
        .eq('group_id', 4);
    // 2) 포지션
    final posRes = await supabase
        .from('positions')
        .select('id, position_name')
        .eq('group_id', 4)
        .order('id');
    // 3) 매핑
    final mapRes = await supabase
        .from('member_positions')
        .select('group_id, user_id, position_id')
        .eq('group_id', 4);

    setState(() {
      _members = (memRes as List)
          .map((e) => MemberMap(
              groupId: e['group_id'] as int,
              userId: (e['user'] as Map)['id'] as String,
              name: (e['user'] as Map)['name'] as String))
          .toList();
      _positions = (posRes as List)
          .map((e) => PositionMap(
              id: e['id'] as int, name: e['position_name'] as String))
          .toList();
      logger.d('mapRes: $mapRes');
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
    return _members.isEmpty || _positions.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                const DataColumn(label: Text('이름')),
                for (var pos in _positions) DataColumn(label: Text(pos.name)),
              ],
              rows: [
                for (var m in _members)
                  DataRow(cells: [
                    DataCell(Text(m.name)),
                    for (var p in _positions)
                      DataCell(Checkbox(
                        value: _assigned.contains(MemberPositionKey(
                            groupId: m.groupId,
                            userId: m.userId,
                            positionId: p.id)),
                        onChanged: (v) => _toggleAssignment(
                            m.groupId, m.userId, p.id, v ?? false),
                      )),
                  ]),
              ],
            ),
          );
  }
}

// 데이터 모델
class MemberMap {
  final int groupId;
  final String userId;
  final String name;
  MemberMap({required this.groupId, required this.userId, required this.name});
}

class PositionMap {
  final int id;
  final String name;
  PositionMap({required this.id, required this.name});
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
