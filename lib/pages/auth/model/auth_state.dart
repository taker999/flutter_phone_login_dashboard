import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  final bool isLoading;
  final bool isOtpSent;
  final String verificationId;
  final String? error;
  final User? user;

  const AuthState({
    this.isLoading = false,
    this.isOtpSent = false,
    this.verificationId = '',
    this.error,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isOtpSent,
    String? verificationId,
    String? error,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isOtpSent: isOtpSent ?? this.isOtpSent,
      verificationId: verificationId ?? this.verificationId,
      error: error,
      user: user ?? this.user,
    );
  }
}