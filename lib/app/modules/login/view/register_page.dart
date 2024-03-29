import 'dart:io';
import 'package:clone_instagram/app/model/images_url.dart';
import 'package:clone_instagram/app/model/user.dart';
import 'package:clone_instagram/app/modules/login/store/register_store.dart';
import 'package:clone_instagram/app/widgets/alert.dart';
import 'package:clone_instagram/app/widgets/text_field_input.dart';
import 'package:clone_instagram/app/utils/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: CircularProgressIndicator(backgroundColor: blue))
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: Container()),
            SvgPicture.asset('assets/images/font_instagram.svg',
                color: Colors.black, height: 64),
            const SizedBox(height: 35),
            _buildProfilePicture(),
            _buildForm(),
            _buildButtonRegister(),
            const SizedBox(height: 12),
            Flexible(flex: 2, child: Container()),
            Divider(color: Colors.grey.shade500),
            _buildTextSignIn(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return GestureDetector(
      child: Stack(
        children: [
          controller.file == null
              ? const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://nitreo.com/img/igDefaultProfilePic.png'))
              : const CircleAvatar(radius: 64),
          Positioned(
            bottom: -10,
            left: 80,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_a_photo, color: Colors.black54)),
          ),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
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
      ],
    );
  }

  Widget _buildButtonRegister() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: TextButton(
          onPressed: () async {
            await _register();
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
              backgroundColor: Colors.blue),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white))
              : Text('Cadastrar',
                  style: GoogleFonts.poppins(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildTextSignIn() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Já tem uma conta? ',
              style: GoogleFonts.poppins(color: Colors.grey.shade600)),
          GestureDetector(
            onTap: () {
              Modular.to.navigate('/login');
            },
            child: Text(' Entrar',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, color: blue)),
          ),
        ],
      ),
    );
  }

  _register() async {
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
  }
}
