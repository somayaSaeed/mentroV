import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_routes.dart';
import 'package:mentroverso/features/registration/presentation/AuthService.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon:  FaIcon(FontAwesomeIcons.google,
              color: ColorResources.deepPink, size: 30),
          onPressed: () async {
            final AuthService authService = AuthService();
            User? user = await authService.signInWithGoogle();
            if (user != null) {
              if (context.mounted) {
                print("registered, ${user.email}");
                GoRouter.of(context).push(AppRouter.kLogIn);
              }
            } else {
              print("User sign-in failed".trim());
            }


          },
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook,
              color: ColorResources.deepPink, size: 30),
          onPressed: () {
          },
        ),
      ],
    );
  }
}
