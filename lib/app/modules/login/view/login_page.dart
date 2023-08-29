import 'package:clone_instagram/app/modules/login/store/login_store.dart';
import 'package:clone_instagram/app/widgets/text_field_input.dart';
import 'package:clone_instagram/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore controller = Modular.get();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
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
          children: [
            Flexible(flex: 2, child: Container()),
            SvgPicture.asset('assets/images/font_instagram.svg',
                color: Colors.black, height: 64),
            const SizedBox(height: 64),
            _buildForm(),
            const SizedBox(height: 24),
            _buildButtonSignIn(),
            const SizedBox(height: 12),
            Flexible(flex: 2, child: Container()),
            Divider(color: Colors.grey.shade500),
            _buildTextSignUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        TextFieldInput(
          controller: emailController,
          onChanged: controller.setEmail,
          hintText: 'Digite seu e-mail',
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 24),
        TextFieldInput(
          controller: passwordController,
          onChanged: controller.setPassword,
          hintText: 'Digite sua senha',
          textInputType: TextInputType.visiblePassword,
          isPass: true,
        ),
      ],
    );
  }

  Widget _buildButtonSignIn() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: TextButton(
          onPressed: () {
            controller.signInWithEmailAndPassword(context);
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
              backgroundColor: blue),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white))
              : Text(
                  'Entrar',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }

  Widget _buildTextSignUp() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Não tem uma conta? ',
            style: GoogleFonts.poppins(color: Colors.grey.shade600),
          ),
          GestureDetector(
            onTap: () {
              Modular.to.pushNamed('/login/register');
            },
            child: Text(
              ' Cadastre-se',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
