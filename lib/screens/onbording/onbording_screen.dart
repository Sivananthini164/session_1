import 'package:flutter/material.dart';
import 'package:session_1/screens/login/login_screen.dart';
import 'package:session_1/screens/signup/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildLogo(),
            const SizedBox(height: 20.0),
            _buildTitle(),
            const SizedBox(height: 20.0),
            _buildDescription(),
            const SizedBox(height: 40.0),
            _buildLoginButton(context),
            const SizedBox(height: 10.0),
            _buildSignUpButton(context),
          ],
        ),
      ),
    );
  }

  // Logo widget
  Widget _buildLogo() {
    return Image.asset(
      "assets/logo.png", // Logo image
      width: 100,
      height: 100,
    );
  }

  // Title text widget
  Widget _buildTitle() {
    return const Text(
      'Welcome to Our App',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Description text widget
  Widget _buildDescription() {
    return const Text(
      'This is the best app for all your needs. Please login or sign up to continue.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  // Login button widget
  Widget _buildLoginButton(BuildContext context) {
    return _buildActionButton(
      label: 'Login',
      onPressed: () {
        // Navigate to login screen
        // Navigator.pushNamed(context, '/login');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
    );
  }

  // Sign up button widget
  Widget _buildSignUpButton(BuildContext context) {
    return _buildActionButton(
      label: 'Sign Up',
      onPressed: () {
        // Navigate to signup screen
        // Navigator.pushNamed(context, '/signup');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()));
      },
    );
  }

  // Reusable action button widget
  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 50),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // Text color
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(label),
    );
  }
}
