import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/bloc/login_page/login_page_bloc.dart';
import 'package:todo_app/bloc/password_visibility_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController loginController;
  late final TextEditingController passwordController;
  late final FocusNode loginNode;
  late final FocusNode passwordNode;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
    loginNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PasswordVisibilityCubit()),
        BlocProvider(create: (context) => LoginPageBloc())
      ],
      child: Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: SafeArea(
          child: BlocBuilder<LoginPageBloc, LoginPageState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login_rounded,
                            size: 64,
                            color: Colors.cyan.shade300,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Login Page",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 80),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Username",
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide.none)),
                                  onTapOutside: (mouse) {
                                    loginNode.unfocus();
                                  },
                                  onFieldSubmitted: (String query) {
                                    passwordNode.requestFocus();
                                  },
                                  controller: loginController,
                                  focusNode: loginNode,
                                ),
                                SizedBox(height: 16),
                                BlocBuilder<PasswordVisibilityCubit, bool>(
                                  builder: (context, passwordVisibilityState) {
                                    return TextFormField(
                                      obscureText: !passwordVisibilityState,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<
                                                        PasswordVisibilityCubit>()
                                                    .switchVisibility();
                                              },
                                              icon: Icon(passwordVisibilityState
                                                  ? Icons.visibility
                                                  : Icons.visibility_off)),
                                          filled: true,
                                          hintText: "Password",
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.zero,
                                              borderSide: BorderSide.none)),
                                      onTapOutside: (mouse) {
                                        passwordNode.unfocus();
                                      },
                                      onFieldSubmitted: (String password) {},
                                      controller: passwordController,
                                      focusNode: passwordNode,
                                    );
                                  },
                                ),
                                SizedBox(height: 24),
                                SizedBox(
                                    width: double.infinity,
                                    height: 70,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          surfaceTintColor:
                                              Colors.yellow.shade300,
                                          elevation: 7,
                                          backgroundColor:
                                              Colors.yellow.shade300,
                                          shape: BeveledRectangleBorder(),
                                        ),
                                        onPressed: () {
                                          context.read<LoginPageBloc>().add(
                                              LoginPageSignInClicked(
                                                  loginController.text,
                                                  passwordController.text));
                                        },
                                        child: Text(
                                          "Log In",
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600),
                                        ))),
                                SizedBox(height: 16),
                                Text("OR"),
                                TextButton(
                                  onPressed: () {
                                    context.goNamed("registerPage");
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.cyan,
                                      shape: BeveledRectangleBorder()),
                                ),
                                SizedBox(height: 24)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocConsumer<LoginPageBloc, LoginPageState>(
                    builder: (context, state) {
                      if (state is LoginPageCheckingCredentials) {
                        return Container(
                          color: Colors.cyan.withOpacity(0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: CircularProgressIndicator())
                            ],
                          ),
                        );
                      } else if (state is LoginPageCredentialsApproved) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, size: 36),
                            Center(child: Text("Login Approved")),
                          ],
                        );
                      }
                      return Container();
                    },
                    listener: (context, state) {
                      print(state);
                      if (state is LoginPageCredentialsApproved) {
                        context.goNamed("tasksPage");
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
    passwordController.dispose();
    loginNode.dispose();
    passwordNode.dispose();
  }
}
