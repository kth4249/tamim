import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/user_info.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';

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

  UserInfo? user;

  AuthProvider() {
    authSubscription = supabase.auth.onAuthStateChange.listen((data) async {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      logger.d('event: $event, session: ${session != null}');

      switch (event) {
        case AuthChangeEvent.initialSession:
          if (session != null) {
            final data = await supabase
                .from('users')
                .select()
                .eq('id', session.user.id)
                .maybeSingle();
            isAuthenticated = true;
            if (data != null) {
              final userInfo = UserInfo.fromJson(data);
              user = userInfo;
            }
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

  Future<void> signInWithGoogle() async {
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

    final response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    isAuthenticated = true;

    final data = await supabase
        .from('users')
        .select()
        .eq('id', response.user!.id)
        .eq('status', 'active')
        .maybeSingle();
    if (data != null) {
      final userInfo = UserInfo.fromJson(data);
      user = userInfo;
    }
    notifyListeners();
  }

  Future<void> signInWithApple() async {
    final rawNonce = supabase.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );
    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException(
          'Could not find ID Token from generated credential.');
    }
    final response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );
    isAuthenticated = true;

    final data = await supabase
        .from('users')
        .select()
        .eq('id', response.user!.id)
        .eq('status', 'active')
        .maybeSingle();
    if (data != null) {
      final userInfo = UserInfo.fromJson(data);
      user = userInfo;
    }
    notifyListeners();
  }

  void signOut() {
    googleSignIn.signOut();
    supabase.auth.signOut();
    isAuthenticated = false;
    user = null;
    notifyListeners();
  }

  Future<void> upsetUser(final json) async {
    final data = await supabase
        .from('users')
        .upsert(json)
        .eq('id', supabase.auth.currentUser!.id)
        .select()
        .single();

    user = UserInfo.fromJson(data);
    notifyListeners();
  }

  Future<void> withdraw() async {
    if (user == null) return;

    await supabase
        .from('users')
        .update({'status': 'inactive'}).eq('id', user!.id);

    signOut();
    notifyListeners();
  }
}
