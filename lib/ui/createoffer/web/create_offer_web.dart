import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:spice_money/ui/createoffer/helper/common_devider.dart';
import 'package:spice_money/ui/createoffer/helper/common_radio.dart';
import 'package:spice_money/ui/createoffer/helper/common_textfeild_brand.dart';
import 'package:spice_money/ui/utils/theme/app_assets.dart';
import 'package:spice_money/ui/utils/widget/common_appbar.dart';
import 'package:spice_money/ui/utils/widget/common_button.dart';

import '../../../framework/controller/create_offer/create_offer_controller.dart';
import '../../routing/navigation_stack_item.dart';
import '../../routing/stack.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/theme/app_color_utils.dart';
import '../../utils/theme/text_style.dart';
import '../../utils/widget/decorated_tab_bar.dart';
import '../helper/create_offer_list_tile.dart';

class CreateOfferWeb extends ConsumerStatefulWidget {
  const CreateOfferWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateOfferWeb> createState() => _CreateOfferWebState();
}

class _CreateOfferWebState extends ConsumerState<CreateOfferWeb>
    with SingleTickerProviderStateMixin {
  List<String> tabNameList = ['Branding', 'Shop-type', 'Offer', 'Design'];
  TabController? _tabController;

  ///Init Override
  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {

    _tabController =
        TabController(vsync: this, length: tabNameList.length,);
  }

  ///Dispose
  @override
  void dispose() {
    super.dispose();
  }

  ///Build
  @override
  Widget build(BuildContext context) {
    final offerWatch = ref.watch(changeOfferController);

    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: bodyWidget(),
              appBar: const CommonAppBar(
                title: 'Create an offer',
                titleLogo: AppAssets.webLogo,
                backgroundColor: AppColors.white,
                isLeadingEnable: true,
                loadingsize: 200,
              ),
              bottomNavigationBar: Visibility(
                // visible: productDetailWatch.isLoading == false,
                child: SizedBox(
                  height: 75,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, bottom: 00.w, top: 00.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CommonButton(
                        title: 'Next',
                        isweb: true,
                        onTap: () {
                          print(_tabController!.index);
                          (_tabController!.index == 0
                              ? (ref
                                      .read(changeOfferController)
                                      .textEditingControllerBranding
                                      .text
                                      .isEmpty
                                  ? null
                                  : _tabController!.animateTo(1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeOut))
                              : (_tabController!.index == 1
                                  ? (ref
                                          .read(changeOfferController)
                                          .selectedShop
                                          .isEmpty
                                      ? null
                                      : _tabController!.animateTo(2,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeOut))
                                  : (_tabController!.index == 2
                                      ? (ref
                                              .read(changeOfferController)
                                              .textEditingControllerOffer
                                              .text
                                              .isEmpty
                                          ? null
                                          : _tabController!.animateTo(3,
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.easeOut))
                                      : (_tabController!.index == 3
                                          ? ref
                                              .read(navigationStackController)
                                              .pushAndRemoveAll(
                                                  const NavigationStackItem
                                                      .createoffer())
                                          : _tabController!.animateTo(0,
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.easeOut)))));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 2, child: _sideWidget())
        ],
      ),
    );
  }

  Widget bodyWidget() {
    final offerWatch = ref.watch(changeOfferController);

    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(
        //   height: 40.h,
        // ),

        DecoratedTabBar(
          tabBar: TabBar(
            isScrollable: false,

            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            controller: _tabController,
            onTap: (index) {
              _tabController!.index = _tabController!.previousIndex;
            },
            unselectedLabelColor: AppColors.black_light,
            // indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: TextStyles.medium
                .copyWith(color: AppColors.black_light, fontSize: 16.0),
            labelColor: AppColors.primaryOrange,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.primaryOrange, width: 2.0),
              ),
            ),

            indicatorColor: AppColors.primary,
            tabs: List<Widget>.generate(
              tabNameList.length,
              (int index) {
                return Tab(
                    child:
                        _individualTab(tabNameList[index].toString(), index));
              },
            ),
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.white,
                width: 2.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            // color: AppColors.black_light.withOpacity(0.10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: <Widget>[
                    branding_body(offerWatch),
                    shop_type(offerWatch),
                    offer_name(offerWatch),
                    designing(offerWatch),
                    //   myAdsWatch.isEmptyListShown
                  ]),
            ),
          ),
        )
      ],
    );
  }

  Widget branding_body(CreateOfferController createOfferController) {
    FocusNode myFocusNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 28, bottom: 32),
          child: Text(
            'What is your shop name?',
            style: TextStyles.bold.copyWith(fontSize: 22.0),
          ),
        ),
        CommonTextfeildBrand(
            myFocusNode: myFocusNode,
            labeltext: "Enter Shop Name",
            controller: createOfferController.textEditingControllerBranding),

        // Container(
        //   child: TextField(
        //       obscureText: false,
        //       focusNode: myFocusNode,
        //       decoration: InputDecoration(
        //           enabledBorder: OutlineInputBorder(
        //               borderSide: const BorderSide(
        //                 color: AppColors.primary,
        //                 width: 1.0,
        //               ),
        //               borderRadius: BorderRadius.circular(5)),
        //           focusedBorder: OutlineInputBorder(
        //               borderSide: const BorderSide(
        //                   color: AppColors.primary, width: 1.0),
        //               borderRadius: BorderRadius.circular(5)),
        //           //labelText: title ,  // you can change this with the top text  like you want
        //           labelText: "Enter Shop Name",
        //           labelStyle: TextStyles.medium
        //               .copyWith(fontSize: 14.0, color: AppColors.primary),
        //           border: InputBorder.none,
        //           fillColor: const Color(0xfff3f3f4),
        //           filled: true)),
        // )
      ],
    );
  }

  Widget shop_type(CreateOfferController createOfferController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 28, bottom: 25),
          child: Text(
            'Select your shop type',
            style: TextStyles.bold.copyWith(fontSize: 22.0),
          ),
        ),
        _widgetofferListTile(createOfferController)
      ],
    );
  }

  Widget offer_name(CreateOfferController createOfferController) {
    FocusNode myfocusNode = FocusNode();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(top: 28, bottom: 32),
        child: Text(
          'Select offer text',
          style: TextStyles.bold.copyWith(fontSize: 22.0),
        ),
      ),
      ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        //   itemCount: createOfferController.offertextList.length,
        //   shrinkWrap: true,
        //   padding: EdgeInsets.zero,
        //   itemBuilder: (BuildContext context, int index) {
        // return CommonRadio(index, offer: Offer.me, isSelected: false);
        children: createOfferController.offertextList
            .map((timeValue) => RadioListTile<int>(
                  groupValue: createOfferController.currentValue,
                  selected: false,
                  title: Text(
                    timeValue.title,
                    style: TextStyles.medium.copyWith(
                      color: AppColors.black,
                      fontSize: 15.0,
                    ),
                  ),
                  activeColor: AppColors.primary,
                  value: timeValue.indexI,
                  onChanged: (val) async {
                    print(val);
                    print(timeValue.title);
                    createOfferController.changeIsOffer(val, timeValue.title);
                    FocusScope.of(context).requestFocus(myfocusNode);
                  },
                ))
            .toList(),
        //   RadioListTile(
        //   value: createOfferController.offertextList[index].indexI,
        //   groupValue: createOfferController.value2,
        //   selected: createOfferController.offertextList[index].isSelected,
        //   onChanged: (val) {
        //     if (createOfferController.offertextList[index].isSelected ==
        //         true) {
        //       createOfferController.changeIsOffer(
        //           createOfferController.offertextList[index], false,index);
        //     } else {
        //       createOfferController.changeIsOffer(
        //           createOfferController.offertextList[index], true,index);
        //     }
        //
        //     print(createOfferController.value2);
        //
        //   },
        //   activeColor: Colors.purple,
        //   controlAffinity: ListTileControlAffinity.trailing,
        //   title: Text(
        //     ' ${createOfferController.offertextList[index].title}',
        //     style: const TextStyle(
        //         color: /*_group[i].selected ? Colors.black : */Colors.grey,
        //         fontWeight:
        //         /*_group[i].selected ? FontWeight.bold :*/ FontWeight.normal),
        //   ),
        // );
      ),



      // Container(
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(5),
      //       border: Border.all(color: AppColors.grey)
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 13),
      //     child: Text(
      //       'Rajiv Seva Kendra ki taraf se sabhi ko Holi ki hardik shubhkamnayei',
      //       style:
      //       TextStyles.medium.copyWith(fontSize: 16,
      //         color: AppColors.black,),
      //     ),
      //   ),
      // ),
      createOfferController.textEditingControllerOffer.text.isEmpty
          ? const SizedBox.shrink()
          : Column(
            children: [
              const CommonDevider(),
              const SizedBox(
                height: 20,
              ),
              CommonTextfeildBrand(
                  myFocusNode: myfocusNode,
                  labeltext: "Enter Offer Name",
                  controller: createOfferController.textEditingControllerOffer),
            ],
          ),
    ]);
  }

  Widget designing(CreateOfferController createOfferController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                // height: screenHeight(context) / 8.5,
                // width: screenWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 28, bottom: 32),
                      child: Text(
                        'Choose your offer background',
                        style: TextStyles.bold.copyWith(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.primary, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image,
                            color: AppColors.primary,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyles.medium.copyWith(
                                fontSize: 14.0, color: AppColors.primary),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: screenWidth(context) / 3.5,
                        child: GridView.builder(
                          itemCount:
                              createOfferController.festivalImages.length,
                          // itemCount: 14,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisExtent: 100,
                                  crossAxisSpacing: 10,
                                  maxCrossAxisExtent: 100),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: InkWell(
                                onTap: () {
                                  createOfferController.changeImage(
                                      createOfferController
                                          .festivalImages[index]);
                                },
                                child: Image.asset(
                                  createOfferController.festivalImages[index],
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: screenHeight(context) / 2.2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            createOfferController.selectImg ??
                                AppAssets.backgroundImage,
                            fit: BoxFit.cover,
                            height: screenHeight(context),
                            width: screenWidth(context),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                  Colors.black.withOpacity(.8),
                                  Colors.black.withOpacity(.1)
                                ])),
                          ),
                          Positioned(
                            bottom: 20,
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                " createOfferController.textEditingControllerOffer.text",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                maxLines: 3,
                                style: TextStyles.medium.copyWith(
                                    fontSize: 15.0, color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _widgetofferListTile(CreateOfferController createOfferController) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 30),
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          shrinkWrap: true,
          itemCount: createOfferController.shoptypeList.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                // print(index);
                if (createOfferController.shoptypeList[index ?? 0].isSelected ==
                    true) {
                  // print("deselect");
                  createOfferController.changeIsLike(
                      createOfferController.shoptypeList[index], false);
                  createOfferController.selectedShop.removeWhere((element) =>
                      element.title ==
                      createOfferController.selectedShop[index].title);
                  // print(createOfferController.selectedShop.length);
                } else {
                  // print("select");
                  createOfferController.changeIsLike(
                      createOfferController.shoptypeList[index], true);
                  createOfferController.selectedShop
                      .add(createOfferController.shoptypeList[index]);
                  // print(createOfferController.selectedShop.length);
                }
              },
              child: CreateOfferListTile(
                i: index,
                dataList: createOfferController.shoptypeList,
              ),
            );
          }),
    );
  }

  Widget _individualTab(String title, int index) {
    return Container(
      height: 25,
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      width: double.infinity,
      child: Tab(
        text: title,
      ),
    );
  }

  Widget _sideWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 28, bottom: 32),
            child: Text(
              'What is your shop name?',
              style: TextStyles.bold.copyWith(fontSize: 20.0),
            ),
          ),
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: AppColors.black_grey)),
            child: Image.asset(AppAssets.pracharTitle),
          ),
          Container(
            padding: const EdgeInsets.only(top: 28, bottom: 32),
            child: Text(
              'Frequently ask questions',
              style: TextStyles.bold.copyWith(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
