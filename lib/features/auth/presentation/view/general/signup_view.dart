import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar/config/constants/theme_constant.dart';
import 'package:ramrobazar/core/common/snackbar/snackbar_message.dart';
import 'package:ramrobazar/features/auth/domain/entity/user_entity.dart';

import '../../../../../config/router/app_route.dart';
import '../../viewmodel/auth_view_model.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  // Controllers for TextFormFields
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscured = true;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    _phoneController.text = '';
    _passwordController.text = '';
    _nameController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
                        text: "Sign Up\n",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: ThemeConstant.textColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up instantly',
                            style: TextStyle(
                              fontSize: 20,
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
                                RegExp('[a-z" "]'))
                          ],
                          controller: _nameController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: Icon(Icons.person, size: iconHeight),
                            label: const Text(
                              ' Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: 'Ramro Nepal',
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Name is empty",
                                  color: Colors.red);
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      smallerGap,
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
                          controller: _phoneController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: Icon(Icons.phone, size: iconHeight),
                            label: const Text(
                              ' Phone number',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: '9812345678',
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
                smallerGap,
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
                              List<String> strarray =
                                  _nameController.text.split(" ");
                              String firstName = "";
                              String middleName = "";
                              String lastName = "";
                              bool trueName = true;

                              print(strarray);
                              print(strarray.length);

                              if (strarray.length <= 1) {
                                trueName = false;
                                showMessageToUser(
                                    context: context,
                                    message: "Please provide your full name.",
                                    color: Colors.red);
                              } else if (strarray.length == 2) {
                                firstName = strarray[0];
                                lastName = strarray[1];
                              } else {
                                firstName = strarray[0];
                                lastName = strarray[strarray.length - 1];
                                for (var i = 1; i < strarray.length - 1; i++) {
                                  strarray[i] = strarray[i][0].toUpperCase() +
                                      strarray[i].substring(1);

                                  middleName += strarray[i];
                                }
                              }

                              firstName = firstName[0].toUpperCase() +
                                  firstName.substring(1);
                              lastName = lastName[0].toUpperCase() +
                                  lastName.substring(1);

                              if (trueName) {
                                UserEntity obj = UserEntity(
                                    first_name: firstName,
                                    middle_name: middleName,
                                    last_name: lastName,
                                    phone: _phoneController.text.trim(),
                                    password: _passwordController.text.trim());
                                await ref
                                    .read(authViewModelProvider.notifier)
                                    .registerUser(context, obj);
                              }
                            }
                          },
                          child: const Text(
                            'Sign Up',
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
                                {Navigator.pushNamed(context, AppRoute.signin)},
                            child: const Text(
                              "Already have an account? Log In?",
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
