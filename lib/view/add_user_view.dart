import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userscrud/model/user.dart';
import 'package:userscrud/view_model/user_viewmodel.dart';

class AddUserView extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _professionController,
                decoration: InputDecoration(
                  labelText: 'Profession',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a profession';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final viewModel = context.read<UserViewModel>();
                    final newUser = User(
                      id: viewModel.getNextId(),
                      userName: _userNameController.text,
                      profession: _professionController.text,
                    );
                    context.read<UserViewModel>().addUser(newUser);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
