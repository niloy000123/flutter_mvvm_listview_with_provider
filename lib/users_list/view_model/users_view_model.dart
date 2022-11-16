import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/model/users_error.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/model/users_list_model.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/repo/api_status.dart';
import 'package:flutter_mvvm_listview_with_provider/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;

  bool get loading => _loading;
  UserError? get userError => _userError;

  List<UserModel> get userListModel => _userListModel;

  UsersViewModel() {
    getUser();
  }
  setLoding(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setuserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUser() async {
    setLoding(true);
    var response = await UserServices.getUser();
    if (response is Success) {
      setuserListModel(response.responce as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponce);
      setUserError(userError);
    }
    setLoding(false);
  }
}
