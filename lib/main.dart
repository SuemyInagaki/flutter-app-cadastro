import 'package:app_cadastro/views/user_form.dart';
import 'package:app_cadastro/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:app_cadastro/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:app_cadastro/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
