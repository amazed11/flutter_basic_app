import 'package:ecommerce/screens/register/register_screen.dart';
import 'package:ecommerce/services/api_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();

  final passwordController = TextEditingController();
  bool? isLogging = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    "Please login to your account",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter your email...",
                      border: OutlineInputBorder(),
                    ),
                    validator: (data) {
                      if (data?.isEmpty ?? true) {
                        return 'Email is required';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(data.toString())) {
                        return 'Email must be validate';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (data) {
                      if (data?.isEmpty ?? true) {
                        return 'पस्स्वोर्ड हान्नुहोला';
                      }
                      if (data!.length < 6 || data.length > 10) {
                        return 'password length must be greater then 6 and less then 10';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter your password...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  isLogging == true
                      ? const LinearProgressIndicator(
                          color: Colors.purple,
                        )
                      : Container(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      onPressed: () async {
                        setState(() {
                          isLogging = true;
                        });
                        bool? login = await ApiServices().login(context,
                            email: emailcontroller.text,
                            password: passwordController.text);
                        if (login == true) {
                          setState(() {
                            isLogging = false;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Server failed to response")));
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                      text: TextSpan(
                    text: "Don't have an account ?",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          style: const TextStyle(color: Colors.purple),
                          text: " Register here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => RegisterScreen()));
                            }),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
