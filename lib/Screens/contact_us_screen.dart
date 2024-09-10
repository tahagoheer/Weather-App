import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/services/toast.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Section
            ListTile(
              leading: const Icon(Icons.mail, color: Colors.blue),
              title: const Text(
                'tahaahmadmuhammad@gmail.com',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: _launchEmail,
            ),
            const Divider(),

            // Phone Section
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blue),
              title: const Text(
                '+92 304 066 0059',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: _makePhoneCall,
            ),
            const Divider(),

            // Location Section
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.blue),
              title: const Text(
                'Chak No. 59/F Hasilpur',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: _openMaps,
            ),
          ],
        ),
      ),
    );
  }

  void _launchEmail() async {
    const email = 'tahaahmadmuhammad@gmail.com';
    final url = Uri.parse('mailto:$email');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _makePhoneCall() async {
    const phoneNumber = '+92 304 066 0059';
    final url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      showToast(message: 'Could not launch $url');
    }
  }

  void _openMaps() async {
    const location = 'Chak No. 59/F Hasilpur';
    final url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$location');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
