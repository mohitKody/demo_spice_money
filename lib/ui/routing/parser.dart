import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:spice_money/ui/routing/stack.dart';

import 'navigation_stack_item.dart';
import 'navigation_stack_keys.dart';

@injectable
class MainRouterInformationParser
    extends RouteInformationParser<NavigationStack> {
  WidgetRef ref;
  BuildContext context;

  MainRouterInformationParser(
      @factoryParam this.ref, @factoryParam this.context);

  @override
  Future<NavigationStack> parseRouteInformation(
      RouteInformation routeInformation) async {
    debugPrint('........URL......${routeInformation.location}');

    final Uri uri = Uri.parse(routeInformation.location ?? '');
    final queryParams = uri.queryParameters;
    final items = <NavigationStackItem>[];
    debugPrint('Stack Item Count - ${items.length}');
    // String? langStr = queryParams['lang'];

    // if (langStr != null) {
    //   await context.setLocale(Locale(langStr == "english" ? "en" : "hi"));
    // }

    for (var i = 0; i < uri.pathSegments.length; i = i + 1) {
      final key = uri.pathSegments[i];

      switch (key) {
        case Keys.splash:
          items.add(const NavigationStackItem.splash());
          break;
        case Keys.prachar:
          items.add(const NavigationStackItem.prachar());
          break;

        case Keys.create_offer:
          items.add(const NavigationStackItem.createoffer());
          break;

        default:
          items.add(const NavigationStackItem.splash());
        // default:
        //   items.add(const NavigationStackItem.notFound());
      }
    }
    if (items.isEmpty) {
      const fallback =
          NavigationStackItem.splash(); //NavigationStackItem.customerInfo();
      if (items.isNotEmpty && items.first is NavigationStackItemSplashPage) {
        items[0] = fallback;
      } else {
        items.insert(0, fallback);
      }
    }
    return NavigationStack(items);
  }

  ///THIS IS IMPORTANT: Here we restore the web history
  @override
  RouteInformation restoreRouteInformation(NavigationStack configuration) {
    final location =
        configuration.items.fold<String>('', (previousValue, element) {
      return previousValue +
          element.when(
            splash: () => '/${Keys.splash}',
            prachar: () => '/${Keys.prachar}',
            createoffer: () => '/${Keys.create_offer}',
          );
    });

    ///Return null will be stay in first route page  , if we reached first page then location will empty
    return RouteInformation(location: location);
  }
}
