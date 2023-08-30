import 'package:clone_instagram/app/model/images_url.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Loja',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.class_outlined, size: 20, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.dehaze_rounded, size: 20, color: Colors.black),
          ),
        ],
      ),
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
          _buildCategories(),
          const SizedBox(height: 12),
          _buildImages(),
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Pesquisar',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          shopCategories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  shopCategories[index],
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImages() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: List.generate(imagesShop.length, (index) {
        return Container(
          width: (size.width - 2) / 2,
          height: (size.width - 2) / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imagesShop[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}
