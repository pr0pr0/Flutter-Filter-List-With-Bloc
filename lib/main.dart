import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Bloc/RivalsFilter/rivals_filter_bloc.dart';
import 'package:travel/models/Rivals.dart';
import 'package:travel/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RivalsFilterBloc()
            ..add(
              RivalsFilterLoaded(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Travel UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class SubjectRepository {
  

  List<dynamic> add() {
    return rival;
  }
}
