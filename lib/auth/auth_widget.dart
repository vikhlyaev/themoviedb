import 'package:flutter/material.dart';
import 'package:themoviedb/main/main_screen_widget.dart';
import 'package:themoviedb/theme/user_colors.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to your account'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
          ),
          SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            child: Text('Register'),
          ),
          SizedBox(height: 25),
          Text(
            'If you signed up but didn`t get your verification email, click here to have it resent.',
          ),
          SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            child: Text('Verify email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      setState(() {
        errorText = null;
      });
      Navigator.of(context).pushReplacementNamed('/main');
    } else {
      setState(() {
        errorText = 'Incorrect login or password';
      });
    }
  }

  void _resetPassword() {
    print('Reset Password');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ErrorWidget(errorText: errorText),
        Text('Username'),
        SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
        ),
        SizedBox(height: 20),
        Text('Password'),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          obscureText: true,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _auth,
                child: Text('Login'),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextButton(
                onPressed: _resetPassword,
                child: Text('Reset password'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF44336),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Center(child: Text(errorText)),
    );
  }
}
