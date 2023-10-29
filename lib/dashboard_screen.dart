import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Color.fromARGB(255, 4, 105, 44),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg.jpg"), // Ganti dengan path ke gambar latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Selamat datang di Dashboard",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              DashboardIconsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromARGB(255, 1, 86, 24), width: 4),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    'assets/download.png'), // Ganti dengan path ke gambar profil
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nama: Tri Wahyu Utami",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "NPM: 21670005",
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              "Kelas: 5A",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DashboardIconsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: <Widget>[
        DashboardIcon(
          icon: Icons.person,
          label: "Profil", // Tambahkan label sesuai ikon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        DashboardIcon(
          icon: Icons.favorite,
          label: "Favorit", // Tambahkan label sesuai ikon
        ),
        DashboardIcon(
          icon: Icons.email,
          label: "Email", // Tambahkan label sesuai ikon
        ),
        DashboardIcon(
          icon: Icons.camera,
          label: "Kamera", // Tambahkan label sesuai ikon
        ),
      ],
    );
  }
}

class DashboardIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color iconColor; // Tambahkan properti warna ikon

  DashboardIcon({
    required this.icon,
    required this.label,
    this.onPressed = _dummyOnPressed,
    this.iconColor = const Color.fromARGB(255, 33, 243, 142), // Warna ikon default adalah hitam
  });

  static void _dummyOnPressed() {
    print("Tombol belum dikonfigurasi.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: iconColor, // Gunakan warna ikon yang telah ditentukan
            ),
            iconSize: 48,
            onPressed: onPressed,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
