import 'package:flutter/material.dart';
import 'package:pokedex/core/provider/service/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ApiService apiService = ApiService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      final response = await apiService.signIn(email, password);
      print('Response data: $response');
      if (response.containsKey('accessToken')) {
        String token = response['accessToken'];
        _showMessageDialog('Success', 'Login successful', () {
          Navigator.pushReplacementNamed(context, '/homePage',
              arguments: token);
        });
      } else {
        _showMessageDialog('Failure', 'Invalid credentials');
      }
    } catch (e) {
      print('Error: $e');
      _showMessageDialog('Failure', 'Connection refused');
    }
  }

  void _showMessageDialog(String title, String message,
      [VoidCallback? onOkPressed]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onOkPressed != null) {
                  onOkPressed();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Welcome to Pokedex',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _signIn, child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
