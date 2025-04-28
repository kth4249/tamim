import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/providers/auth_provider.dart';

class ConnectionMethodScreen extends StatelessWidget {
  const ConnectionMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  size: 40,
                  color: Colors.green.shade400,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '회원 정보 등록이 완료되었습니다',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '서비스 이용을 위해 아래 방법 중 하나를 선택해주세요',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 40),
            // URL 안내 카드
            _ConnectionMethodInfoCard(
              icon: Icons.link_rounded,
              title: 'URL로 접속하기',
              subtitle: '전달받은 URL을 클릭하여 접속',
            ),
            const SizedBox(height: 16),
            // QR 안내 카드
            _ConnectionMethodInfoCard(
              icon: Icons.qr_code_rounded,
              title: 'QR 코드 스캔하기',
              subtitle: '전달받은 QR 코드를 스캔하여 접속',
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '접속 후 로그인하시면 모든 서비스를 이용하실 수 있습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
            // 다른 계정으로 로그인 버튼 추가
            const Expanded(child: SizedBox(height: 40)),
            ElevatedButton(
              onPressed: () {
                context.read<AuthProvider>().signOut();
                context.go('/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
              ),
              child: const Text('다른 계정으로 로그인'),
            ),
          ],
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5EF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.03),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.green.shade400, size: 20),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
