import 'package:banned_words_checker/src/core/extentions/number_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_divider/wave_divider.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.email, color: Colors.black),
                      const SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () => _launchURL('mailto:tranhuudang148@gmail.com'),
                        child: const Text(
                          'tranhuudang148@gmail.com',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.black),
                      const SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () => _launchURL('tel:+84843909394'),
                        child: const Text(
                          '+84843909394',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.link, color: Colors.black),
                      const SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () => _launchURL('https://github.com/tranhuudang'),
                        child: const Text(
                          'GitHub: /tranhuudang',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          16.height,
          const WaveDivider(),
          16.height,
          const Center(
            child: Text(
              '© 2024 Tran Huu Dang. All rights reserved.',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}