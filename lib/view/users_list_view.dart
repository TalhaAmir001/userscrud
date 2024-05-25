import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userscrud/configs/routes/routes_names.dart';
import 'package:userscrud/model/user.dart';
import 'package:userscrud/model/user_menu_option.dart';
import 'package:userscrud/services/offline_database_helper.dart';
import 'package:userscrud/view/add_user_view.dart';
import 'package:userscrud/view_model/user_viewmodel.dart';

class UserListView extends StatelessWidget {
  UserMenuOptions? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users CRUD'),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          // viewModel.setUsers(_dbHelper.users() as List<User>);  //Potential Problem 1
          return ListView.builder(
            itemCount: viewModel.users.length,
            itemBuilder: (context, index) {
              final item = viewModel.users[index];
              return ListTile(
                // title: Text(item.id.toString()+". "+item.userName),
                title: Text((index+1).toString()+". "+item.userName),
                subtitle: Text(item.profession),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                  onSelected: (value) {
                    if(value == 'edit'){
                      // print();
                      Navigator.pushNamed(context, RoutesName.editUser, arguments: item);
                      // print(item.toString());
                    }else if(value == 'delete'){
                      viewModel.deleteUser(item.id);
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final newItem = User(id: DateTime.now().toString(), userName: 'Item ${DateTime.now()}', profession: 'Profession ${DateTime.now()}');
          // context.read<UserViewModel>().addItem(newItem);
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddUserView()));
          Navigator.pushNamed(context, RoutesName.addUser);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
