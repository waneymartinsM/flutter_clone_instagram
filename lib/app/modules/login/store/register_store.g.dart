// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  late final _$userModelAtom =
      Atom(name: '_RegisterStore.userModel', context: context);

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  late final _$fileAtom = Atom(name: '_RegisterStore.file', context: context);

  @override
  XFile? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(XFile? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$getImageAsyncAction =
      AsyncAction('_RegisterStore.getImage', context: context);

  @override
  Future<XFile?> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
file: ${file}
    ''';
  }
}
