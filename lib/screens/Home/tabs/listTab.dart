import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:planit/provider/Provider.dart';
import 'package:planit/screens/Home/tabs/todoWidget.dart';
import 'package:provider/provider.dart';
import '../../../utils/Colors.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshTodosList();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .16,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        color: Colours.background,
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        color: Colours.transparent,
                      ))
                ],
              ),
              CalendarTimeline(
                initialDate: provider.selectedDate,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) {
                  provider.selectedDate = date;
                  provider.refreshTodosList();
                },
                leftMargin: 30,
                monthColor: Colours.white,
                dayColor: Colours.header,
                activeDayColor: Colours.header,
                activeBackgroundDayColor: Colours.white,
                dotColor: Colours.transparent,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) =>
                TodoWidget(model: provider.todos[index]),
          ),
        ),
      ],
    );
  }
}