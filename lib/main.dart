import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tamim/config/init.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamim/config/router_config.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/main_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';
import 'package:tamim/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

final supabase = Supabase.instance.client;
var logger = Logger();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthProvider authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    final router = RouterConfigClass(authProvider);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: authProvider),
        ChangeNotifierProvider(create: (context) => ParishGroupProvider()),
        ChangeNotifierProvider(
            create: (context) => VolunteerScheduleProvider()),
        ChangeNotifierProvider(create: (context) => CalendarProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
      ],
      builder: (context, child) => !context.watch<AuthProvider>().isInitialized
          ? const MaterialApp(home: SplashScreen())
          : MaterialApp.router(
              routerConfig: router.router,
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
