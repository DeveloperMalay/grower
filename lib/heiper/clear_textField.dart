import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownitemClick/dropdownitem_click_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/liquid_fertilizer/liquid_fertilizer_cubit.dart';

void cleatTextField(BuildContext context, TextEditingController pound,
    TextEditingController gallon, TextEditingController density) {
  pound.clear();
  gallon.clear();
  density.clear();
  // context.read<DropdownitemClickCubit>().clickReversed();
  // context.read<LiquidFertilizerCubit>().getinitialState();
  context.read<DropdownIndexCubit>().getdropdowndetails(0, 'Select fertilizer');
  context
      .read<DropdownIndexCubit1>()
      .getdropdowndetails(0, 'Select fertilizer');
}
