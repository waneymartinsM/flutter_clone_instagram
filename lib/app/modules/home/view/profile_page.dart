import 'package:clone_instagram/app/model/images_url.dart';
import 'package:clone_instagram/app/modules/home/store/home_store.dart';
import 'package:clone_instagram/app/widgets/profile_label_count.dart';
import 'package:clone_instagram/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HomeStore controller = Modular.get();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  void onInit() async {
    await controller.recoverUserData();
    setState(() {
      usernameController.text = controller.userModel.username;
      bioController.text = controller.userModel.bio;
    });
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, index) {
          return [
            _buildAppBar(),
            _buildProfileInformation(),
          ];
        },
        body: _buildPublications(),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.lock_outline, color: Colors.black),
          const SizedBox(width: 5),
          Text(
            controller.userModel.username,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/icons/postagem_instagram.png", height: 23),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dehaze_outlined, color: Colors.black),
        ),
        // IconButton(
        //   onPressed: () {
        //     FirebaseAuth.instance.signOut();
        //     Modular.to.navigate('/login');
        //   },
        //   color: Colors.black,
        //   icon: const Icon(Icons.exit_to_app),
        // ),
      ],
    );
  }

  Widget _buildProfileInformation() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileLabelCount(),
          _buildBio(),
          const SizedBox(height: 12),
          _buildEditProfile(),
          const SizedBox(height: 15),
          _buildHighlights(),
          _buildTabBar(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return const TabBar(
      indicatorWeight: 1,
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(icon: Icon(Icons.grid_on, color: Colors.black)),
        Tab(icon: Icon(Icons.assignment_ind_outlined, color: Colors.black)),
      ],
    );
  }

  Widget _buildHighlights() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return index != 0
                ? Container(
                    width: 80,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                        radius: 30, backgroundColor: Colors.grey.shade200))
                : SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey.shade400)),
                          child: const Icon(Icons.add, size: 25),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Novo',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }

  Widget _buildEditProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                height: 35,
                decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Editar perfil',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )),
          ),
          const SizedBox(width: 5),
          Container(
              alignment: Alignment.center,
              width: 50,
              height: 35,
              decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset("assets/icons/adicionar.png", height: 18)),
        ],
      ),
    );
  }

  Widget _buildBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.userModel.username,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              controller.userModel.bio,
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileLabelCount() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          userStories(),
          const ProfileLabelCount(count: '140', labelText: 'Publicações'),
          const ProfileLabelCount(count: '140', labelText: 'Seguidores'),
          const ProfileLabelCount(count: '140', labelText: 'Seguindo'),
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
              image: NetworkImage(imagesUrl[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
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
                padding: const EdgeInsets.only(right: 20, left: 15, bottom: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
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
                              width: 29,
                              height: 29,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Icon(Icons.add_circle,
                                  color: blue, size: 29),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
