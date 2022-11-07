import 'package:clone_instagram/app/model/images_url.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SafeArea(
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
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 1,
              runSpacing: 1,
              children: List.generate(imagesUrl.length, (index) {
                return Container(
                  width: (size.width - 3) / 3,
                  height: (size.width - 3) / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imagesUrl[index]),
                        fit: BoxFit.cover),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
