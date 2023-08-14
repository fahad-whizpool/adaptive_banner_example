import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdMobContainer extends StatefulWidget {
  const BannerAdMobContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerAdMobContainer> createState() => _BannerAdMobContainerState();
}

class _BannerAdMobContainerState extends State<BannerAdMobContainer> {
  BannerAd? bannerAd;

  bool isLoaded = false;
  static final debugBannerId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';
  //-------------------------------------------
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      print("BannerAdMobContainer: didChangeDependencies");
    }
    loadAd();
  }

  //-------------------------------------------
  @override
  void dispose() {
    super.dispose();
    try {
      if (bannerAd != null) {
        if (kDebugMode) {
          print("BannerAdMobContainer: banner ad disposed");
        }
        bannerAd!.dispose();
        if (kDebugMode) {
          print("BannerAdMobContainer: after banner ad disposed");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("BannerAdMobContainer: error occured disposing ");
      }
      rethrow;
    }
  }

  //-------------------------------------------
  @override
  Widget build(BuildContext context) {
    try {
      return !isLoaded || bannerAd == null
          ? const SizedBox(
              height: 50,
            )
          : SizedBox(
              width: double.infinity, //this is for giving infinite width
              height: bannerAd!.size.height.toDouble(),
              child: AdWidget(
                ad: bannerAd!,
              ),
            );
    } catch (e) {
      return const SizedBox(
        height: 50,
      );
    }
  }

  //-------------------------------------------
  void loadAd() async {
    try {
      if (kDebugMode) {
        print("BannerAdMobContainer: before loading 1");
      }
      if (isLoaded || bannerAd != null) {
        return;
      }
      if (kDebugMode) {
        print("BannerAdMobContainer: before loading 2");
      }
      final AnchoredAdaptiveBannerAdSize? bannerAdSize =
          await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate(),
      );
      if (kDebugMode) {
        print("BannerAdMobContainer: before loading 3");
      }
      bannerAd = BannerAd(
        adUnitId: debugBannerId,
        request: const AdRequest(),
        size: bannerAdSize!,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            if (kDebugMode) {
              print("BannerAdMobContainer: onAdLoaded added 1");
            }
            //this isLoaded booleans are important to display ads dont ever remove it
            setState(() {
              isLoaded = true;
            });
            if (kDebugMode) {
              print("BannerAdMobContainer: onAdLoaded added 2");
            }
          },
          onAdFailedToLoad: (ad, err) {
            if (kDebugMode) {
              print("BannerAdMobContainer: onAdFailedToLoad ");
            }
            //this isLoaded booleans are important to display ads dont ever remove it
            setState(() {
              isLoaded = false;
            });
            // if (kDebugMode) {
            //   print("BannerAdMobContainer:before  ad disposed ");
            // }
            ad.dispose();
            if (kDebugMode) {
              print("BannerAdMobContainer: ad disposed ");
            }
          },
        ),
      )..load();
    } catch (e) {
      if (kDebugMode) {
        print("BannerAdMobContainer: Error: ${e.toString()}");
      }
      rethrow;
    }
  }
}
