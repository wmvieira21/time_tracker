import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';
import 'package:time_tracker/providers/task_manager_provider.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';
import 'package:time_tracker/screens/project_manager_sreeen.dart';
import 'package:time_tracker/screens/task_manager_screen.dart';
import 'package:time_tracker/screens/time_entry_home_screen.dart';

final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 2, 184, 153), brightness: Brightness.light);
final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 169, 219, 207), brightness: Brightness.dark);

final ThemeData darkThemeData =
    ThemeData().copyWith(colorScheme: darkColorScheme);

final ThemeData themeData = ThemeData().copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 2, 184, 153),
    titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
    toolbarHeight: 60,
    iconTheme: IconThemeData(size: 28, color: Colors.black),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        bodyLarge:
            TextStyle(color: lightColorScheme.onPrimaryContainer, fontSize: 20),
        bodyMedium:
            TextStyle(color: lightColorScheme.onPrimaryContainer, fontSize: 16),
        bodySmall:
            TextStyle(color: lightColorScheme.onPrimaryContainer, fontSize: 14),
        headlineSmall: TextStyle(color: Colors.white),
      ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightColorScheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      backgroundColor: lightColorScheme.primary,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 18),
    ),
  ),
  cardTheme: CardThemeData(
      margin: EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      shadowColor: lightColorScheme.onPrimaryContainer),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(
    SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => TimeEntryProvider(storage: localStorage)),
          ChangeNotifierProvider(
              create: (context) => TaskManagerProvider(storage: localStorage)),
          ChangeNotifierProvider(
              create: (context) =>
                  ProjectManagerProvider(storage: localStorage)),
        ],
        child: MaterialApp(
          theme: themeData,
          darkTheme: darkThemeData,
          themeMode: ThemeMode.system,
          routes: {
            '/': (context) => const TimeEntryHomeScreen(),
            '/projects': (context) => const ProjectManagerSreeen(),
            '/tasks': (context) => const TaskManagerScreen(),
          },
        ),
      ),
    ),
  );
}
