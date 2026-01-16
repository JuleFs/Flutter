import 'package:flutter/material.dart';
import 'src/models/appointment.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/register_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/pets_screen.dart';
import 'src/screens/pet_detail_screen.dart';
import 'src/screens/appointments_screen.dart';
import 'src/screens/book_appointment_screen.dart';
import 'src/screens/medical_history_screen.dart';
import 'src/screens/profile_screen.dart';
import 'src/theme/app_theme.dart';

void main() {
  runApp(const VetApp());
}

class VetApp extends StatelessWidget {
  const VetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetCare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/pets': (context) => const PetsScreen(),
        '/appointments': (context) => const AppointmentsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
