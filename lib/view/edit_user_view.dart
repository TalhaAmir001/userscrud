import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userscrud/model/user.dart';
import 'package:userscrud/view_model/user_viewmodel.dart';

class EditUserView extends StatelessWidget {
  final User item;
  final TextEditingController _userNameController;
  final TextEditingController _professionController;

  EditUserView({Key? key, required this.item}) : _userNameController = TextEditingController(text: item.userName)
  , _professionController = TextEditingController(text: item.profession)
  , super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                labelText: 'User Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _professionController,
              decoration: InputDecoration(
                labelText: 'Profession',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_userNameController.text.isNotEmpty) {
                  final updatedItem = User(
                    id: item.id,
                    userName: _userNameController.text,
                    profession: _professionController.text
                  );
                  context.read<UserViewModel>().updateUser(updatedItem);
                  Navigator.pop(context);
                }
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
