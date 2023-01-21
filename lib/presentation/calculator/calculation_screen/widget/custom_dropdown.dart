import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/custom_theme.dart';
import '../../widgets/fertilizer_model.dart';
import '../cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../cubit/dropdownitemClick/dropdownitem_click_cubit.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.white),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0.5),
                    blurRadius: 0.03,
                    spreadRadius: 0.03,
                  ),
                ]),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                context
                        .watch<DropdownitemClickCubit>()
                        .state
                        .dropdownItenClicked
                    ? Icon(
                        Icons.expand_more_outlined,
                        color: CustomTheme.primaryColor,
                        size: 30,
                      )
                    : Icon(
                        Icons.arrow_forward_ios,
                        color: CustomTheme.primaryColor,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  context.watch<DropdownIndexCubit>().state.fertilizer,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        context.watch<DropdownitemClickCubit>().state.dropdownItenClicked
            ? SizedBox(
                height: 55 * fertilizerData.length.toDouble(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: fertilizerData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.read<DropdownIndexCubit>().getdropdowndetails(
                              index, fertilizerData[index].title);
                          context
                              .read<DropdownitemClickCubit>()
                              .clickedDropDown();
                        },
                        child: Container(
                          height: 54,
                          width: 342,
                          padding: const EdgeInsets.only(top: 17, left: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: index == 5
                                  ? null
                                  : Border(
                                      bottom: BorderSide(
                                          color: CustomTheme.greylight)),
                              borderRadius: index == 5
                                  ? BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    )
                                  : null),
                          child: Text(
                            fertilizerData[index].title,
                            style: TextStyle(
                                color: CustomTheme.textColor, fontSize: 16),
                          ),
                        ),
                      );
                    }),
              )
            : Container()
      ],
    );
  }
}
