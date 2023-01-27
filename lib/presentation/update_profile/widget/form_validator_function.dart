import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/not_empty_string_validator/not_empty_str_validator_cubit.dart';
import '../cubit/valid_number/valid_number_cubit.dart';

//function to validate forms using cubit
void validateForm(
  BuildContext context,
  String name,
  String number,
  String address,
) {
  context.read<NotEtyStrValidatorCubit>().checkName(name);
  context.read<NotEtyStrValidatorCubit>().checkaddress(address);
  context.read<ValidNumberCubit>().checkphone(number);
}

bool shouldUpdate(
  BuildContext context,
) {
  bool update;
  context.read<NotEtyStrValidatorCubit>().state.validaddress &&
          context.read<NotEtyStrValidatorCubit>().state.validname &&
          context.read<ValidNumberCubit>().state.validphone
      ? update = true
      : update = false;
  return update;
}
