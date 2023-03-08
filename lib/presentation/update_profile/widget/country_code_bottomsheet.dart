import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/custom_theme.dart';
import '../cubit/getcountrycode/getcountrycode_cubit.dart';

class CountryCodeModel {
  final String flagUrl;
  final String countryName;
  final String countryCode;

  CountryCodeModel(this.flagUrl, this.countryName, this.countryCode);
}

List<CountryCodeModel> codeList = [
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "India",
    "+91",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Australia",
    "+61",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Argentina",
    "+54",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Bangladesh",
    "+880",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Belarus",
    "+375",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Canada",
    "+1",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Cyprus",
    "+357",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Denmark",
    "+45",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Dominica",
    "+1-767",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Estonia",
    "+372",
  ),
  CountryCodeModel(
    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
    "Ethiopia",
    "+251",
  ),
];

class CountryCodeWidget extends StatelessWidget {
  const CountryCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var codeindex = context.watch<GetcountrycodeCubit>().state.index;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          context: context,
          builder: (context) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Container(
              height: 530.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    // height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: CustomTheme.lightgrey,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 24),
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              'Choose Code',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomTheme.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomTheme.grey),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomTheme.grey),
                            ),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search country name or telecode...',
                            hintStyle: TextStyle(
                                color: CustomTheme.hintTextColor, fontSize: 13),
                            focusColor: CustomTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: codeList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<GetcountrycodeCubit>()
                                  .getcode(index);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: CustomTheme.grey),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      codeList[index].countryName,
                                      textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          color: CustomTheme.black,
                                          fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      codeList[index].countryCode,
                                      textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          color: CustomTheme.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 57,
        width: 20,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: CustomTheme.primaryColor),
            borderRadius: BorderRadius.circular(7)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                textScaleFactor: 1.0,
                codeList[codeindex].countryCode,
                style: TextStyle(color: CustomTheme.black, fontSize: 15)),
            const Icon(Icons.expand_more, size: 18)
          ],
        ),
      ),
    );
  }
}
