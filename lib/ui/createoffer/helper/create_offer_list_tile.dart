import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_money/ui/utils/theme/app_assets.dart';

import '../../../framework/controller/create_offer/create_offer_controller.dart';
import '../../utils/theme/app_color_utils.dart';
import '../../utils/theme/text_style.dart';

class CreateOfferListTile extends ConsumerStatefulWidget {
  final int? i;
  List<ShopTypeMoal>? dataList;

  CreateOfferListTile({Key? key, this.i, this.dataList}) : super(key: key);

  @override
  ConsumerState<CreateOfferListTile> createState() =>
      _CreateofferListtileState();
}

class _CreateofferListtileState extends ConsumerState<CreateOfferListTile> {
  ///Init
  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  ///Dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  ///Build
  @override
  Widget build(BuildContext context) {
    final offerWatch = ref.watch(changeOfferController);

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: offerWatch.shoptypeList[widget.i!].isSelected == true
              ? AppColors.selected_green
              : AppColors.black_grey, //<-- SEE HERE
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 1,
      color: AppColors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  5.r,
                ),
                child: Image.asset(
                  widget.dataList![widget.i ?? 0].image,
                  height: 46.6,
                  width: 42,
                ),
                // CacheImage(
                //   //imageURL: productImages[i],
                //   imageURL: widget.dataList?[widget.i ?? 0].image ?? '',
                //   height: 127,
                //   contentMode: BoxFit.cover,
                //   width: double.infinity,
                //   placeholderImage:
                //   AppAssets.imagesIcAddImage,
                // ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                child: Text(
                  widget.dataList?[widget.i ?? 0].title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyles.medium
                      .copyWith(color: AppColors.black_light, fontSize: 15.sp),
                ),
              ),
            ],
          ),
          offerWatch.shoptypeList[widget.i!].isSelected == true
              ? Positioned(
                  top: 9.0,
                  right: 9.0,
                  child: Image.asset(
                    AppAssets.selectedCheck,
                    height: 20,
                    width: 20,
                  ))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
