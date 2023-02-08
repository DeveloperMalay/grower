import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/storing_calculation_data.dart';
import '../../../../theme/custom_theme.dart';
import '../../calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';

// ignore: must_be_immutable
class FertilizerResultWidget extends StatefulWidget {
  FertilizerResultWidget({
    super.key,
    required this.data,
    required this.index,
    required this.tdwofN,
    required this.tdwofP,
    required this.tdwofK,
    this.totalpercentN,
    this.totalpercentP,
    this.totalpercentK,
    required this.type,
  });
  var data;
  final int index;
  String tdwofN;
  String tdwofP;
  String tdwofK;
  String? totalpercentN;
  String? totalpercentP;
  String? totalpercentK;
  final String type;

  @override
  State<FertilizerResultWidget> createState() => _FertilizerResultWidgetState();
}

class _FertilizerResultWidgetState extends State<FertilizerResultWidget> {
  List othernutrients_percentage = [];
  List othernutrients_weight = [];
  getpercentage(int length) async {
    for (var i = 0; i < length; i++) {
      othernutrients_percentage
          .add(await getString('${widget.type}othernutrients$i'));
      othernutrients_weight
          .add(await getString('${widget.type}othernutrientsweight$i'));
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getpercentage(context
        .read<OtherNutrientsCubit>()
        .state
        .otherNutrients
        .otherNutrients
        .length);
  }

  @override
  Widget build(BuildContext context) {
    var othernutrients =
        context.read<OtherNutrientsCubit>().state.otherNutrients.otherNutrients;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: CustomTheme.shadowDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 155.w,
                child: Text("Nutrients", style: TextStyle(fontSize: 14)),
              ),
              Text("TDW(lbs)", style: TextStyle(fontSize: 14)),
              SizedBox(width: 16),
              Text("NPK(%)", style: TextStyle(fontSize: 14)),
            ],
          ),
          Divider(color: CustomTheme.primaryColor, thickness: 1.5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100.w,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nitrogen(N)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Phosphorus(P)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Potassium(K)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 40.w),
              Container(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.tdwofN,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(height: 12),
                    Text(widget.tdwofP,
                        style: TextStyle(
                            fontSize: 14, color: CustomTheme.primaryColor)),
                    SizedBox(height: 12),
                    Text(widget.tdwofK,
                        style: TextStyle(
                            fontSize: 14, color: CustomTheme.primaryColor))
                  ],
                ),
              ),
              Container(
                width: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.totalpercentN ??
                          widget.data[widget.index].percentN!,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.totalpercentP ??
                          widget.data[widget.index].percentP!,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.totalpercentK ??
                          widget.data[widget.index].percentK!,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text("Other added nutrients", style: TextStyle(fontSize: 14)),
            ],
          ),
          Divider(color: CustomTheme.primaryColor, thickness: 1.5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100.w,
                height: othernutrients.length * 30,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: othernutrients.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            othernutrients[index].name,
                            style: TextStyle(
                                fontSize: 14, color: CustomTheme.primaryColor),
                          ),
                          SizedBox(height: 12),
                        ],
                      );
                    }),
              ),
              SizedBox(width: 47.w),
              Container(
                width: 60,
                height: othernutrients.length * 30,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: othernutrients.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(othernutrients_weight[index] ?? '0',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: CustomTheme.primaryColor)),
                          SizedBox(height: 12),
                        ],
                      );
                    }),
              ),
              Container(
                width: 60,
                height: othernutrients.length * 30,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: othernutrients.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(othernutrients_percentage[index] ?? '0',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: CustomTheme.primaryColor)),
                          SizedBox(height: 12),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
