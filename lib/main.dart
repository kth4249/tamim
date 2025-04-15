import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tamim/config/init.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamim/config/router_config.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;
var logger = Logger();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      builder:
          (context, child) =>
              !context.watch<AuthProvider>().isInitialized
                  ? const MaterialApp(home: SplashScreen())
                  : MaterialApp.router(
                    routerConfig: router,
                    title: 'tamim',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                      textTheme: GoogleFonts.notoSansTextTheme(),
                    ),
                    debugShowCheckedModeBanner: false,
                  ),
    );
  }
}
