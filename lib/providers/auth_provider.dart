import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tamim/main.dart';

class AuthProvider extends ChangeNotifier {
  late StreamSubscription authSubscription;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "149188286600-2f57i7gs1e3u97fp592t6fi5c08tp7jq.apps.googleusercontent.com",
    serverClientId:
        "149188286600-50lmk8tf9kmhjaa9h3u9ktht4572b1vd.apps.googleusercontent.com",
  );

  bool isInitialized = false;
  bool isAuthenticated = false;
  var user;

  AuthProvider() {
    authSubscription = supabase.auth.onAuthStateChange.listen((data) async {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      logger.d('event: $event, session: ${session != null}');

      switch (event) {
        case AuthChangeEvent.initialSession:
          if (session != null) {
            final data =
                await supabase
                    .from('users')
                    .select()
                    .eq('id', session.user.id)
                    .single();
            isAuthenticated = true;
            user = data;
          }
          isInitialized = true;
          notifyListeners();
        // handle initial session
        case AuthChangeEvent.signedIn:
        // handle signed in
        case AuthChangeEvent.signedOut:
        // handle signed out
        case AuthChangeEvent.passwordRecovery:
        // handle password recovery
        case AuthChangeEvent.tokenRefreshed:
        // handle token refreshed
        case AuthChangeEvent.userUpdated:
        // handle user updated
        case AuthChangeEvent.userDeleted:
        // handle user deleted
        case AuthChangeEvent.mfaChallengeVerified:
        // handle mfa challenge verified
      }
    });
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  signIn() async {
    final googleUser = await googleSignIn.signIn();

    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    final result = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    // TODO: status 추가
    final data =
        await supabase
            .from('users')
            .upsert({
              'id': result.user!.id,
              'email': result.user!.email,
              'last_sign_in_at': result.user!.lastSignInAt,
            })
            .select()
            .single();

    isAuthenticated = true;
    user = data;

    notifyListeners();
  }

  void signOut() {
    googleSignIn.signOut();
    supabase.auth.signOut();
    isAuthenticated = false;
    notifyListeners();
  }

  Future<void> updateUserStatus(String name, String baptismalName) async {
    user =
        await supabase
            .from('users')
            .update({
              'name': name,
              'baptismal_name': baptismalName,
              'status': 'profile_completed',
            })
            .eq('id', user['id'])
            .select()
            .single();
    notifyListeners();
  }
}
