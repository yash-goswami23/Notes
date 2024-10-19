import 'package:flutter/material.dart';

myDialog(
    {required BuildContext context,
    required TextEditingController addTitlController,
    TextEditingController? addDescController,
    required VoidCallback onYesPressed}) {
  return SimpleDialog(
    title: Column(
      children: [
        TextField(
          controller: addTitlController,
          decoration: const InputDecoration(
            label: Text('Add Title'),
            suffixIcon: Icon(Icons.notes),
          ),
        ),
        const SizedBox(height: 10),
        if (addDescController != null)
          TextField(
            controller: addDescController,
            decoration: const InputDecoration(
              label: Text('Add Description'),
              suffixIcon: Icon(Icons.notes),
            ),
          )
      ],
    ),
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: onYesPressed,
              child: Text(
                "Add",
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                addTitlController.clear();
                if (addDescController != null) {
                  addDescController.clear();
                }
              },
              child: Text("No", style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    ],
  );
}
