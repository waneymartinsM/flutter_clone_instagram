import 'package:clone_instagram/app/model/images_url.dart';
import 'package:clone_instagram/app/widgets/animated_like.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPost extends StatefulWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  bool animatedLike = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserPosted(),
          _buildPostImage(),
          _buildIconsButton(),
          _buildAmountOfLikes(),
          const SizedBox(height: 5),
          _buildNameAndCaption(),
          const SizedBox(height: 5),
          _buildComments(),
          const SizedBox(height: 10),
          _buildAddComment(),
          const SizedBox(height: 5),
          _buildPublicationTime(),
        ],
      ),
    );
  }

  Widget _buildUserPosted() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imagesUrl[2]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Username',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return GestureDetector(
      onTap: () {
        setState(() {
          animatedLike = true;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              imagesUrl[10],
              fit: BoxFit.cover,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: animatedLike ? 1 : 0,
            child: AnimatedLike(
              isAnimating: animatedLike,
              duration: const Duration(milliseconds: 400),
              child: Image.asset("assets/icons/coracao_red.png",
                  color: Colors.white, height: 100),
              onEnd: () {
                setState(() {
                  animatedLike = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                icon: Image.asset("assets/icons/coracao_red.png"),
                onPressed: () {}),
            IconButton(
                icon: Image.asset("assets/icons/bate_papo_liso.png",
                    height: 23, color: Colors.black),
                onPressed: () {}),
            IconButton(
                icon: Image.asset("assets/icons/mandar.png",
                    height: 23, color: Colors.black),
                onPressed: () {}),
          ],
        ),
        IconButton(
          icon: Image.asset("assets/icons/salvar_instagram.png",
              height: 23, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildAmountOfLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '1.234 curtidas',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameAndCaption() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'username ',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.black),
            ),
            TextSpan(
              text: 'Legenda do usuario',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComments() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        'Ver todos os 25 comentários',
        style: GoogleFonts.poppins(
          color: Colors.black.withOpacity(0.5),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildAddComment() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imagesUrl[0]), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Adicione um comentário...',
                style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('😂', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 12),
              const Text('❤️', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              Icon(Icons.add_circle,
                  color: Colors.black.withOpacity(0.5), size: 18),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPublicationTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        'Há 1 dia',
        style: GoogleFonts.poppins(
          color: Colors.black.withOpacity(0.5),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
