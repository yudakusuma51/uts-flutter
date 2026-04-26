import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();

  void sendReset() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 2));

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Link reset telah dikirim ke email Anda")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Lupa Password"),
              SizedBox(height: 20),

              Form(
                key: _formKey,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Email wajib diisi";
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                      return "Format salah";
                    return null;
                  },
                ),
              ),

              SizedBox(height: 20),

              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: sendReset,
                      child: Text("Kirim Link Reset"),
                    ),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kembali ke Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
