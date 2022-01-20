import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io' show Platform;

class Cookies {
  static const idConsumable1 = '1_cookie';
  static const idConsumable5 = '5_cookie';
  static const idConsumable10 = '10_cookie';
  static const idConsumable20 = '20_cookie';

  static const allIds = [
    idConsumable1,
    idConsumable5,
    idConsumable10,
    idConsumable20,
  ];
}

class PurchaseApi {
  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    if (Platform.isAndroid) {
      await Purchases.setup("goog_ywWoRmFobzeQfvPlnhZmEUvzVug");
    } else if (Platform.isIOS) {
      await Purchases.setup("appl_aktJMEhOSKiFuCMnhdrzXQMyXtk");
    }
  }

  static Future<List<Offering>> fetchOffersByIds(List<String> ids) async {
    final offers = await fetchOffers();

    return offers.where((offer) => ids.contains(offer.identifier)).toList();
  }

  static Future<List<Offering>> fetchOffers({bool all = true}) async {
    try {
      final offerings = await Purchases.getOfferings();

      if (!all) {
        final current = offerings.current;

        return current == null ? [] : [current];
      } else {
        return offerings.all.values.toList();
      }
    } on PlatformException catch (e) {
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);

      return true;
    } catch (e) {
      return false;
    }
  }
}
