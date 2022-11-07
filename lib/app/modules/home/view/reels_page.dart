import 'package:clone_instagram/app/model/images_url.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        title: const Text(
          'Reels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.photo_camera_outlined,
            ),
          ),
        ],
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: imagesUrl.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    imagesUrl[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                          ],
                          begin: const Alignment(0, -0.75),
                          end: const Alignment(0, 0.1),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                          ],
                          begin: const Alignment(0, -0.75),
                          end: const Alignment(0, 0.1),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 14,
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    minLeadingWidth: 0,
                                    horizontalTitleGap: 12,
                                    title: const Text(
                                      'Username - Seguir',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    leading: CircleAvatar(
                                      radius: 14,
                                      backgroundImage: NetworkImage(
                                        imagesUrl[index],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 14),
                                    child: ExpandableText(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                      expandText: 'mais',
                                      collapseOnTextTap: true,
                                      expandOnTextTap: true,
                                      maxLines: 1,
                                      linkColor: Colors.grey,
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    minLeadingWidth: 0,
                                    horizontalTitleGap: 5,
                                    title: const Text(
                                      'The Neighbourhood - Sweater Weather',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    leading: IconButton(
                                        icon: const FaIcon(
                                          FontAwesomeIcons.music,
                                          color: Colors.white,
                                        ),
                                        iconSize: 15,
                                        onPressed: () {}),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.heart,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  const Text(
                                    '184 mil',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  IconButton(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.comment,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  const Text(
                                    '1.664',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  IconButton(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.paperPlane,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  const SizedBox(height: 10),
                                  IconButton(
                                      icon: const FaIcon(
                                        FontAwesomeIcons.ellipsis,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          "https://m.media-amazon.com/images/I/71QZDxLwv3L._AC_SL1422_.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
