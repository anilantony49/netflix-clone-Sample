import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/Application/downloads/downloads_bloc.dart';


import 'package:netflix/Domain/core/di/injectable.dart';
import 'package:netflix/Presentation/main_page/widgets/screen_main_page.dart';
import 'package:netflix/core/colors/colors.dart';

import 'Application/Home/home_bloc.dart';
import 'Application/fast_Laugh/fastlaugh_bloc.dart';
import 'Application/hot_and_new/hotandnew_bloc.dart';
import 'Application/search/search_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await configureInjucton();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (ctx)=> getIt<DownloadsBloc>()),
       BlocProvider(create:(ctx)=> getIt<SearchBloc>()),
        BlocProvider(create:(ctx)=> getIt<FastlaughBloc>()),
         BlocProvider(create:(ctx)=> getIt<HotandnewBloc>()),
          BlocProvider(create:(ctx)=> getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        title: 'Netflix App',
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
            scaffoldBackgroundColor: backGroundColor,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            // fontFamily: GoogleFonts.montserrat().fontFamily,
            primarySwatch: Colors.blue,
            backgroundColor: Colors.black,
            textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white))),
        home: ScreenMainPage(),
      ),
    );
  }
}
