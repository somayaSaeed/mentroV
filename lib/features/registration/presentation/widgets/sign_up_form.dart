import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/widgets/text_field.dart';
import 'build_gender_option.dart';
import 'package:mentroverso/core/utils/validators.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController facultyController;
  final TextEditingController majorController;
  final Function(String) onGenderSelected;


  const SignUpForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.facultyController,
    required this.majorController,
    required this.onGenderSelected,

  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                text: 'First name',
                label: 'First name',
                validator: (text) => validateField(text, 'first name'),
                controller: widget.firstNameController,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomTextFormField(
                text: 'Last name',
                label: 'Last name',
                validator: (text) => validateField(text, 'last name'),
                controller: widget.lastNameController,
              ),
            ),
          ],
        ),
        CustomTextFormField(
          text: 'Email',
          label: 'Enter your email',
          validator: validateEmail,
          controller: widget.emailController,
        ),
        CustomTextFormField(
          text: 'Password',
          label: 'Enter your password',
          validator: validatePassword,
          controller: widget.passwordController,
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: ColorResources.neutralGray,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
        ),
        CustomTextFormField(
          text: 'Confirm Password',
          label: 'Confirm your password',
          validator: (text) =>
              validateConfirmPassword(text, widget.passwordController.text),
          controller: widget.confirmPasswordController,
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: ColorResources.neutralGray,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
        ),
        CustomTextFormField(
          text: 'Faculty',
          label: 'Enter your Faculty',
          validator: (text) => validateField(text, 'Faculty'),
          controller: widget.facultyController,
        ),
        CustomTextFormField(
          text: 'Major',
          label: 'Enter your Major',
          validator: (text) => validateField(text, 'Major'),
          controller: widget.majorController,
        ),
        const SizedBox(height: 10),

        GenderPicker(
          onGenderSelected: widget.onGenderSelected,
        ),
      ],
    );
  }
}
