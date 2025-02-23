import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.white.withOpacity(.25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      _HeaderText(),
                      SizedBox(height: 30),
                      _NameFields(),
                      SizedBox(height: 20),
                      _EmailField(),
                      SizedBox(height: 20),
                      _PasswordFields(),
                      SizedBox(height: 20),
                      _FacultyField(),
                      SizedBox(height: 20),
                      _MajorField(),
                      SizedBox(height: 20),
                      _GenderSelector(),
                      SizedBox(height: 30),
                      _ContinueWith(),
                      SizedBox(height: 30),
                      SignUpButton(),
                      SizedBox(height: 20),
                      _LoginPrompt(),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Create an account',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class _NameFields extends StatelessWidget {
  const _NameFields();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildTextField('First name')),
        const SizedBox(width: 10),
        Expanded(child: _buildTextField('Last name')),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return _buildTextField('Email');
  }
}

class _PasswordFields extends StatelessWidget {
  const _PasswordFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField('Password', isPassword: true),
        const SizedBox(height: 20),
        _buildTextField('Confirm Password', isPassword: true),
      ],
    );
  }
}

class _FacultyField extends StatelessWidget {
  const _FacultyField();

  @override
  Widget build(BuildContext context) {
    return _buildTextField('Faculty');
  }
}

class _MajorField extends StatelessWidget {
  const _MajorField();

  @override
  Widget build(BuildContext context) {
    return _buildTextField('Major');
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Gender: '),
        Row(
          children: [
            Radio(value: 'Male', groupValue: 'Gender', onChanged: (value) {}),
            const Text('Male'),
          ],
        ),
        Row(
          children: [
            Radio(value: 'Female', groupValue: 'Gender', onChanged: (value) {}),
            const Text('Female'),
          ],
        ),
      ],
    );
  }
}

class _ContinueWith extends StatelessWidget {
  const _ContinueWith();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Or continue with'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Text('Sign up',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}

class _LoginPrompt extends StatelessWidget {
  const _LoginPrompt();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account? '),
          GestureDetector(
            onTap: () {},
            child: const Text('Log in',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

Widget _buildTextField(String label, {bool isPassword = false}) {
  return Container(
    decoration: BoxDecoration(
      color: ColorResources.gry3,
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle:   Styles.textStyle12,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
