import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planit/widgets/TextField.dart';
import 'package:provider/provider.dart';
import '../../provider/Provider.dart';
import '../../utils/AppTheme.dart';
import '../../utils/Colors.dart';

class BottomSheetBar extends StatefulWidget {
  @override
  State<BottomSheetBar> createState() => _AddBottomSheetBarState();
}

class _AddBottomSheetBarState extends State<BottomSheetBar> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late ListProvider provider;

  @override
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * .5, // Adjust height as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Add New task",
                textAlign: TextAlign.center,
                style: AppTheme.bottomSheetTitleTextStyle),
            const SizedBox(height: 16),
            MyTextField(hintText: "Enter task title", controller: titleController),
            const SizedBox(height: 8),
            MyTextField(hintText: "Enter task description", controller: descriptionController),
            const SizedBox(height: 16),
            Text("Select date",
                style: AppTheme.bottomSheetTitleTextStyle.copyWith(fontWeight: FontWeight.w600)),
            InkWell(
              onTap: () {
                showMyDatePicker();
              },
              child: Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                textAlign: TextAlign.center,
                style: AppTheme.bottomSheetTitleTextStyle.copyWith(
                    fontWeight: FontWeight.normal, color: Colours.grey),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                addTodo();
              },
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }


  void addTodo() {
    if (titleController.text.trim().isEmpty || descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Title and Description cannot be empty")),
      );
      return;
    }
    provider.todos.add(TodoDM(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date: selectedDate,
      isDone: false,
    ));
    provider.refreshTodosList();
    Navigator.pop(context);
  }

  void showMyDatePicker() async {
    selectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}