import 'package:bloc/bloc.dart';
import 'package:todolist_bloc/presentation/bloc/main/main_event.dart';
import 'package:todolist_bloc/presentation/bloc/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<ChangeThemeMode>(_changeThemeMode);
    on<ChangeBottomPages>(_changeBottomPages);
  }
  _changeThemeMode(ChangeThemeMode event, Emitter<MainState> emit) {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  _changeBottomPages(ChangeBottomPages event, Emitter<MainState> emit) {
    emit(state.copyWith(pageNum: event.pageNum));
  }
}
