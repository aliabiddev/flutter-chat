import 'package:flutter/material.dart';
import 'package:my_chat_app/pages/home_page.dart';
import 'package:my_chat_app/utils/constants.dart';
import 'package:my_chat_app/pages/register_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.of(context).pushAndRemoveUntil(HomePage.route(), (route) => false);
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: ListView(
            padding: formPadding,
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              spacer,
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              spacer,
              ElevatedButton(
                onPressed: _isLoading ? null : _signIn,
                child: const Text('Login'),
              ),
              spacer,
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(RegisterPage.route());
                },
                child: const Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}