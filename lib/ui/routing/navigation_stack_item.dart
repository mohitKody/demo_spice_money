import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'navigation_stack_item.freezed.dart';

@freezed
class NavigationStackItem with _$NavigationStackItem {
  const factory NavigationStackItem.splash() = NavigationStackItemSplashPage;

  const factory NavigationStackItem.prachar() = NavigationStackItemPracharPage;
const factory NavigationStackItem.createoffer() = NavigationStackItemCreateofferPage;

}
