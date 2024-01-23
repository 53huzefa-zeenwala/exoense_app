import 'package:expense_app/core/app/styles.dart';
import 'package:expense_app/utils/app_assets.dart';
import 'package:expense_app/utils/build_context_ext.dart';
import 'package:expense_app/widgets/fetures/text_feild.dart';
import 'package:flutter/material.dart';

import '../../core/route/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.isMobileAndTabletScreen ? const SmallScreenWidget() : const LargeScreenWidget(),
    );
  }
}

class LargeScreenWidget extends StatefulWidget {
  const LargeScreenWidget({super.key});

  @override
  State<LargeScreenWidget> createState() => _LargeScreenWidgetState();
}

class _LargeScreenWidgetState extends State<LargeScreenWidget> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: linearGradient,
              ),
              height: context.screenHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.coinStack,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36),
                  ),
                ),
                // constraints: BoxConstraints(
                //   minHeight: context.screenHeight * 0.75,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: context.textTheme.headlineLarge?.copyWith(fontSize: 42),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: CustomField(
                        titleText: "Email Address",
                        hintText: "example@domain.com",
                        // isClear: false,
                        // isPassword: true,
                        suffixIcon: Icons.email,
                        onChange: (val) {
                          // print(val);
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: CustomField(
                        titleText: "Password",
                        hintText: "example@1234",
                        isClear: false,
                        isPassword: true,
                        suffixIcon: Icons.lock,
                        onChange: (val) {
                          // print(val);
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            fillColor: MaterialStatePropertyAll(rememberMe ? context.colorScheme.primary : Colors.white),
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                                print(rememberMe);
                                // _handleRemeberme(value);
                              });
                            },
                          ),
                          const Text(
                            "Remember Me",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const Text('Forgot Password?'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 350),
                      decoration: BoxDecoration(
                          gradient: linearGradient,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [BoxShadow(color: const Color(0xFF3E7C78).withOpacity(0.5), blurRadius: 20, spreadRadius: 0)]),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint("hello");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.3),
                          foregroundColor: context.colorScheme.primary,
                        ),
                        child: Text(
                          "Log In",
                          style: context.textTheme.titleMedium?.apply(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      "Or",
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleSmall,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 350),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        elevation: 5,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                                child: Image.asset(
                                  AppAssets.googleLogo,
                                  width: 30,
                                ),
                              ),
                              Text(
                                "Sign In with Google",
                                style: context.textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have account? ", style: context.textTheme.labelLarge),
                        InkWell(
                          onTap: () {
                            print("object");
                            AppRoute.signup.pushReplacement(context);
                          },
                          child: Text("Sign Up", style: context.textTheme.titleMedium?.apply(color: context.colorScheme.primary).copyWith()),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallScreenWidget extends StatefulWidget {
  const SmallScreenWidget({super.key});

  @override
  State<SmallScreenWidget> createState() => _SmallScreenWidgetState();
}

class _SmallScreenWidgetState extends State<SmallScreenWidget> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: linearGradient,
              ),
              padding: const EdgeInsets.only(bottom: 40, top: 10),
              width: double.infinity,
              height: context.screenHeight * 0.25 + 40,
              child: Image.asset(
                AppAssets.coinStack,
              ),
            ),
            Positioned(
              top: (context.screenHeight * 0.25),
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36),
                  ),
                ),
                // constraints: BoxConstraints(
                //   minHeight: context.screenHeight * 0.75,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: context.textTheme.headlineLarge?.copyWith(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: CustomField(
                        titleText: "Email Address",
                        hintText: "example@domain.com",
                        // isClear: false,
                        // isPassword: true,
                        suffixIcon: Icons.email,
                        onChange: (val) {
                          // print(val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: CustomField(
                        titleText: "Password",
                        hintText: "example@1234",
                        isClear: false,
                        isPassword: true,
                        suffixIcon: Icons.lock,
                        onChange: (val) {
                          // print(val);
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            fillColor: MaterialStatePropertyAll(rememberMe ? context.colorScheme.primary : Colors.white),
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                                print(rememberMe);
                                // _handleRemeberme(value);
                              });
                            },
                          ),
                          const Text(
                            "Remember Me",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 350),
                      decoration: BoxDecoration(
                          gradient: linearGradient,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [BoxShadow(color: const Color(0xFF3E7C78).withOpacity(0.5), blurRadius: 20, spreadRadius: 0)]),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint("hello");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.3),
                          foregroundColor: context.colorScheme.primary,
                        ),
                        child: Text(
                          "Log In",
                          style: context.textTheme.titleMedium?.apply(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      "Or",
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleSmall,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 350),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        elevation: 5,
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: context.isMobileScreen ? 2 : 5),
                                  child: Image.asset(
                                    AppAssets.googleLogo,
                                    width: context.isMobileScreen ? 25 : 30,
                                  ),
                                ),
                                Text(
                                  "Sign In with Google",
                                  style: context.textTheme.titleMedium,
                                )
                              ],
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have account? ", style: context.textTheme.labelLarge),
                        InkWell(
                          onTap: () {
                            print("object");
                            AppRoute.signup.pushReplacement(context);
                          },
                          child: Text("Sign Up", style: context.textTheme.titleMedium?.apply(color: context.colorScheme.primary).copyWith()),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
