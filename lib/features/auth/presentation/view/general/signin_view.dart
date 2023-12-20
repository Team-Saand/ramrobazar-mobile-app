import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar_mobile_app/config/constants/theme_constant.dart';

import '../../../../../config/router/app_route.dart';
import '../../viewmodel/auth_view_model.dart';

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
    final smallerGap = SizedBox(height: screenSize.height * 0.015);
    final buttonWidth = screenSize.width;
    final textFieldWidth = screenSize.width;
    final gap = SizedBox(height: screenSize.height * 0.04);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                gap,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Log in\n",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: ThemeConstant.textColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login to your account.',
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ]),
                  ),
                ),
                // gap,
                gap,
                // gap,
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        width: textFieldWidth,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z0-9]'))
                          ],
                          controller: _userNameController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: Icon(Icons.person),
                            label: Text('Username'),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        width: textFieldWidth,
                        child: TextFormField(
                          obscureText: _isObscured,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("Forgot password?")],
                ),
                gap,
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.accentColor,
                        ),
                        width: buttonWidth,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ThemeConstant.accentColor)),
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
                          child: const Text('Log In'),
                        ),
                      ),
                      smallerGap,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "or",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        width: buttonWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoute.signup);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          'assets/images/google.png'))),
                              const SizedBox(
                                width: 60,
                              ),
                              const Text('Login with Google'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
