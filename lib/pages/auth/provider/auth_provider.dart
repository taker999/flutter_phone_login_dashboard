import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../services/auth/auth_service.dart';
import '../../../services/auth/provider/auth_service_provider.dart';
import '../model/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  late final StreamSubscription<User?> _authSubscription;

  AuthNotifier(this._authService) : super(const AuthState()) {
    _init();
  }

  void _init() {
    _authSubscription = _authService.authStateChanges().listen((user) {
      state = state.copyWith(user: user);
    });
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  Future<void> sendOtp(String phoneNumber) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _authService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _authService.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          state = state.copyWith(
            isLoading: false,
            error: 'Verification failed: ${e.message}',
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          state = state.copyWith(
            verificationId: verificationId,
            isOtpSent: true,
            isLoading: false,
            error: null,
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          state = state.copyWith(
            verificationId: verificationId,
            isLoading: false,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Error: ${e.toString()}',
      );
    }
  }

  Future<void> verifyOtp(String otp) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId,
        smsCode: otp,
      );

      await _authService.signInWithCredential(credential);
      state = state.copyWith(isLoading: false);
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        error: 'Invalid OTP. Please try again.',
      );
    }
  }

  void resetForm() {
    state = state.copyWith(
      isOtpSent: false,
      verificationId: '',
      error: null,
    );
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthNotifier(authService);
});
