import 'package:clocki_tracker/ui/auth/admin_login_screen.dart';
import 'package:clocki_tracker/ui/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isAdmin = false;
  void _onPrivacyPolicyTapped() {
    // Handle Privacy Policy action
    print("Privacy Policy tapped");
  }

  void _onTermsAndConditionsTapped() {
    // Handle Terms and Conditions action
    print("Terms and Conditions tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF311B92), Color(0xFF512DA8), Color(0xFF9575CD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.2),
                //     blurRadius: 16,
                //     offset: const Offset(0, 6),
                //   ),
                // ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "ClockiTrackr",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Time • Work • Accountability",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      print("Email: $email, Password: $password");
                      // TODO: Implement login logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Sign In",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  // OR Divider
                  Row(
                    children: const [
                      Expanded(child: Divider(color: Colors.white)),
                      Text(" OR ", style: TextStyle(color: Colors.white)),
                      Expanded(child: Divider(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Sign Up
                  GestureDetector(
                    onTap: () {
                      // Handle sign up action
                      print("Sign Up tapped");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      // Handle sign up action
                      print("Sign Up tapped");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminSignupScreen()));
                    },
                    child: const Text(
                      "Create a Admin Account? Open here",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Privacy and Terms links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _onPrivacyPolicyTapped,
                        child: const Text("Privacy Policy",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14)),
                      ),
                      const SizedBox(width: 15),
                      const Text("|",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: _onTermsAndConditionsTapped,
                        child: const Text("Terms & Conditions",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
