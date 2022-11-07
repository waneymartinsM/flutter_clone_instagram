import 'dart:io';
import 'package:clone_instagram/app/model/user.dart';
import 'package:clone_instagram/app/modules/login/repository/login_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController bioController = TextEditingController();
final TextEditingController usernameController = TextEditingController();

abstract class _RegisterStore with Store {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @observable
  UserModel userModel = UserModel();

  @observable
  XFile? file;

  @action
  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future upload(String path, String email) async {
    File file = File(path);
    try {
      String ref = 'images/img-$email.jpg';
      final img = storage.ref(ref);
      await img.putFile(file);
      return await img.getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  List validateFields(UserModel model) {
    if (model.username.isEmpty) {
      return [
        AlertType.info,
        "Atenção",
        "Insira o seu nome!",
      ];
    } else if (model.email.isEmpty) {
      return [
        AlertType.info,
        "Atenção",
        "Insira o seu e-mail!",
      ];
    } else if (EmailValidator.validate(model.email) == false) {
      return [
        AlertType.info,
        "Atenção",
        "E-mail é inválido!",
      ];
    } else if (model.password.isEmpty) {
      return [
        AlertType.info,
        "Atenção",
        "Insira sua senha!",
      ];
    } else if (model.password.length < 7) {
      return [
        AlertType.info,
        "Atenção",
        "Sua senha tem menos de 7 caracteres",
      ];
    } else if (model.bio.isEmpty) {
      return [
        AlertType.info,
        "Atenção",
        "Insira uma biografia!",
      ];
    }
    return [true];
  }

  Future<bool> signUpUser(UserModel model) async {
    final repository = LoginRepository();
    final user = await repository.createAccount(model);
    if (user != null) {
      return await repository.registerUser(model, user);
    } else {
      return false;
    }
  }
}
