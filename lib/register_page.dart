import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/bloc/register_page/register_page_bloc.dart';

import 'bloc/password_visibility_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController registerController;
  late final TextEditingController passwordController;
  late final FocusNode registerNode;
  late final FocusNode passwordNode;

  @override
  void initState() {
    super.initState();
    registerController = TextEditingController();
    passwordController = TextEditingController();
    registerNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterPageBloc()),
        BlocProvider(create: (context) => PasswordVisibilityCubit())
      ],
      child: Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: SafeArea(
          child: Stack(
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
                        "Register Page",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                registerNode.unfocus();
                              },
                              onFieldSubmitted: (String query) {
                                passwordNode.requestFocus();
                              },
                              controller: registerController,
                              focusNode: registerNode,
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
                                                .read<PasswordVisibilityCubit>()
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
                            Builder(builder: (context) {
                              return SizedBox(
                                  width: double.infinity,
                                  height: 70,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        surfaceTintColor:
                                            Colors.yellow.shade300,
                                        elevation: 7,
                                        backgroundColor: Colors.yellow.shade300,
                                        shape: BeveledRectangleBorder(),
                                      ),
                                      onPressed: () {
                                        context.read<RegisterPageBloc>().add(
                                            RegisterPageRegisterClicked(
                                                registerController.text,
                                                passwordController.text));
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600),
                                      )));
                            }),
                            SizedBox(height: 16),
                            Text("OR"),
                            TextButton(
                              onPressed: () {
                                context.goNamed("loginPage");
                              },
                              child: Text(
                                "Log In",
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
              BlocConsumer<RegisterPageBloc, RegisterPageState>(
                builder: (context, state) {
                  if (state is RegisterPageCheckingCredentials) {
                    return Container(
                      color: Colors.cyan.withOpacity(0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Center(child: CircularProgressIndicator())],
                      ),
                    );
                  } else if (state is RegisterPageCredentialsApproved) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check, size: 36),
                        Center(child: Text("Register Approved")),
                      ],
                    );
                  }
                  return Container();
                },
                listener: (context, state) {
                  if (state is RegisterPageCredentialsApproved) {
                    context.goNamed("tasksPage");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Center(child: Text("Logged In Successfully")),
                      backgroundColor: Colors.green,
                    ));
                  } else if (state is RegisterPageCredentialsRejected) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Center(child: Text("Incorrect Credentials")),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    registerController.dispose();
    passwordController.dispose();
    registerNode.dispose();
    passwordNode.dispose();
  }
}
