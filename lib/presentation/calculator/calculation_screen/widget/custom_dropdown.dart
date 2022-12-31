import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/const.dart';
import '../../widgets/fertilizer_model.dart';
import '../cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../cubit/dropdownitemClick/dropdownitem_click_cubit.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55 * fertilizerData.length.toDouble(),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: fertilizerData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context
                    .read<DropdownIndexCubit>()
                    .getdropdowndetails(index, fertilizerData[index].title);
                context.read<DropdownitemClickCubit>().clickedDropDown();
              },
              child: Container(
                height: 54,
                width: 342,
                padding: const EdgeInsets.only(top: 17, left: 33),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: index == 5
                        ? null
                        : Border(bottom: BorderSide(color: greylight)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0.5),
                        blurRadius: 0.03,
                        spreadRadius: 0.03,
                      ),
                    ]),
                child: Text(
                  fertilizerData[index].title,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            );
          }),
    );
  }
}
