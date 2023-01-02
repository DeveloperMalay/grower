import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit() : super(ReminderState.initial());

  void noOfHit() {
    emit(state.copyWith(hitReminder: state.hitReminder - 1));
  }
}
