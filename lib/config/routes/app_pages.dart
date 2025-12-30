import 'package:get/get.dart';
import 'package:meal_go/binding/auth_binding.dart';
import 'package:meal_go/config/routes/app_routes.dart';
import 'package:meal_go/feature/auth/views/screens/sign_in_screen.dart';
import 'package:meal_go/feature/auth/views/screens/sign_up_screen.dart';
import 'package:meal_go/feature/auth/views/screens/congratulations_screen.dart';
import 'package:meal_go/feature/home/views/screens/home_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.signin, page: () => const SignInScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
    GetPage(
      name: AppRoutes.congrats,
      page: () => const CongratulationsScreen(),
    ),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  ];
}
