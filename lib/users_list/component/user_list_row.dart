import 'package:flutter/material.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/model/users_list_model.dart';

class UserListRow extends StatelessWidget {
  const UserListRow({super.key, required this.userModel, required this.onTap});
  final UserModel userModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Text(
              userModel.name!,
              style: TextStyle(color: Colors.black),
            ),
            Text(userModel.email!),
          ],
        ),
      ),
    );
  }
}
