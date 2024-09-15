import 'package:go_router/go_router.dart';
import 'package:todo_app/add_task_page.dart';
import 'package:todo_app/home_page.dart';
import 'package:todo_app/login_page.dart';
import 'package:todo_app/register_page.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: "/",
      name: "registerPage",
      builder: (context, state) => RegisterPage()),
  GoRoute(
      path: "/login",
      name: "loginPage",
      builder: (context, state) => LoginPage()),
  GoRoute(
      path: "/tasks",
      name: "tasksPage",
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
            path: "add_task",
            name: "addTaskPage",
            builder: (context, state) => AddTaskPage())
      ])
]);
