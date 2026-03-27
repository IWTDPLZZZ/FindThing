import 'package:firebase_auth/firebase_auth.dart';
import 'package:find_thing/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late AuthService authService;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authService = AuthService(auth: mockFirebaseAuth);
  });

  group('AuthService email/password', () {
    test('authWithEmail returns user and clears lastError on success', () async {
      final mockUser = MockUser();
      final mockUserCredential = MockUserCredential();

      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(
        () => mockFirebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => mockUserCredential);

      final result = await authService.authWithEmail(
        'test@example.com',
        'password123',
      );

      expect(result, equals(mockUser));
      expect(authService.lastError, isNull);
    });

    test('authWithEmail returns null and sets lastError on FirebaseAuthException',
        () async {
      when(
        () => mockFirebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        FirebaseAuthException(code: 'wrong-password'),
      );

      final result = await authService.authWithEmail(
        'test@example.com',
        'wrong',
      );

      expect(result, isNull);
      expect(authService.lastError, 'Неверный пароль');
    });

    test('registerWithEmail returns user on success', () async {
      final mockUser = MockUser();
      final mockUserCredential = MockUserCredential();

      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(
        () => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => mockUserCredential);

      final result = await authService.registerWithEmail(
        'new@example.com',
        'password123',
      );

      expect(result, equals(mockUser));
      expect(authService.lastError, isNull);
    });

    test(
        'registerWithEmail returns null and sets lastError on FirebaseAuthException',
        () async {
      when(
        () => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        FirebaseAuthException(code: 'email-already-in-use'),
      );

      final result = await authService.registerWithEmail(
        'existing@example.com',
        'password123',
      );

      expect(result, isNull);
      expect(authService.lastError, 'Этот email уже зарегистрирован');
    });

    test('resetPasswordEmail calls FirebaseAuth.sendPasswordResetEmail', () async {
      when(
        () => mockFirebaseAuth.sendPasswordResetEmail(
          email: any(named: 'email'),
        ),
      ).thenAnswer((_) async {});

      await authService.resetPasswordEmail('reset@example.com');

      verify(
        () => mockFirebaseAuth.sendPasswordResetEmail(
          email: 'reset@example.com',
        ),
      ).called(1);
    });
  });
}

