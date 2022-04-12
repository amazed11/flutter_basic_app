import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/api_services.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.girl_outlined,
                    color: Colors.purple,
                    size: 150,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Welcome",
                    style: GoogleFonts.anton(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Please register your account",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter your email...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Username"),
                      hintText: "Enter your username...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      label: Text("Phone"),
                      hintText: "Enter your phone...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter your password...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      onPressed: () {
                        ApiServices().register(
                          context,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                          username: usernameController.text,
                        );
                      },
                      child: const Text("Register"),
                    ),
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
