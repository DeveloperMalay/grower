import 'package:go_router/go_router.dart';
import 'package:grower/main.dart';
import 'package:grower/presentation/onboarding_screen/welcome_screen.dart';
import '../presentation/authentication/custom_bachground_screen.dart';
import '../presentation/authentication/widget/login_widget.dart';
import '../presentation/authentication/widget/otp_widget.dart';
import '../presentation/calculator/calculated_result_screen/calculated_result_screen.dart';
import '../presentation/calculator/calculation_screen/calculator_screen.dart';
import '../presentation/onboarding_screen/welcome_back_screen.dart';
import '../presentation/pdf_preview/pdf_preview_screen.dart';
import '../presentation/update_profile/update_profile_screen.dart';
import '../presentation/update_profile/user_profile_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/welcome",
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: "/welcomeback",
      builder: (context, state) => const WelcomeBackScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) =>
          const CustomBackgroundWidget(widget: LoginWidget(), isLogin: true),
    ),
    GoRoute(
      name: "otp",
      path: "/otp/:email",
      builder: (context, state) => CustomBackgroundWidget(
          widget: OtpWidget(email: state.params["email"].toString()),
          isLogin: false),
    ),
    GoRoute(
      path: "/calculator",
      builder: (context, state) => const CalculatorScreen(),
    ),
    GoRoute(
      path: "/calculatorResult",
      builder: (context, state) => const CalculatedResultScreen(),
    ),
    GoRoute(
      path: "/pdf",
      builder: (context, state) => const PdfPreviewScreen(),
    ),
    // GoRoute(
    //   name: 'updateprofile',
    //   path: "/updateprofile/:email",
    //   builder: (context, state) =>
    //       UpdateProfileScreen(email: state.params['email'].toString()),
    // ),
    GoRoute(
      path: "/userprofile",
      builder: (context, state) => const UserProfileScreen(),
    ),
  ],
);
