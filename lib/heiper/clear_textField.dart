import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/dry_fertilizer/dry_fertilizer_cubit.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/reset_dropdown/reset_dropdown_cubit.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/drop_down_options_widget.dart';

import '../presentation/calculator/calculation_screen/cubit/dropdownitemClick/dropdownitem_click_cubit.dart';

void cleatTextField(BuildContext context, TextEditingController pound,
    TextEditingController gallon, TextEditingController density) async {
  pound.clear();
  gallon.clear();
  density.clear();
  context.read<ResetDropdownCubit>().resetScreen();
  context.read<DryFertilizerCubit>().getinitialState();
  context.read<DropdownitemClickCubit>().clickReversed();

  context.read<DropdownIndexCubit>().getinitialState();
}
