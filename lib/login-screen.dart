import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPasswordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorMessage;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 2));

    if (emailController.text == "admin@test.com" &&
        passwordController.text == "Admin123") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login berhasil")));
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: emailController.text,
      );
    } else {
      setState(() {
        errorMessage = "Login gagal";
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage!)));
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 40, child: Text("A-M")),
                SizedBox(height: 10),
                Text("APP MOBILE"),

                SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Username",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return "Email wajib diisi";
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                            return "Format email salah";
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return "Password wajib diisi";
                          if (value.length < 8) return "Minimal 8 karakter";
                          if (!RegExp(r'[A-Za-z]').hasMatch(value) ||
                              !RegExp(r'[0-9]').hasMatch(value))
                            return "Harus huruf & angka";
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot');
                    },
                    child: Text("Lupa Password?"),
                  ),
                ),

                SizedBox(height: 10),

                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(onPressed: login, child: Text("Login")),

                SizedBox(height: 10),
                Text("Version 1.0.0"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
