import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tamim/firebase_options.dart';
import 'package:tamim/main.dart';

init() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Supabase.initialize(
    url: 'https://oxpqwzbuzfxpsqdbplpa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im94cHF3emJ1emZ4cHNxZGJwbHBhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ1NTI0MTEsImV4cCI6MjA2MDEyODQxMX0.u85d_Vfwdi6QeP_5udUZGPEMM6OVHze_Z7sYb546kSc',
  );
  logger.d(supabase.auth.currentSession);
  initializeDateFormatting('ko_KR', null);
}
