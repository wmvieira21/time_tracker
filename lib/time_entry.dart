import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/models/taks.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';
import 'package:time_tracker/providers/task_manager_provider.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';
import 'package:time_tracker/screens/add_time_entry_screen.dart';
import 'package:time_tracker/widgets/drawer_menu.dart';
import 'package:time_tracker/widgets/no_data_found.dart';

class TimeEntry extends StatefulWidget {
  const TimeEntry({super.key});

  @override
  State<TimeEntry> createState() => _TimeEntryState();
}

class _TimeEntryState extends State<TimeEntry>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'All Entries'),
    Tab(text: 'Grouped by Projects'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  addTimeEntryScreen() {
    List<Project> projects =
        Provider.of<ProjectManagerProvider>(context, listen: false).projects;
    List<Task> tasks =
        Provider.of<TaskManagerProvider>(context, listen: false).tasks;
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
          unselectedLabelColor: Colors.black,
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
      body: Consumer<TimeEntryProvider>(
        builder: (context, value, child) {
          return TabBarView(
            controller: _tabController,
            children: [
              NoDataFound(
                icon: Icons.hourglass_empty,
                typeOfData: 'time entries',
              ),
              NoDataFound(
                icon: Icons.hourglass_empty,
                typeOfData: 'time entries',
              ),
            ],
          );
        },
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
