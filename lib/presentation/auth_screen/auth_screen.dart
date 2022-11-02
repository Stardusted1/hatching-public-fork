import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hatching/core/blocs/auth_cubit/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('login_using_providers'.tr()),
          const SizedBox(height: 20),
          _buildLoginButton(
            text: "Google",
            icon: const FaIcon(FontAwesomeIcons.google),
            action: () => context.read<AuthCubit>().login(),
          ),
          _buildLoginButton(
            text: "Facebook",
            icon: const FaIcon(FontAwesomeIcons.facebook),
          ),
          _buildLoginButton(
            text: "Twitter",
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          _buildLoginButton(
            text: "GitHub",
            icon: const FaIcon(FontAwesomeIcons.github),
          ),
          _buildLoginButton(
            text: "Phone",
            icon: const FaIcon(FontAwesomeIcons.phone),
          ),
          _buildLoginButton(
            text: "Email",
            icon: const FaIcon(FontAwesomeIcons.inbox),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton({
    VoidCallback? action,
    required String text,
    required Widget icon,
  }) =>
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            primary: Colors.grey[100],
            elevation: 0,
          ),
          onPressed: action,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              icon,
            ],
          ),
        ),
      );
}
