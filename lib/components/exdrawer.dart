// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Screens/city_selection_screen.dart';
import 'package:weather_app/Screens/contact_us_screen.dart';

// import '../Screens/login_screen.dart';
import '../services/toast.dart';

class EXDrawer extends StatefulWidget {
  const EXDrawer({
    super.key,
  });

  @override
  State<EXDrawer> createState() => _EXDrawerState();
}

class _EXDrawerState extends State<EXDrawer> {
  // var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Weather App',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Text('By: Taha Goheer',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Manage Location'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CitySelectionPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.headset_mic),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUsPage()));
              },
            ),
            ListTile(
                splashColor: Colors.red,
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: _onSignOutComplete),
          ],
        ),
      ),
    );
  }

  void _onSignOutComplete() {
    showToast(message: 'Logged Out');
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const CitySelectionPage(),
        ),
        (route) => false,
      );
    }
  }
}
