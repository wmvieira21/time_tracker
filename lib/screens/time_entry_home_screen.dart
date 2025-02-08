import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/models/taks.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';
import 'package:time_tracker/providers/task_manager_provider.dart';
import 'package:time_tracker/screens/add_time_entry_screen.dart';
import 'package:time_tracker/widgets/drawer_menu.dart';
import 'package:time_tracker/widgets/time_entry_grouped_list.dart';
import 'package:time_tracker/widgets/time_entry_list.dart';

class TimeEntryHomeScreen extends StatefulWidget {
  const TimeEntryHomeScreen({super.key});

  @override
  State<TimeEntryHomeScreen> createState() => _TimeEntryHomeScreenState();
}

class _TimeEntryHomeScreenState extends State<TimeEntryHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Project> projects = [];
  List<Task> tasks = [];

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'All Entries'),
    Tab(text: 'Grouped by Projects'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    tasks = Provider.of<TaskManagerProvider>(context, listen: false).tasks;
    projects =
        Provider.of<ProjectManagerProvider>(context, listen: false).projects;
  }

  addTimeEntryScreen() {
    if (projects.isEmpty || tasks.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: Text('No projects or tasks were found.'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddTimeEntryScreen(),
        ),
      );
    }
  }

  void selectPageDrawer(int indexTab) {
    Navigator.of(context).pop();
    if (indexTab == 0) {
      Navigator.pushNamed(context, '/projects');
    } else {
      Navigator.pushNamed(context, '/tasks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Tracking'),
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelColor: const Color.fromARGB(127, 0, 0, 0),
          controller: _tabController,
          indicatorColor: Colors.amber,
          labelColor: Colors.white,
          tabs: [...myTabs],
        ),
      ),
      drawer: Drawer(
        child: DrawerMenu(
          selectedItemDrawer: (indexTab) => selectPageDrawer(indexTab),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TimeEntryList(),
          TimeEntryGroupedList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        tooltip: 'Add new entry',
        onPressed: addTimeEntryScreen,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
