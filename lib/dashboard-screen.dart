import 'package:appmobile/login-screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  //  Data dummy
  final List<Map<String, String>> dummyData = [
    {
      "title": "Pesanan Baru",
      "description": "Anda menerima pesanan baru.",
      "date": "26 Apr 2026",
    },
    {
      "title": "Pembayaran",
      "description": "Pembayaran berhasil.",
      "date": "25 Apr 2026",
    },
    {
      "title": "Pengiriman",
      "description": "Sedang dikirim.",
      "date": "24 Apr 2026",
    },
    {"title": "Promo", "description": "Diskon 50%.", "date": "23 Apr 2026"},
    {
      "title": "Update",
      "description": "Sistem diperbarui.",
      "date": "22 Apr 2026",
    },
    {
      "title": "Notifikasi",
      "description": "Pesan baru masuk.",
      "date": "21 Apr 2026",
    },
    {
      "title": "Akun",
      "description": "Profil diperbarui.",
      "date": "20 Apr 2026",
    },
    {
      "title": "Keamanan",
      "description": "Login baru terdeteksi.",
      "date": "19 Apr 2026",
    },
    {
      "title": "Transaksi",
      "description": "Transaksi sukses.",
      "date": "18 Apr 2026",
    },
    {
      "title": "Info",
      "description": "Informasi sistem.",
      "date": "17 Apr 2026",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Selamat datang, $email",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, index) {
                final item = dummyData[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(item['description']!),
                        SizedBox(height: 5),
                        Text(
                          item['date']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
