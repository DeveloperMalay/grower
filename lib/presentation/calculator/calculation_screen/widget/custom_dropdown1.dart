import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/custom_theme.dart';

import '../../widgets/fertilizer_model.dart';
import '../cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import '../cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';

class CustomDropDown1 extends StatefulWidget {
  const CustomDropDown1({
    super.key,
  });

  @override
  State<CustomDropDown1> createState() => _CustomDropDown1State();
}

class _CustomDropDown1State extends State<CustomDropDown1> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55 * fertilizerData1.length.toDouble(),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: fertilizerData1.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context
                    .read<DropdownIndexCubit1>()
                    .getdropdowndetails(index, fertilizerData1[index].title);
                context.read<DropdownitemClickCubit1>().clickedDropDown();
              },
              child: Container(
                height: 54,
                width: 342,
                padding: const EdgeInsets.only(top: 17, left: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: index == 4
                        ? null
                        : Border(
                            bottom: BorderSide(color: CustomTheme.greylight)),
                    borderRadius: index == 4
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )
                        : null),
                child: Text(
                  fertilizerData1[index].title,
                  style: TextStyle(color: CustomTheme.textColor, fontSize: 16),
                ),
              ),
            );
          }),
    );
  }
}
