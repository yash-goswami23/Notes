import 'package:flutter/material.dart';
import 'package:todolist_bloc/domain/entities/note.dart';
import 'package:todolist_bloc/presentation/widgets/theme/app_colors.dart';
import '../../../domain/entities/task.dart';

Widget toDoListCard(
    {required BuildContext context,
    required Task task,
    required ValueChanged onChange,
    required VoidCallback onDelete}) {
  return Card(
    elevation: 8,
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: onChange,
          activeColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.primaryColor
              : AppColors.accentColor,
        ),
        title: Text(task.title,
            style: task.isCompleted
                ? Theme.of(context).textTheme.labelLarge
                : Theme.of(context).textTheme.titleMedium),
        trailing: IconButton(
            onPressed: onDelete,
            icon: task.isCompleted
                ? Icon(
                    Icons.delete,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.primaryColor
                        : AppColors.accentColor,
                  )
                : const Icon(
                    Icons.delete,
                  )),
      ),
    ),
  );
}

Widget noteListCard(
    {required BuildContext context,
    required Note note,
    required VoidCallback onChange,
    required VoidCallback onDelete}) {
  return Card(
    elevation: 8,
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    note.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  note.desc,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: onChange,
                  icon: note.isFav
                      ? Icon(
                          Icons.favorite,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.primaryColor
                              : AppColors.accentColor,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        )),
              IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                  )),
            ],
          )
        ],
      ),
    ),
  );
}
