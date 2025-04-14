import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PositionManagementScreen extends StatefulWidget {
  const PositionManagementScreen({super.key});

  @override
  State<PositionManagementScreen> createState() =>
      _PositionManagementScreenState();
}

class _PositionManagementScreenState extends State<PositionManagementScreen> {
  final TextEditingController _searchController = TextEditingController();

  // 봉사자 데이터
  final List<Map<String, dynamic>> _volunteers = [
    {
      'name': '김민지',
      'isChairperson': false,
      'isLector': true,
      'isCommentator': true,
    },
    {
      'name': '이준호',
      'isChairperson': true,
      'isLector': false,
      'isCommentator': false,
    },
    {
      'name': '박서연',
      'isChairperson': false,
      'isLector': true,
      'isCommentator': false,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

              // 성가대 지휘자
              _buildPositionCard(
                '성가대 지휘자',
                '주일 미사 성가대 지휘 및 연습 지도',
                onEdit: () {},
                onDelete: () {},
              ),
              const SizedBox(height: 12),

              // 독서자
              _buildPositionCard(
                '독서자',
                '미사 중 독서와 복음 낭독',
                onEdit: () {},
                onDelete: () {},
              ),
              const SizedBox(height: 12),

              // 해설자
              _buildPositionCard(
                '해설자',
                '미사 진행 순서 안내 및 공지사항 전달',
                onEdit: () {},
                onDelete: () {},
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
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              '이름',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '지휘자',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '독서자',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '해설자',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    // 봉사자 목록
                    ..._volunteers.map(
                      (volunteer) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                volunteer['name'],
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: _buildCheckbox(
                                  volunteer['isChairperson'],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: _buildCheckbox(volunteer['isLector']),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: _buildCheckbox(
                                  volunteer['isCommentator'],
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

              // 변경사항 저장 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '변경사항 저장',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
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

  Widget _buildCheckbox(bool value) {
    return Container(
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
      child:
          value ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
    );
  }
}
