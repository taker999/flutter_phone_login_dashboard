import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dashboard/view/dashboard_page.dart';
import '../../login/view/login_page.dart';
import '../provider/auth_provider.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if (authState.user != null) {
      return const DashboardPage();
    }

    return const LoginPage();
  }
}