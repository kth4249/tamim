import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

// 봉사자 정보를 담을 간단한 클래스 (예시)
class Volunteer {
  final String name;
  Volunteer(this.name);
}

// 봉사 일정 정보를 담을 클래스 (예시)
class ScheduleDetail {
  final DateTime date;
  final String timeRange;
  final String activity;
  final int participantCount;
  final Volunteer? leader; // 주방장
  final List<Volunteer> assistants; // 보조

  ScheduleDetail({
    required this.date,
    required this.timeRange,
    required this.activity,
    required this.participantCount,
    this.leader,
    required this.assistants,
  });
}

class VolunteerConfirmationScreen extends StatefulWidget {
  const VolunteerConfirmationScreen({super.key});

  @override
  State<VolunteerConfirmationScreen> createState() =>
      _VolunteerConfirmationScreenState();
}

class _VolunteerConfirmationScreenState
    extends State<VolunteerConfirmationScreen> {
  DateTime _focusedDay = DateTime.utc(2024, 3, 4); // 초기 포커스 날짜
  DateTime _selectedDay = DateTime.utc(2024, 3, 4); // 초기 선택된 날짜
  // 선택 가능한 봉사 날짜 (예시 데이터)
  final Set<DateTime> _volunteerDays = {
    DateTime.utc(2024, 3, 4),
    DateTime.utc(2024, 3, 8),
    // 다른 봉사 날짜들...
  };

  // 선택된 날짜에 해당하는 봉사 상세 정보 (예시 데이터)
  ScheduleDetail? _scheduleDetail;

  @override
  void initState() {
    super.initState();
    // 초기 선택된 날짜에 대한 상세 정보 로드
    _loadScheduleDetails(_selectedDay);
  }

  // 날짜에 맞는 상세 정보 로드 (실제 앱에서는 API 호출 등이 필요)
  void _loadScheduleDetails(DateTime date) {
    // 예시: 선택된 날짜가 3월 4일일 경우 상세 정보 설정
    if (isSameDay(date, DateTime.utc(2024, 3, 4))) {
      setState(() {
        _scheduleDetail = ScheduleDetail(
          date: date,
          timeRange: '오전 9:00 - 오후 12:00',
          activity: '성당 주방 봉사',
          participantCount: 3,
          leader: Volunteer('김미영'),
          assistants: [Volunteer('이수진'), Volunteer('박지은')],
        );
      });
    } else {
      // 다른 날짜에 대한 정보가 없으면 null 처리 (또는 다른 데이터 로드)
      setState(() {
        _scheduleDetail = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('봉사 일정 확인'),
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        // elevation: 1,
      ),
      body: SingleChildScrollView(
        // 내용이 길어질 수 있으므로 스크롤 가능하게
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCalendar(),
              const SizedBox(height: 24),
              if (_scheduleDetail != null)
                _buildScheduleDetailsCard(_scheduleDetail!)
              else
                const Center(child: Text('선택된 날짜의 봉사 일정이 없습니다.')), // 정보 없을 때 표시
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  // 상단 달력 위젯
  Widget _buildCalendar() {
    return Card(
      // 달력을 카드 안에 넣어 그림자 효과 적용
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0), // 카드 하단 패딩 추가
        child: TableCalendar(
          locale: 'ko_KR',
          firstDay: DateTime.utc(2024, 1, 1), // 이전/다음 달 이동 가능하도록 범위 설정
          lastDay: DateTime.utc(2024, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.week, // 한 주만 보이도록 설정
          availableCalendarFormats: const {
            // 포맷 변경 버튼 숨김
            CalendarFormat.week: 'Week',
          },
          onDaySelected: (selectedDay, focusedDay) {
            // 봉사 가능일만 선택 가능하도록 조건 추가 (선택사항)
            if (_volunteerDays.any((d) => isSameDay(d, selectedDay))) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // 포커스도 함께 업데이트
                _loadScheduleDetails(selectedDay); // 선택된 날짜의 상세 정보 로드
              });
            } else {
              // 봉사 가능일이 아닐 경우 사용자에게 피드백 (예: 스낵바)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('선택하신 날짜에는 봉사 일정이 없습니다.')),
              );
            }
          },
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false, // 'Week' 버튼 숨김
            titleTextStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            // 좌우 화살표 스타일 변경 (필요시)
            leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.grey),
            rightChevronIcon: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          calendarStyle: CalendarStyle(
            // 오늘 날짜 강조 제거 (이미지와 동일하게)
            todayDecoration: const BoxDecoration(color: Colors.transparent),
            todayTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ), // 기본 텍스트 색상 사용
            // 선택된 날짜 스타일
            selectedDecoration: BoxDecoration(
              color: Colors.teal, // 이미지의 녹색
              borderRadius: BorderRadius.circular(8.0), // 둥근 사각형
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.white,
            ), // 선택된 날짜 텍스트 흰색
            // 봉사 가능일 마커 (예시: 작은 점 표시) - 선택사항
            // markerDecoration: BoxDecoration(
            //   color: Colors.blueAccent,
            //   shape: BoxShape.circle,
            // ),
            // 주말 텍스트 색상
            weekendTextStyle: const TextStyle(
              color: Colors.black54,
            ), // 주말도 검은색 계열로
            // 기본 날짜 스타일
            defaultTextStyle: const TextStyle(color: Colors.black87),
          ),
          // 봉사 가능일인지 확인하여 스타일 적용 (예: 배경색 변경)
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              bool isVolunteerDay = _volunteerDays.any(
                (d) => isSameDay(d, day),
              );
              if (isVolunteerDay && !isSameDay(day, _selectedDay)) {
                // 봉사 가능일이지만 선택되지 않았을 때
                return Center(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.2), // 연한 배경색
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                );
              }
              return null; // 기본 빌더 사용
            },
            // 선택된 날짜는 calendarStyle에서 처리
            selectedBuilder: (context, day, focusedDay) {
              // calendarStyle.selectedDecoration이 적용되므로 null 반환 가능
              // 만약 추가 커스텀이 필요하면 여기서 구현
              return null;
            },
            // 비활성화된 날짜 (봉사 불가능일) 스타일링 (선택사항)
            disabledBuilder: (context, day, focusedDay) {
              // 봉사 불가능일을 회색으로 표시
              bool isVolunteerDay = _volunteerDays.any(
                (d) => isSameDay(d, day),
              );
              if (!isVolunteerDay) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                );
              }
              return null;
            },
          ),
          // 특정 날짜에 마커 추가 (봉사 가능일 표시)
          eventLoader: (day) {
            if (_volunteerDays.any((d) => isSameDay(d, day))) {
              return [day]; // 마커를 표시할 이벤트 리스트 반환 (내용은 중요하지 않음)
            }
            return [];
          },
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Colors.black54), // 요일 헤더의 주말 텍스트 색상
            weekdayStyle: TextStyle(color: Colors.black87), // 평일 텍스트 색상
          ),
        ),
      ),
    );
  }

  // 봉사 상세 정보 카드
  Widget _buildScheduleDetailsCard(ScheduleDetail detail) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('M월 d일 (E)', 'ko_KR').format(detail.date) + ' 봉사 일정',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.timeRange,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      detail.activity,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '${detail.participantCount}명',
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            _buildVolunteerRow(
              '주방장',
              detail.leader != null ? [detail.leader!] : [],
              true,
            ), // 주방장
            const SizedBox(height: 16),
            _buildVolunteerRow('보조', detail.assistants, true), // 보조
            const SizedBox(height: 24),
            Center(
              // 버튼 중앙 정렬
              child: ElevatedButton(
                onPressed: () {
                  // 봉사표 다시 생성 로직
                  print('봉사표 다시 생성 버튼 클릭');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('봉사표 다시 생성'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 봉사자 정보 행 (주방장, 보조 등)
  Widget _buildVolunteerRow(
    String title,
    List<Volunteer> volunteers,
    bool showEditButton,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60, // 제목 너비 고정
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Wrap(
            // 이름표가 여러 개일 경우 줄바꿈
            spacing: 8.0, // 이름표 간 가로 간격
            runSpacing: 4.0, // 이름표 간 세로 간격
            children:
                volunteers.map((v) => _buildVolunteerChip(v.name)).toList(),
          ),
        ),
        if (showEditButton)
          TextButton(
            onPressed: () {
              // 수정 로직
              print('$title 수정 버튼 클릭');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 30), // 버튼 최소 크기
              alignment: Alignment.centerRight,
            ),
            child: const Text('수정', style: TextStyle(color: Colors.teal)),
          ),
      ],
    );
  }

  // 봉사자 이름 Chip 위젯
  Widget _buildVolunteerChip(String name) {
    return Chip(
      label: Text(name),
      backgroundColor: Colors.grey[200], // 이름표 배경색
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      labelStyle: const TextStyle(fontSize: 14),
      visualDensity: VisualDensity.compact, // Chip 크기 줄이기
    );
  }

  // 하단 버튼 영역
  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
        // 상단 구분선 추가
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
        color: Colors.white, // 배경색 지정
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              // 임시 저장 버튼 (테두리 버튼)
              onPressed: () {
                // 임시 저장 로직
                print('임시 저장 버튼 클릭');
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: Colors.grey[400]!), // 테두리 색상
                foregroundColor: Colors.black54, // 텍스트 색상
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('임시 저장'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              // 일정 확정하기 버튼
              onPressed: () {
                // 일정 확정 로직
                print('일정 확정하기 버튼 클릭');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('일정 확정하기'),
            ),
          ),
        ],
      ),
    );
  }
}
