import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthResult {
  final User? user;
  final bool isNewUser;
  const AuthResult({this.user, this.isNewUser = false});
}

class AuthService {
  final FirebaseAuth _auth;

  AuthService({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  String? _lastError;
  String? get lastError => _lastError;

  Future<User?> authWithEmail(String email, String password) async {
    _lastError = null;
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      _lastError = _mapFirebaseError(e.code);
      return null;
    }
  }

  Future<User?> registerWithEmail(String email, String password) async {
    _lastError = null;
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      _lastError = _mapFirebaseError(e.code);
      return null;
    }
  }

  Future<AuthResult> authWithGoogle() async {
    _lastError = null;
    try {
      final googleSignIn = GoogleSignIn(
        serverClientId:
            '858841789135-63evmvn9na6pj8cvl3cljgm0ushftdug.apps.googleusercontent.com',
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return const AuthResult();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential result =
          await _auth.signInWithCredential(credential);
      final bool isNew = result.additionalUserInfo?.isNewUser ?? false;
      return AuthResult(user: result.user, isNewUser: isNew);
    } on FirebaseAuthException catch (e) {
      _lastError = _mapFirebaseError(e.code);
      return const AuthResult();
    } catch (e) {
      _lastError = 'Ошибка входа через Google: $e';
      return const AuthResult();
    }
  }

  Future<AuthResult> authWithApple() async {
    _lastError = null;
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final credential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final UserCredential result =
          await _auth.signInWithCredential(credential);
      final bool isNew = result.additionalUserInfo?.isNewUser ?? false;
      return AuthResult(user: result.user, isNewUser: isNew);
    } on FirebaseAuthException catch (e) {
      _lastError = _mapFirebaseError(e.code);
      return const AuthResult();
    } catch (_) {
      _lastError = 'Ошибка входа через Apple';
      return const AuthResult();
    }
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Этот email уже зарегистрирован';
      case 'invalid-email':
        return 'Некорректный email';
      case 'weak-password':
        return 'Пароль должен содержать минимум 6 символов';
      case 'user-not-found':
        return 'Пользователь не найден';
      case 'wrong-password':
        return 'Неверный пароль';
      case 'invalid-credential':
        return 'Неверный email или пароль';
      case 'too-many-requests':
        return 'Слишком много попыток. Попробуйте позже';
      default:
        return 'Произошла ошибка ($code)';
    }
  }

  Future<void> resetPasswordEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapFirebaseError(e.code));
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }
}
