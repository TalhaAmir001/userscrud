import 'package:flutter/material.dart';
import 'package:userscrud/configs/routes/routes_names.dart';
import 'package:userscrud/model/user.dart';
import 'package:userscrud/view/add_user_view.dart';
import 'package:userscrud/view/edit_user_view.dart';
import 'package:userscrud/view/users_list_view.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.showUsersList:
        return MaterialPageRoute(builder: (BuildContext context) =>  UserListView());

      case RoutesName.addUser:
        return MaterialPageRoute(builder: (BuildContext context) => AddUserView());

      case RoutesName.editUser:
        if (settings.arguments is User) {
          final user = settings.arguments as User;
          return MaterialPageRoute(
            builder: (BuildContext context) => EditUserView(item: user),
          );
        } else{
          return MaterialPageRoute(builder: (_){
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          });
        }

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}