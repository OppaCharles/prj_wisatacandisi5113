import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernamaController = TextEditingController();
  final TextEditingController _passwordnamaController = TextEditingController();

  String _errorText = "";
  bool _obscurePassword = true;

  void _signUp() async {
    final String nama = _namaController.text.trim();
    final String username = _usernamaController.text.trim();
    final String password = _passwordnamaController.text.trim();

    if (password.length < 8 ||
        !password.contains(RegExp('r[A-Z]')) ||
        !password.contains(RegExp('r[A-Z]')) ||
        !password.contains(RegExp('r[0-9]')) ||
        !password.contains(RegExp('r[!@#%^\$&*?<>]'))) {
      setState(
        () {
          _errorText =
              "Minimal 8 karakter, kombinasi [A-Z], [0-9], !@#%^\$&*?<>";
        },
      );
      return;
    }
    print('**Sign Up Berhasil**');
    print('Nama : $nama');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _usernamaController,
                  decoration: InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordnamaController,
                  decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      border: OutlineInputBorder(),
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(_obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility))),
                  obscureText: _obscurePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
