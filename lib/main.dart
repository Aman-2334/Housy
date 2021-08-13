import 'package:flutter/material.dart';
import 'package:housy/cubit/movie_cubit.dart';
import 'package:housy/cubit/registration_cubit.dart';
import 'package:housy/screens/homepage.dart';
import 'package:housy/screens/login.dart';
import 'package:housy/screens/register.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationCubit(),
          child: Registration(),
        ),
        BlocProvider(
          create: (context) => RegistrationCubit(),
          child: Login(),
        ),
        BlocProvider(
          create: (context) => MovieCubit(),
          child: HomePage(),
        ),
        BlocProvider(
          create: (context) => RegistrationCubit(),
          child: MyApp(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          buttonColor: Colors.blue[700],
          textTheme: TextTheme(
            headline1: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600),
            ),
            headline2: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600),
            ),
            headline3: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
            bodyText1: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600),
            ),
            button: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.amber),
            ),
          ),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            backgroundColor: Colors.black,
            centerTitle: true,
            titleTextStyle: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
          ),
        ),
        // home: BlocProvider(
        //   create: (context) => MovieCubit(),
        //   child: WelcomeScreen(),
        // ),

        home: BlocBuilder<RegistrationCubit, RegistrationState>(
            bloc: RegistrationCubit(),
            builder: (context, state) {
              return RegistrationCubit().loginValidity() ? HomePage() : Login();
            }),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          Registration.routeName: (ctx) => Registration(),
          Login.routeName: (ctx) => Login(),
        },
      ),
    );
  }
}
