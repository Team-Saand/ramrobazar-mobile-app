import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar_mobile_app/features/auth/domain/entity/user_entity.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/snackbar_message.dart';
import '../viewmodel/auth_view_model.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  var _isObscured = true;
  var _isObscured1 = true;

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    _userNameController.text = '';
    _passwordController.text = '';
    _confirmPasswordController.text = '';
    _isObscured = true;

    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        title: const Text('Sign Up'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(children: [
              const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/orange-icon.png')),
              gap,
              gap,
              SizedBox(
                width: screenSize.width,
              ),
              SizedBox(
                width: textFieldWidth,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-z 0-9]'))
                  ],
                  controller: _userNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Username',
                    hintText: 'sabin',
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
              gap,
              SizedBox(
                width: textFieldWidth,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: _isObscured,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    hintText: '**********',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: _isObscured
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password!';
                    }
                    return null;
                  },
                ),
              ),
              gap,
              SizedBox(
                width: textFieldWidth,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: _isObscured1,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Confirm Password',
                      hintText: '**********',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscured1 = !_isObscured1;
                            });
                          },
                          icon: _isObscured1
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password!';
                    }
                    return null;
                  },
                ),
              ),
              gap,
              gap,
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      if (_passwordController.text.trim().length > 7) {
                        if (_passwordController.text.trim() !=
                            _confirmPasswordController.text.trim()) {
                          showMessageToUser(
                              context: context,
                              message:
                                  "Password and Confirm password do not match!",
                              color: Colors.red);
                        } else {
                          UserEntity user = UserEntity(
                              userName: _userNameController.text.trim(),
                              password: _passwordController.text.trim());
                          ref
                              .read(authViewModelProvider.notifier)
                              .registerUser(context, user);
                        }
                      } else {
                        showMessageToUser(
                            context: context,
                            message: "Password is shorter than 7 characters!",
                            color: Colors.red);
                      }
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ),
              smallerGap,
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.signinRoute);
                  },
                  child: const Text('Sign In'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
