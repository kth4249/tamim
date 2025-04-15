import 'package:flutter/material.dart';
import 'package:tamim/main.dart';

class CreateMeetingScreen extends StatefulWidget {
  const CreateMeetingScreen({super.key});

  @override
  State<CreateMeetingScreen> createState() => _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends State<CreateMeetingScreen> {
  final TextEditingController _meetingNameController = TextEditingController();
  final TextEditingController _meetingDescriptionController =
      TextEditingController();
  String selectedCategory = '전례부';

  final categories = supabase.from('parish_group_categories').select('*');

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFE8F5E9),
                    child: Icon(Icons.check, color: Colors.green),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '모임이 생성되었습니다',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('아래 링크를 공유하여 멤버들을 초대하세요'),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'https://moim.example.com/${_meetingNameController.text}',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement copy functionality
                          },
                          child: const Text('복사'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // onPressed: () => context.go('/parish-groups'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        '모임으로 이동',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('모임 생성'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '카테고리 선택',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // child: Row(
              //   children: categories
              //       .map((category) {
              //         final isSelected = selectedCategory == category;
              //         return Padding(
              //           padding: const EdgeInsets.only(right: 8),
              //           child: ChoiceChip(
              //             label: Text(category),
              //             selected: isSelected,
              //             onSelected: (selected) {
              //               if (selected) {
              //                 setState(() => selectedCategory = category);
              //               }
              //             },
              //             backgroundColor: Colors.white,
              //             selectedColor: Colors.blue,
              //             labelStyle: TextStyle(
              //               color: isSelected ? Colors.white : Colors.black,
              //             ),
              //           ),
              //         );
              //       })
              //       .toList()
              // ),
              child: FutureBuilder(
                future: categories,
                builder: (context, snapshot) {
                  logger.d(snapshot.data);
                  if (snapshot.data == null) {
                    return const SizedBox.shrink();
                  }
                  return Row(
                    children:
                        snapshot.data!.map((item) {
                          final category = item['category_name']!;
                          final isSelected = selectedCategory == category;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(category),
                              selected: isSelected,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() => selectedCategory = category);
                                }
                              },
                              backgroundColor: Colors.white,
                              selectedColor: Colors.blue,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '모임명 입력',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _meetingNameController,
              decoration: InputDecoration(
                hintText: '123',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Tooltip(
              message: '모임 이미지 변경 기능은 준비 중 입니다.',
              triggerMode: TooltipTriggerMode.tap,
              child: Row(
                children: [
                  const Text(
                    '모임 이미지',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.info_outline),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 48,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '모임 설명 (선택사항)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _meetingDescriptionController,
              decoration: InputDecoration(
                hintText: '123',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _showSuccessDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '모임 생성하기',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
