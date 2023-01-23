//function to validate forms using cubit
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/not_empty_string_validator/not_empty_str_validator_cubit.dart';
import '../cubit/valid_number/valid_number_cubit.dart';

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
