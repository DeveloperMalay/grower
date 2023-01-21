import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/custom_theme.dart';
import '../../widgets/fertilizer_model.dart';
import '../cubit/dropdownIndex1/dropdown_index_cubit1.dart';

class DropDown1OptionsWidget extends StatelessWidget {
  const DropDown1OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 342,
      padding: const EdgeInsets.only(top: 0, left: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          // border: Border(bottom: BorderSide(color: greylight)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0.5),
              blurRadius: 0.03,
              spreadRadius: 0.03,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('N'),
              SizedBox(
                width: 18,
              ),
              Text(
                fertilizerData1[context
                        .watch<DropdownIndexCubit1>()
                        .state
                        .dropdownindex]
                    .amountofN,
                style: TextStyle(color: CustomTheme.primaryColor),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('P'),
              SizedBox(
                width: 18,
              ),
              Text(
                fertilizerData1[context
                        .watch<DropdownIndexCubit1>()
                        .state
                        .dropdownindex]
                    .amountofP,
                style: TextStyle(color: CustomTheme.primaryColor),
              )
            ],
          ),
          Row(
            children: [
              Text('K'),
              SizedBox(
                width: 18,
              ),
              Text(
                fertilizerData1[context
                        .watch<DropdownIndexCubit1>()
                        .state
                        .dropdownindex]
                    .amountofK,
                style: TextStyle(color: CustomTheme.primaryColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
