import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spice_money/ui/createoffer/web/create_offer_web.dart';

import 'mobile/create_offer_mobile.dart';

class CreatOffer extends StatelessWidget {
  const CreatOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const CreateOfferMobile();
        },
        desktop: (BuildContext context) {
          return const CreateOfferWeb();
        }
    );
  }
}
