// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reminder_cubit.dart';

// ignore: must_be_immutable
class ReminderState extends Equatable {
  int hitReminder;
  ReminderState({
    required this.hitReminder,
  });

  factory ReminderState.initial() {
    return ReminderState(hitReminder: 5);
  }

  @override
  List<Object> get props => [hitReminder];

  ReminderState copyWith({
    int? hitReminder,
  }) {
    return ReminderState(
      hitReminder: hitReminder ?? this.hitReminder,
    );
  }

  @override
  bool get stringify => true;
}
