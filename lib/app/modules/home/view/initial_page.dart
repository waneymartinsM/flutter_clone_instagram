import 'package:clone_instagram/app/model/images_url.dart';
import 'package:clone_instagram/app/modules/home/repository/home_repository.dart';
import 'package:clone_instagram/app/modules/home/store/home_store.dart';
import 'package:clone_instagram/app/widgets/user_post.dart';
import 'package:clone_instagram/generated/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final HomeStore controller = Modular.get();
  final HomeRepository repository = HomeRepository();
  final TextEditingController usernameController = TextEditingController();
  bool animatedLike = false;

  void onInit() async {
    await controller.recoverUserData();
    setState(() {
      usernameController.text = controller.userModel.username;
    });
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: SvgPicture.asset(
          'assets/images/font_instagram.svg',
          color: Colors.black,
          height: 35,
        ),
        actions: [
          IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.squarePlus,
                color: Colors.black,
              ),
              onPressed: () {
                Modular.to.pushNamed('/home/publication');
              }),
          IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.heart,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userStories(),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            Column(
              children: List.generate(imagesUrl.length, (index) {
                return const UserPost();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget userStories() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 15,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: Stack(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(imagesUrl[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 19,
                              height: 19,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.add_circle,
                                color: blue,
                                size: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 70,
                      child: Text(
                        controller.userModel.username,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  imagesUrl.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: storyBorderColor,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    imagesUrl[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const SizedBox(
                          width: 70,
                          child: Text(
                            'username',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
