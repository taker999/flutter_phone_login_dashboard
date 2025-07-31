import 'package:flutter/material.dart';

import '../../pages/auth/view/auth_wrapper.dart';
import '../../pages/dashboard/view/dashboard_page.dart';
import '../../pages/login/view/login_page.dart';
import '../../pages/order_list/view/order_list_page.dart';
import '../../pages/profile/view/profile_page.dart';
import 'route_names.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.home: (context) => const AuthWrapper(),
    RouteNames.login: (context) => const LoginPage(),
    RouteNames.dashboard: (context) => const DashboardPage(),
    RouteNames.orderList: (context) => const OrderListPage(),
    RouteNames.profile: (context) => const ProfilePage(),
  };
}