import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userscrud/configs/routes/routes.dart';
import 'package:userscrud/configs/routes/routes_names.dart';
import 'package:userscrud/view_model/user_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel()..fetchUsers(),
      child: MaterialApp(
        title: 'Users CRUD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: UserListView(),
        initialRoute: RoutesName.showUsersList,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
