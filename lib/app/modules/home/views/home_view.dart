import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnaksara/app/modules/home/controllers/home_controller.dart';
import 'package:learnaksara/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Map<String, String>> contentData = [
    {
      'title': 'Sejarah Aksara Bima',
      'content': 'Sejarah aksara Bima dimulai dari...',
      'imageUrl': 'https://via.placeholder.com/250',
    },
    {
      'title': 'Aksara Bima',
      'content': 'Aksara Bima adalah...',
      'imageUrl': 'https://via.placeholder.com/250',
    },
    {
      'title': 'Informasi tentang Aplikasi',
      'content': 'Aplikasi ini dibuat untuk...',
      'imageUrl': 'https://via.placeholder.com/250',
    },
    {
      'title': 'Penggunaan Aksara',
      'content': 'Penggunaan aksara ini sangat luas...',
      'imageUrl': 'https://via.placeholder.com/250',
    },
    {
      'title': 'Pelestarian Aksara',
      'content': 'Pelestarian aksara ini dilakukan melalui...',
      'imageUrl': 'https://via.placeholder.com/250',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color(0xFF8491F2)],
          ),
        ),
        child: Obx(() {
          if (controller.user.value == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome, ${controller.user.value!.nama}!',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        _buildUserDropdown(),
                      ],
                    ),
                  ),
                  _buildMainCard(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          for (int index = 0; index < 8; index++)
                            _buildCircleButton(index, controller),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildContentCard(),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            );
          }
        }),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildUserDropdown() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.account_circle, color: Colors.white, size: 40),
      onSelected: (value) {
        if (value == 'logout') {
          controller.logout();
        } else if (value == 'profile') {}
      },
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: 'profile',
          child: Text('Profil'),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Logout'),
        ),
      ],
    );
  }

  Widget _buildMainCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              'assets/images/belajar.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: Text(
                'Mari Belajar Aksara Bima!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(int index, HomeController controller) {
    final buttonLabels = [
      'Aksara',
      'Permainan',
      'History',
      'Sejarah',
      'User',
      'Progress',
      'Statistik',
      'Laporan',
    ];
    final buttonIcons = [
      Icons.favorite,
      Icons.shopping_bag,
      Icons.phone_android,
      Icons.access_alarm,
      Icons.person,
      Icons.abc_sharp,
      Icons.access_alarms_rounded,
      Icons.ac_unit
    ];

    if (index < 0 || index >= buttonLabels.length) {
      return Container();
    }

    return Obx(() {
      String? userRole = controller.user.value?.role;
      bool showButton = userRole != "user" || index < 4;

      return Visibility(
        visible: showButton,
        child: InkWell(
          onTap: () {
            switch (index) {
              case 0: // Aksara
                Get.toNamed(Routes.CONTENT);
                break;
              case 1: // Latihan
                Get.toNamed(Routes.PELATIHAN);
                break;
              case 2: // Permainan
                Get.toNamed(Routes.PERMAINAN);
                break;
              case 3: // Sejarah
                Get.toNamed(Routes.SEJARAH);
                break;
              case 4: // User (Admin Only)

                break;
              case 5: // Progress (Admin Only)

                break;
              case 6: // Statistik (Admin Only)

                break;
              case 7: // Laporan (Admin Only)

                break;
            }
          },
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Icon(
                  buttonIcons[index],
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                buttonLabels[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.book_online),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: contentData.map((data) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildSingleContentCard(
                    title: data['title']!,
                    content: data['content']!,
                    imageUrl: data['imageUrl']!,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleContentCard({
    required String title,
    required String content,
    required String imageUrl,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
