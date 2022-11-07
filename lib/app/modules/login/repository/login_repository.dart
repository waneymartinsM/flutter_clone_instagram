import 'package:clone_instagram/app/core/firebase_const.dart';
import 'package:clone_instagram/app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginRepository {
  Future<User?> createAccount(UserModel model) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      return user.user;
    } catch (e) {
      debugPrint(
        'Error [login_repository/createAccount]: $e',
      );
    }
    return null;
  }

  Future registerUser(UserModel model, User user) async {
    try {
      FirebaseFirestore.instance
          .collection(FirebaseConst.users)
          .doc(user.uid)
          .set({
        "id": user.uid,
        "username": model.username,
        "userImage": model.userImage,
        "email": model.email,
        "bio": model.bio,
      });
      return true;
    } on fireAuth.FirebaseAuthException catch (error) {
      String errorMessage;

      switch (error.code) {
        case "weak-password":
          errorMessage = "Senha fraca!";
          return errorMessage;

        case "invalid-email":
          errorMessage =
              "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;

        case "email-already-exists":
          errorMessage =
              "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
              "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }

  Future loginUser(UserModel model) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      return true;
    } on FirebaseAuthException catch (error) {
      String errorMessage;

      switch (error.code) {
        case "invalid-email":
          errorMessage = "Email é inválido!";
          return errorMessage;

        case "wrong-password":
          errorMessage = "Senha errada!";
          return errorMessage;

        case "user-not-found":
          errorMessage = "O usuário não existe.";
          return errorMessage;

        case "too-many-requests":
          errorMessage = "Muitas requisições. Tente mais tarde.";
          return errorMessage;

        case "operation-not-allowed":
          errorMessage = "Login com email e senha não está habilitado.";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
              "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }

  bool checkCurrentUser() {
    User? user = fireAuth.FirebaseAuth.instance.currentUser;
    return user != null ? true : false;
  }
}
