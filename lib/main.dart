import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';
import 'package:time_tracker/providers/task_manager_provider.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';
import 'package:time_tracker/screens/project_manager_sreeen.dart';
import 'package:time_tracker/screens/task_manager_screen.dart';
import 'package:time_tracker/time_entry.dart';

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
      foregroundColor: Colors.white),
  textTheme: ThemeData().textTheme.copyWith(
        bodyLarge:
            TextStyle(color: lightColorScheme.onPrimaryContainer, fontSize: 20),
        bodyMedium:
            TextStyle(color: lightColorScheme.onPrimaryContainer, fontSize: 18),
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
      backgroundColor:
          lightColorScheme.onPrimaryContainer.withValues(alpha: 50),
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 18),
    ),
  ),
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
            '/': (context) => const TimeEntry(),
            '/projects': (context) => const ProjectManagerSreeen(),
            '/tasks': (context) => const TaskManagerScreen(),
          },
        ),
      ),
    ),
  );
}
