import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar/config/constants/theme_constant.dart';
import 'package:ramrobazar/core/common/snackbar/snackbar_message.dart';

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
    final gap = SizedBox(height: screenSize.height * 0.03);
    final iconHeight = screenSize.height * 0.03;
    final fieldHeight = screenSize.height * 0.06;
    const fontSizee = 15.0;

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
                        height: fieldHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z0-9]'))
                          ],
                          controller: _userNameController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: Icon(Icons.phone, size: iconHeight),
                            label: const Text(
                              ' Phone number',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: '98231234567',
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Phone number is empty",
                                  color: Colors.red);
                              return null;
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
                        height: fieldHeight,
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          obscureText: _isObscured,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              prefixIcon: Icon(Icons.lock, size: iconHeight),
                              label: const Text(
                                ' Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: fontSizee),
                              ),
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
                              showMessageToUser(
                                  context: context,
                                  message: "Password is empty",
                                  color: Colors.red);

                              return null;
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
                  children: [
                    Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                smallerGap,
                smallerGap,
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
                        height: fieldHeight,
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
                          child: const Text(
                            'Log In',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      gap,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "or",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: buttonWidth,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child:
                                      Image.asset('assets/images/google.png')),
                              const SizedBox(
                                width: 60,
                              ),
                              const Text('Login with Google'),
                            ],
                          ),
                        ),
                      ),
                      gap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                {Navigator.pushNamed(context, AppRoute.signup)},
                            child: const Text(
                              "Don't have an account? Sign Up?",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
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
