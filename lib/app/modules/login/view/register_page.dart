import 'dart:io';
import 'package:clone_instagram/app/model/images_url.dart';
import 'package:clone_instagram/app/model/user.dart';
import 'package:clone_instagram/app/modules/login/store/register_store.dart';
import 'package:clone_instagram/app/widgets/alert.dart';
import 'package:clone_instagram/app/widgets/text_field_input.dart';
import 'package:clone_instagram/generated/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterStore controller = Modular.get();
  final FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController uidController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool loading = false;
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: blue,
              ),
            )
          : SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(),
                    ),
                    SvgPicture.asset(
                      'assets/images/font_instagram.svg',
                      color: Colors.black,
                      height: 64,
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                      child: Stack(
                        children: [
                          controller.file == null
                              ? const CircleAvatar(
                                  radius: 64,
                                  backgroundImage: NetworkImage(
                                    'https://nitreo.com/img/igDefaultProfilePic.png',
                                  ),
                                )
                              : const CircleAvatar(
                                  radius: 64,
                                  //backgroundImx0age: FileImage(file),
                                ),
                          Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldInput(
                      controller: usernameController,
                      hintText: 'Digite seu nome',
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 24),
                    TextFieldInput(
                      controller: emailController,
                      hintText: 'Digite seu e-mail',
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    TextFieldInput(
                      controller: passwordController,
                      hintText: 'Digite sua senha',
                      textInputType: TextInputType.visiblePassword,
                      isPass: true,
                    ),
                    const SizedBox(height: 24),
                    TextFieldInput(
                      controller: bioController,
                      hintText: 'Digite sua biografia',
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        child: TextButton(
                          onPressed: () async {
                            final user = UserModel(
                              uid: uidController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              username: usernameController.text,
                              bio: bioController.text,
                            );
                            List result = controller.validateFields(user);
                            if (result.first == true) {
                              setState(() => loading = true);
                              String url = '';
                              if (file != null) {
                                url = await controller.upload(
                                  file!.path,
                                  user.email,
                                );
                              }
                              user.userImage = url;

                              bool result = await controller.signUpUser(user);
                              if (result) {
                                Modular.to.navigate('/home');
                                setState(() => loading = false);
                              } else {
                                alertDialog(
                                  context,
                                  AlertType.error,
                                  'Atenção',
                                  'Ocorreu um erro ao criar conta!',
                                );
                              }
                            } else {
                              final info = result[0];
                              final title = result[1];
                              final description = result[2];
                              alertDialog(
                                context,
                                info,
                                title,
                                description,
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 100,
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child: loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      flex: 2,
                      child: Container(),
                    ),
                    Divider(
                      color: Colors.grey.shade500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            'Já tem uma conta?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Modular.to.navigate('/login');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              ' Entrar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
