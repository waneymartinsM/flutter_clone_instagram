import 'package:clone_instagram/app/model/user.dart';
import 'package:clone_instagram/app/modules/home/repository/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final repository = HomeRepository();

  @observable
  UserModel userModel = UserModel();

  @action
  recoverUserData() async {
    bool response = repository.checkCurrentUser();
    if (response) {
      userModel = await repository.recoverUserData();
    }
  }

  @action
  clearVariables() {
    userModel = UserModel.clean();
  }
}
