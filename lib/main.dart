// ignore_for_file: public_member_api_docs

import 'dart:io';

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
  // BannerAd? _bannerAd2;
  // bool _isLoaded2 = false;
  // BannerAd? _bannerAd1;
  // bool _isLoaded1 = false;
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _isLoaded1 = false;
    // _isLoaded2 = false;
    // _loadAd1();
    // _loadAd2();
  }

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
              const Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: BannerAdMobContainer(),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: BannerAdMobContainer(),
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

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the width of the screen.
  void _loadAd2() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      // Unable to get width of anchored banner.
      return;
    }

    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          // setState(() {
          //   _bannerAd2 = ad as BannerAd;
          //   _isLoaded2 = true;
          // });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  void dispose() {
    // _bannerAd1?.dispose();
    // _bannerAd2?.dispose();
    super.dispose();
  }

  void _loadAd1() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      // Unable to get width of anchored banner.
      return;
    }

    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          // setState(() {
          //   _bannerAd1 = ad as BannerAd;
          //   _isLoaded1 = true;
          // });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }
}

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});
  @override
  ScreenBState createState() => ScreenBState();
}

class ScreenBState extends State<ScreenB> {
  // BannerAd? _bannerAd2;
  // bool _isLoaded2 = false;
  // BannerAd? _bannerAd1;
  // bool _isLoaded1 = false;

  final String _adUnitId = 'ca-app-pub-3940256099942544/2934735716';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen B'),
        ),
        body: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: BannerAdMobContainer(),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: BannerAdMobContainer(),
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

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the width of the screen.
  void _loadAd2() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      // Unable to get width of anchored banner.
      return;
    }

    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          // setState(() {
          //   _bannerAd2 = ad as BannerAd;
          //   _isLoaded2 = true;
          // });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  void _loadAd1() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      // Unable to get width of anchored banner.
      return;
    }

    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          // setState(() {
          //   _bannerAd1 = ad as BannerAd;
          //   _isLoaded1 = true;
          // });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  void dispose() {
    // _bannerAd2?.dispose();
    // _bannerAd1?.dispose();
    super.dispose();
  }
}
