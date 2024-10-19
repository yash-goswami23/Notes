import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_bloc/presentation/bloc/main/main_event.dart';

import '../../bloc/main/main_bloc.dart';
import '../../bloc/main/main_state.dart';
import '../../widgets/theme/my_theme.dart';
import '../note/note_page.dart';
import '../todo/to_do_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return MaterialApp(
          title: "To-Dos",
          debugShowCheckedModeBanner: false,
          theme: MyTheme().lightTheme,
          darkTheme: MyTheme().darkTheme,
          themeMode: state.themeMode,
          home: Scaffold(
            appBar: AppBar(title: const Text("Notes"), actions: [
              IconButton(
                  onPressed: () {
                    // showToast("Theme");
                    switch (state.themeMode) {
                      case ThemeMode.light:
                        context.read<MainBloc>().add(
                            const ChangeThemeMode(themeMode: ThemeMode.dark));
                        break;
                      case ThemeMode.dark:
                        context.read<MainBloc>().add(
                            const ChangeThemeMode(themeMode: ThemeMode.light));
                        break;
                      default:
                        if (MediaQuery.of(context).platformBrightness ==
                            Brightness.dark) {
                          context.read<MainBloc>().add(const ChangeThemeMode(
                              themeMode: ThemeMode.light));
                        } else {
                          context.read<MainBloc>().add(const ChangeThemeMode(
                              themeMode: ThemeMode.light));
                        }

                        break;
                    }
                  },
                  icon: state.themeMode == ThemeMode.dark
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode)),
            ]),
            body: [const NotePage(), const ToDoPage()][state.pageNum],
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                context.read<MainBloc>().add(ChangeBottomPages(pageNum: index));
              },
              selectedIndex: state.pageNum,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.note_alt),
                  icon: Icon(Icons.note_add_outlined),
                  label: 'Note',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.checklist),
                  icon: Icon(Icons.checklist_outlined),
                  label: 'To-Dos',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
