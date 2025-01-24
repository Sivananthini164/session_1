import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:session_1/screens/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Password visibility flag
  bool passWordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey, // Key to manage the form validation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                const SizedBox(height: 40),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 20),
                _buildConfirmPasswordField(),
                const SizedBox(height: 40),
                _buildSignUpButton(),
                const SizedBox(height: 20),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Header with "Create Account" text
  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          "assets/logo.png", // Logo image
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 40),
        const Text(
          "Create Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Sign up to get started",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff9F9F9F),
          ),
        ),
      ],
    );
  }

  // Email input field
  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        label: const Text("Email"),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "user@gmail.com",
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Color(0xff9F9F9F),
        ),
        prefixIcon: const Icon(
          Icons.email,
          size: 20,
          color: Colors.black54,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email.';
        }
        // Regex for email validation
        String emailPattern =
            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
        if (!RegExp(emailPattern).hasMatch(value)) {
          return 'Please enter a valid email address.';
        }
        return null;
      },
    );
  }

  // Password input field
  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: passWordVisibility,
      decoration: InputDecoration(
        label: const Text("Password"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "**********",
        prefixIcon: const Icon(
          Icons.lock,
          size: 20,
          color: Colors.black54,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            passWordVisibility ? Icons.visibility_off : Icons.visibility,
            color: Colors.black54,
          ),
          onPressed: () {
            setState(() {
              passWordVisibility = !passWordVisibility;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password.';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long.';
        }
        return null;
      },
    );
  }

  // Confirm password field
  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: passWordVisibility,
      decoration: InputDecoration(
        label: const Text("Confirm Password"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "**********",
        prefixIcon: const Icon(
          Icons.lock,
          size: 20,
          color: Colors.black54,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password.';
        }
        if (value != _passwordController.text) {
          return 'Passwords do not match.';
        }
        return null;
      },
    );
  }

  // Sign Up button
  Widget _buildSignUpButton() {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor:
            MaterialStateProperty.all(const Color(0xff6746CC)),
        minimumSize:
            MaterialStateProperty.all(const Size(double.infinity, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // Handle sign-up logic
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account Created Successfully")),
          );
        }
      },
      child: const Text(
        "Sign Up",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Login button
  Widget _buildLoginButton() {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff9F9F9F),
          ),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () { 
                  Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));// Navigate back to the login page
                },
              text: "Login",
              style: const TextStyle(
                color: Color(0xff6746CC),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
