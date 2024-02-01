import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/change_password_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/faq_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/terms_conditions_page.dart';

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
             MoreItem(text: 'Change Password', onTap: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChangePasswordPage()),
              );
             },),
            MoreItem(text: 'Terms and Conditions', onTap: (){
              Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
    );
            },),
            MoreItem(text: 'FAQ', onTap: (){
               Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FaqPage()),);
            },),
            MoreItem(text: 'Support', onTap: (){},),
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
