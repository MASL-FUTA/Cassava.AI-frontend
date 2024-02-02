import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/change_password_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/faq_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/terms_conditions_page.dart';
import 'package:masl_futa_agric/pages/scan_cassava_page.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('More'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CassavaScannerContainer(),
            MoreItem(
              text: 'Change Password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            ),
            MoreItem(
              text: 'Terms and Conditions',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TermsAndConditionsPage()),
                );
              },
            ),
            MoreItem(
              text: 'FAQ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaqPage()),
                );
              },
            ),
            MoreItem(
              text: 'Support',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle logout action
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreItem extends StatelessWidget {
  final String text;
  Function onTap;

  MoreItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F4CD),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF011F14)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF026742),
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Color(0xFF026742),
            ),
          ],
        ),
      ),
    );
  }
}

class CassavaScannerContainer extends StatelessWidget {
  CassavaScannerContainer({super.key});

  final cameras = availableCameras();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Color(0xFF026742),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: [
          // Container with tree image
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/tree.png', // Replace with your tree image asset path
              // width: 100.0,
              // height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          // Column with title, description, and button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  'Cassava Imaging',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD8E37E)),
                ),
                // Description
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                // Button with icon
                ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffD8E37E))),
                  onPressed: () {
                    // Add functionality for the button click
                    debugPrint('Scan Cassava button clicked!');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ScanCassavaPage(
                                  cameras: [],
                                ))));
                  },
                  icon: const Icon(Icons.scanner),
                  label: const Text(
                    'Scan Cassava',
                    style: TextStyle(color: Color(0xff026742)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
