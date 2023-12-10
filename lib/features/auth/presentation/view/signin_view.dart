import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar_mobile_app/config/constants/theme_constant.dart';

import '../../../../config/router/app_route.dart';
import '../viewmodel/auth_view_model.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  // Controllers for TextFormFields
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscured = true;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    _userNameController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final smallerGap = SizedBox(height: screenSize.height * 0.01);
    final buttonWidth = screenSize.width;
    final textFieldWidth = screenSize.width;
    final gap = SizedBox(height: screenSize.height * 0.03);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/orange-icon.png')),
              gap,
              gap,
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "Let's get started!\n",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: ThemeConstant.textColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Cuz every item deserves a second chance.',
                          style: TextStyle(
                            fontSize: 19,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ]),
                ),
              ),
              gap,
              gap,
              gap,
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: textFieldWidth,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-z0-9]'))
                        ],
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Username',
                          hintText: 'user',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username!';
                          }
                          return null;
                        },
                      ),
                    ),
                    smallerGap,
                    SizedBox(
                      width: screenSize.width,
                    ),
                    SizedBox(
                      width: textFieldWidth,
                      child: TextFormField(
                        obscureText: _isObscured,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Password',
                            hintText: '********',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                icon: _isObscured
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              gap,
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  children: [
                    SizedBox(
                      width: buttonWidth,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            await ref
                                .read(authViewModelProvider.notifier)
                                .loginUser(
                                  context,
                                  _userNameController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                          }
                        },
                        child: const Text('Sign In'),
                      ),
                    ),
                    smallerGap,
                    SizedBox(
                      width: buttonWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.signupRoute);
                        },
                        child: const Text('Sign Up'),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
