import 'package:clone_instagram/app/model/images_url.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildSearch(),
          const SizedBox(height: 15),
          _buildPublications(),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(width: 15),
          Container(
            width: size.width - 40,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFEEEEEE),
            ),
            child: TextField(
              cursorColor: Colors.grey.withOpacity(0.5),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Pesquisar',
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }

  Widget _buildPublications() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: List.generate(imagesUrl.length, (index) {
        return Container(
          width: (size.width - 3) / 3,
          height: (size.width - 3) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imagesUrl[index]), fit: BoxFit.cover),
          ),
        );
      }),
    );
  }
}
