import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicanto/music_list.dart';
import 'package:musicanto/states.dart';
import 'cubit.dart';
import 'from_alaa.dart';
import 'styles/themes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
// class MyApp
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => MusicCubit(),
      child: BlocConsumer<MusicCubit, MusicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: QuranScreen(),
          );
        },
      ),
    );
  }
}
