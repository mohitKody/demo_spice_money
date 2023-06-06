import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:spice_money/framework/di/inject.dart';


final pracharPageController = ChangeNotifierProvider(
      (ref) => getIt<PracharPageController>(),
);



@injectable
class PracharPageController extends ChangeNotifier {
  XFile? imageFile;
  XFile? videoFile;

}