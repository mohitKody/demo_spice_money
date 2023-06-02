import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../framework/controller/create_offer/create_offer_controller.dart';
import '../../utils/theme/app_color_utils.dart';
import '../../utils/theme/text_style.dart';

class CommonRadio extends ConsumerStatefulWidget {
  final Offer offer;
  final int index;
  final bool isSelected;
  const CommonRadio(this.index, {Key? key, required this.offer, required this.isSelected}) : super(key: key);

  @override
  ConsumerState<CommonRadio> createState() => _CommonRadioState();
}

class _CommonRadioState extends ConsumerState<CommonRadio> {

  @override

  Widget build(BuildContext context) {
    final offerWatch = ref.watch(changeOfferController);

    return  Row(
      children: [
        Radio(
          value: widget.offer.name,
          groupValue: offerWatch.offertextList[widget.index].title,
          onChanged: (value) {
           print(value);
          },
        ),
        Flexible(
          child: Text(
              offerWatch.offertextList[widget.index].title,
              // maxLines: 2,
              // overflow: TextOverflow.clip,
              softWrap: true,
              style: TextStyles.medium.copyWith(
                  color: AppColors.black,
                  fontSize: 15.0
              )
            // TextStyle(
            //     color: /*_group[i].selected ? Colors.black : */AppColors.black,
            //     fontSize: 15.0,
            //
            //     fontWeight:
            //     /*_group[i].selected ? FontWeight.bold :*/ FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
