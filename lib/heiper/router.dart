import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/main.dart';
import 'package:grower/presentation/authentication/otp_screen.dart';
import 'package:grower/presentation/calculator/reset_screen/reset_loading_screen.dart';
import 'package:grower/presentation/onboarding_screen/welcome_screen.dart';
import '../presentation/authentication/login_screen.dart';
import '../presentation/calculator/calculated_result_screen/calculated_result_screen.dart';
import '../presentation/calculator/calculation_screen/calculator_screen.dart';
import '../presentation/onboarding_screen/welcome_back_screen.dart';
import '../presentation/pdf_preview/pdf_preview_screen.dart';
import '../presentation/update_profile/cubit/user_details/user_details_cubit.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: "/welcome", builder: (context, state) => const WelcomeScreen()),
    GoRoute(
        path: "/welcomeback",
        builder: (context, state) => const WelcomeBackScreen()),
    GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
    // const CustomBackgroundWidget(widget: LoginWidget(), isLogin: true)),
    GoRoute(
        name: "otp",
        path: "/otp/:email",
        builder: (context, state) =>
            OtpScreen(email: state.params['email'].toString())),
    //  CustomBackgroundWidget(
    //     widget: OtpWidget(email: state.params["email"].toString()),
    //     isLogin: false)),
    GoRoute(
        name: "calculator",
        path: "/calculator/:profile_setup",
        builder: (context, state) => CalculatorScreen(
              profile_setup: state.params['profile_setup'].toString(),
            )),
    GoRoute(
        path: "/calculatorResult",
        builder: (context, state) => const CalculatedResultScreen()),
    GoRoute(
        path: "/pdf", builder: (context, state) => const PdfPreviewScreen()),
    GoRoute(
        path: "/resetloadingscreen",
        builder: (context, state) => const ResetLoadingScreen()),
  ],
);
