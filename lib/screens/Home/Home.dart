import 'package:flutter/material.dart';
import 'package:planit/screens/BottomSheet/BottomSheet.dart';
import 'package:planit/screens/Home/tabs/listTab.dart';
import 'package:provider/provider.dart';
import '../../provider/Provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedTabIndex = 0;
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: buildBottomNav(),
      body: currentSelectedTabIndex == 0
          ? ListTab()
          : const Center(child: Text("Settings tab not implemented yet")),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildFab() =>
      FloatingActionButton(onPressed: (){
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: BottomSheetBar(),
            ));
      },
        child: const Icon(Icons.add),);

  Widget buildBottomNav() =>
      BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
            onTap: (index){
              currentSelectedTabIndex = index;
              setState(() {});
            },
            currentIndex: currentSelectedTabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ]),
      );
}