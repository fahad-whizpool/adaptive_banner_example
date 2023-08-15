// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'banner_ad.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MaterialApp(
    home: AdaptiveBanner(),
  ));
}

/// A simple app that loads an adaptive banner ad.
class AdaptiveBanner extends StatefulWidget {
  const AdaptiveBanner({super.key});

  @override
  AdaptiveBannerState createState() => AdaptiveBannerState();
}

class AdaptiveBannerState extends State<AdaptiveBanner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Banner Example',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Adaptive Banner Example'),
          ),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  color: Colors.yellow,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 50,
                  color: Colors.yellow,
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScreenB()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text("go to Screen B")),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen B'),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                color: Colors.yellow,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                color: Colors.yellow,
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.red,
                  child: const Center(child: Text("go back")),
                ),
              ),
            )
          ],
        ));
  }
}
