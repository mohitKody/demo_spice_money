import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:spice_money/ui/utils/theme/app_assets.dart';

import '../../di/inject.dart';

final changeOfferController = ChangeNotifierProvider(
  (ref) => getIt<CreateOfferController>(),
);

class CreateOfferController extends ChangeNotifier {

  TextEditingController textEditingControllerBranding =  TextEditingController();
  TextEditingController textEditingControllerOffer =  TextEditingController();
  List<ShopTypeMoal> shoptypeList = [
    ShopTypeMoal(AppAssets.ofImage1, 'Printer', false),
    ShopTypeMoal(AppAssets.ofImage2, 'Cyber cafe', false),
    ShopTypeMoal(AppAssets.ofImage3, 'Mobiles & Recharge', false),
    ShopTypeMoal(AppAssets.ofImage4, 'Restaurant', false),
    ShopTypeMoal(AppAssets.ofImage5, 'Medical', false),
    ShopTypeMoal(AppAssets.ofImage6, 'Medical store', false),
    ShopTypeMoal(AppAssets.ofImage7, 'Kirana & Grocery', false),
    ShopTypeMoal(AppAssets.ofImage8, 'Photography & Printing', false),

  ];

  List<ShopTypeMoal> selectedShop = <ShopTypeMoal>[];
  int? currentValue;

  List<OfferTextModal> offertextList = [
    OfferTextModal( 'Rajiv Seva Kendra ki taraf se sabhi ko Holi ki hardik shubhkamnayei',1, false),
    OfferTextModal( 'Rajiv Seva Kendra par ab Axis Bank Account kholne ki suvidha uplabdh hai',2, false),
    OfferTextModal( 'Rajiv Seva Kendra par sabhi banking sevao ka labh uthaiyei behad kam shulko mei',3, false),
  ];
  List festivalImages = [
    AppAssets.festival1,
    AppAssets.festival2,
    AppAssets.festival3,
    AppAssets.festival4,
  ];
  String? selectImg;

  Offer pet = Offer.dog;

  changeIsLike(ShopTypeMoal model, bool value) {
    model.isSelected = value;
    notifyListeners();
  }
  bool value2 = false;

  changeIsOffer(var value,String text) {
    currentValue = value;
    textEditingControllerOffer.text = text;
    notifyListeners();
  }

  changeImage(String image){
    selectImg = image;
    notifyListeners();
  }


}
enum Offer { dog, cat,me }

class ShopTypeMoal {
  String image;
  String title;
  bool isSelected;

  ShopTypeMoal(this.image, this.title, this.isSelected);
}

class OfferTextModal {
  String title;
  int indexI;
  bool isSelected;

  OfferTextModal(this.title, this.indexI,this.isSelected);
}
