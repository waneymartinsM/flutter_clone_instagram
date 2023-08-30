import 'package:clone_instagram/app/model/images_url.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);
  @override
  _ReelsPageState createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Reels',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/camera.png",
                  height: 25, color: Colors.white)),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imagesUrl.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imagesUrl[index]), fit: BoxFit.cover)),
            child: Stack(
              children: [
                _buildContainer(),
                _buildReels(index),
              ],
            ),
          );
        });
  }

  Widget _buildReels(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildVideoInfo(index),
            _buildInteractions(),
          ],
        ),
      ],
    );
  }

  Widget _buildVideoInfo(int index) {
    return Flexible(
      flex: 14,
      child: Column(
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 12,
            title: Text(
              'Username - Seguir',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(imagesUrl[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ExpandableText(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              expandText: 'mais',
              collapseOnTextTap: true,
              expandOnTextTap: true,
              maxLines: 1,
              linkColor: Colors.grey,
              style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 5,
            title: Text(
              'The Neighbourhood - Sweater Weather',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: IconButton(
                icon: Image.asset(
                  "assets/icons/ondas_audio.png",
                  height: 18,
                  color: Colors.white,
                ),
                iconSize: 15,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractions() {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              icon: Image.asset("assets/icons/coracao.png",
                  height: 25, color: Colors.white),
              onPressed: () {}),
          Text('184 mil',
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          const SizedBox(height: 10),
          IconButton(
              icon: Image.asset("assets/icons/bate_papo_liso.png",
                  height: 23, color: Colors.white),
              onPressed: () {}),
          Text('1.664',
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          const SizedBox(height: 10),
          IconButton(
              icon: Image.asset("assets/icons/mandar.png",
                  height: 23, color: Colors.white),
              onPressed: () {}),
          const SizedBox(height: 10),
          IconButton(
              icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
              onPressed: () {}),
          const SizedBox(height: 10),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://m.media-amazon.com/images/I/71QZDxLwv3L._AC_SL1422_.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.3), Colors.transparent],
            begin: const Alignment(0, -0.75),
            end: const Alignment(0, 0.1)),
      ),
    );
  }
}
