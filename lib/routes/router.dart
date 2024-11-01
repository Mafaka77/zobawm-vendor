import 'package:get/route_manager.dart';
import 'package:zobawm_vendor_app/screens/become_partner_screen.dart';
import 'package:zobawm_vendor_app/screens/home_screen.dart';
import 'package:zobawm_vendor_app/screens/login_screen.dart';
import 'package:zobawm_vendor_app/screens/register_screen.dart';

final pages = [
  GetPage(
    name: '/login-screen',
    page: () => const LoginScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/become-partner-screen',
    page: () => const BecomePartnerScreen(),
  ),
  GetPage(
    name: '/register/:roles',
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeScreen(),
    transition: Transition.cupertino,
  )
];
