import 'package:casino_da_povoa/cubit/auth_cubit/auth_cubit.dart';
import 'package:casino_da_povoa/cubit/booking_cubit/booking_cubit.dart';
import 'package:casino_da_povoa/cubit/entertainment_cubit/entertainment_cubit.dart';
import 'package:casino_da_povoa/cubit/hotels_cubit/hotels_cubit.dart';
import 'package:casino_da_povoa/cubit/places_cubit.dart';
import 'package:casino_da_povoa/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GuideCubit()..loadGuides()),
        BlocProvider(create: (context) => HotelCubit()..loadHotels()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(create: (context) => EntertainmentCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
          ),
          tabBarTheme: const TabBarTheme(
            dividerColor: Colors.transparent,
          ),
        ),
      ),
    ),
  );
}
