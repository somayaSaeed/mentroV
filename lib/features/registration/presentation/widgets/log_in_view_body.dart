import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/features/registration/presentation/widgets/header.dart';
import 'package:mentroverso/features/registration/presentation/widgets/log_in_Form.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_resources.dart';
import 'footer.dart';

class LogInBody extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   LogInBody(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorResources.gry3.withOpacity(0.25),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Header(
              text: 'Welcome back!',
            ),

            const Spacer(
              flex: 2,
            ),
            LogInForm(
              emailController: emailController,
              passwordController: passwordController,
            ),
            const Spacer(
              flex: 1,
            ),
            footer(
              text1: 'Don’t have an account?',
              text2: ' Sign up ',
              buttonAction: () {
                if (formKey.currentState?.validate() == true) {
                }
              },
              textAction: () {
                GoRouter.of(context).push(AppRouter.kSignUp);

              }, buttonText: 'Log in',
            ),
          ],
        ),
      ),
    );
  }
}
