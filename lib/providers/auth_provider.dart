import 'dart:async';
import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
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

    final data = await supabase
        .from('users')
        .upsert({
          'id': response.user!.id,
          'name': googleUser.displayName,
          'email': googleUser.email,
        })
        .select()
        .single();

    final userInfo = UserInfo.fromJson(data);
    isAuthenticated = true;
    user = userInfo;
    notifyListeners();
  }

  Future<void> signInWithApple() async {
    final rawNonce = supabase.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.fullName,
        AppleIDAuthorizationScopes.email,
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

    var data = await supabase
        .from('users')
        .select()
        .eq('id', response.user!.id)
        .maybeSingle();

    if (data == null) {
      final insertData = await supabase
          .from('users')
          .insert({
            'id': response.user!.id,
            'name': '${credential.familyName}${credential.givenName}',
            'email': credential.email,
          })
          .select()
          .single();
      data = insertData;
    }

    final userInfo = UserInfo.fromJson(data);
    isAuthenticated = true;
    user = userInfo;
    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      if (supabase.auth.currentUser!.appMetadata['provider'] == 'google') {
        await googleSignIn.disconnect();
      }
      await supabase.auth.signOut();
      isAuthenticated = false;
      user = null;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
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

    if (supabase.auth.currentUser!.appMetadata['provider'] == 'apple') {
      await revokeSignInWithApple();
    }

    await supabase
        .from('users')
        .update({'status': 'inactive'}).eq('id', user!.id);

    signOut();
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
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
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String baptismalName,
    required String nickName,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'baptismal_name': baptismalName,
          'nick_name': nickName,
        },
      );

      final data = response.user?.toJson() ?? {};
      final userInfo = UserInfo.fromJson(data);
      user = userInfo;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getCurrentUser() async {
    try {
      final response = await supabase.auth.getUser();
      final data = response.user?.toJson() ?? {};
      user = UserInfo.fromJson(data);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // 나는 함수 반환형이 이렇게 되어있음. 필요한 방향으로 알아서 바꿔 사용하면 될 것 같다
  Future<void> revokeSignInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final String authCode = appleCredential.authorizationCode;

      final String privateKey = [
        dotenv.env['APPLE_PRIVATE_KEY_LINE1'],
        dotenv.env['APPLE_PRIVATE_KEY_LINE2'],
        dotenv.env['APPLE_PRIVATE_KEY_LINE3'],
        dotenv.env['APPLE_PRIVATE_KEY_LINE4'],
        dotenv.env['APPLE_PRIVATE_KEY_LINE5'],
        dotenv.env['APPLE_PRIVATE_KEY_LINE6'],
      ].join('\n');

      const String teamId = 'ASP62C28F2';
      const String clientId = 'com.hun.tamim';
      const String keyId = 'J45C96KQM3';

      final String clientSecret = createJwt(
        teamId: teamId,
        clientId: clientId,
        keyId: keyId,
        privateKey: privateKey,
      );

      final accessToken = (await requestAppleTokens(
        authCode,
        clientSecret,
        clientId,
      ))['access_token'] as String;
      const String tokenTypeHint = 'access_token';

      await revokeAppleToken(
        clientId: clientId,
        clientSecret: clientSecret,
        token: accessToken,
        tokenTypeHint: tokenTypeHint,
      );

      return;
    } on Exception {
      rethrow;
    }
  }

  // JWT 생성 함수
  String createJwt({
    required String teamId,
    required String clientId,
    required String keyId,
    required String privateKey,
  }) {
    final jwt = JWT(
      {
        'iss': teamId,
        'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000,
        'exp': (DateTime.now().millisecondsSinceEpoch ~/ 1000) + 3600,
        'aud': 'https://appleid.apple.com',
        'sub': clientId,
      },
      header: {
        'kid': keyId,
        'alg': 'ES256',
      },
    );

    final key = ECPrivateKey(privateKey);
    return jwt.sign(key, algorithm: JWTAlgorithm.ES256);
  }

// 사용자 토큰 취소 함수
  Future<void> revokeAppleToken({
    required String clientId,
    required String clientSecret,
    required String token,
    required String tokenTypeHint,
  }) async {
    final url = Uri.parse('https://appleid.apple.com/auth/revoke');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'token': token,
        'token_type_hint': tokenTypeHint,
      },
    );

    if (response.statusCode == 200) {
      // 토큰이 성공적으로 취소됨
      return;
    } else {
      throw Exception('토큰 취소 중 오류 발생 : ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> requestAppleTokens(
    String authorizationCode,
    String clientSecret,
    String clientId,
  ) async {
    final response = await http.post(
      Uri.parse('https://appleid.apple.com/auth/token'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': authorizationCode,
        'grant_type': 'authorization_code',
        // 'redirect_uri': 'YOUR_REDIRECT_URI', // 필요시 설정
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('토큰 요청 실패: ${response.body}');
    }
  }
}
