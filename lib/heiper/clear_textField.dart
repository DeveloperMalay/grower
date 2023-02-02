import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownitemClick/dropdownitem_click_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/dry_fertilizer/dry_fertilizer_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/liquid_fertilizer/liquid_fertilizer_cubit.dart';

void cleatTextField(BuildContext context, TextEditingController pound,
    TextEditingController gallon, TextEditingController density) async {
  pound.clear();
  gallon.clear();
  density.clear();
  // context.read<DropdownIndexCubit>().getinitialState();
  // context.read<DropdownIndexCubit1>().getinitialState();
  // context.read<DropdownitemClickCubit>().clickReversed();
  // context.read<DropdownitemClickCubit1>().clickReversed1();
  // context.read<LiquidFertilizerCubit>().getinitialState();
  // context.read<DryFertilizerCubit>().getinitialState();
}
