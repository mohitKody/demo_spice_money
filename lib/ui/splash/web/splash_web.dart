import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';

import '../../routing/navigation_stack_item.dart';
import '../../routing/stack.dart';

class SplashWeb extends ConsumerStatefulWidget {
  const SplashWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashWeb> createState() => _SplashScreenWebState();
}

class _SplashScreenWebState extends ConsumerState<SplashWeb> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // final splashScreenWatch = ref.watch(splashController);
      //splashScreenWatch.clearProvider();
      ref.read(navigationStackController).pushAndRemoveAll(
          const NavigationStackItem.createoffer());
    });
  }

  ///Dispose Override
  @override
  void dispose() {
    super.dispose();
  }

  ///Build Override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  ///Body Widget
  Widget _bodyWidget() {
    return Container();
  }


}
