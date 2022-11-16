import 'package:flutter/material.dart';
import 'package:flutter_mvvm_listview_with_provider/component/app_loding.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/component/user_list_row.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/model/users_list_model.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: _ui(usersViewModel),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return Container(
        child: Text(usersViewModel.userError!.message.toString()),
      );
    }
    return Column(
      children: [
        ...List.generate(
          usersViewModel.userListModel.length,
          (index) {
            UserModel userModel = usersViewModel.userListModel[index];
            return UserListRow(userModel: userModel, onTap: () async {});
          },
        )
      ],
    );
  }
}
