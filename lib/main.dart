import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spice_money/ui/routing/delegate.dart';
import 'package:spice_money/ui/routing/parser.dart';
import 'package:spice_money/ui/routing/stack.dart';
import 'package:spice_money/ui/utils/constants/app_constants.dart';
import 'package:spice_money/ui/utils/theme/app_color_utils.dart';

import 'framework/controller/dark_mode/dark_mode_controller.dart';
import 'framework/di/inject.dart';
import 'framework/session.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureMainDependencies(environment: Env.dev);

  /// Theme For Status Bar & Navigation Bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    /// The color of top status bar.
    ///
    /// Only honored in Android version M and greater.
    statusBarColor: Colors.transparent,

    /// The brightness of the top status bar icons.
    ///
    /// Only honored in Android version M and greater.
    statusBarIconBrightness: Brightness.dark,

    /// The brightness of top status bar.
    /// Only honored in iOS.
    statusBarBrightness: Brightness.dark,

    /// The color of the system bottom navigation bar.
    /// Only honored in Android versions O and greater.
    systemNavigationBarColor: AppColors.black,

    /// The brightness of the system navigation bar icons.
    ///
    /// Only honored in Android versions O and greater.
    /// When set to [Brightness.light], the system navigation bar icons are light.
    /// When set to [Brightness.dark], the system navigation bar icons are dark.
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  /// init method
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final darkModeWatch = ref.watch(darkModeController);

      ///Dark Mode Object
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      bool isDarkMode =
          Session.getIsAppThemeDark() ?? (brightness == Brightness.dark);
      darkModeWatch.updateIsDarkMode(false, false);

      /// Theme For Status Bar & Navigation Bar
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        /// The color of top status bar.
        /// Only honored in Android version M and greater.
        statusBarColor: Colors.transparent,

        /// The brightness of the top status bar icons.
        /// Only honored in Android version M and greater.
        statusBarIconBrightness:
        AppColors.isDarkMode ? Brightness.light : Brightness.dark,

        /// The brightness of top status bar.
        /// Only honored in iOS.
        statusBarBrightness:
        AppColors.isDarkMode ? Brightness.dark : Brightness.light,

        /// The color of the system bottom navigation bar.
        /// Only honored in Android versions O and greater.
        systemNavigationBarColor:
        AppColors.isDarkMode ? AppColors.white : AppColors.black,

        /// The brightness of the system navigation bar icons.
        /// Only honored in Android versions O and greater.
        /// When set to [Brightness.light], the system navigation bar icons are light.
        /// When set to [Brightness.dark], the system navigation bar icons are dark.
        systemNavigationBarIconBrightness:
        AppColors.isDarkMode ? Brightness.light : Brightness.dark,
      ));
    });
  }

  /// dispose method
  @override
  void dispose() {
    super.dispose();

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    globalRef = ref;
    final darkModeWatch = ref.watch(darkModeController);

    /// Orientation Portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ///Navigator routers
    return ScreenUtilInit(
        designSize: const Size(375, 815),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: false,
        builder: (context, child) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: appName,
              // themeMode: themeModeController.themeMode,
              theme: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  hoverColor: Colors.transparent),

              // home: const SplashScreen(),
              routerDelegate: getIt<MainRouterDelegate>(
              param1: ref.read(navigationStackController)),
          routeInformationParser: getIt<MainRouterInformationParser>(
          param1: ref, param2: context),
          );
          });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
