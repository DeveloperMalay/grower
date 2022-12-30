import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue = null;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Granules 8-3-1", child: Text("Granules 8-3-1")),
      DropdownMenuItem(
          value: "Nitrogen 16-0-0", child: Text("Nitrogen 16-0-0")),
      DropdownMenuItem(
          value: "Phosphorus Fertilizer 0-9-0",
          child: Text("Phosphorus Fertilizer 0-9-0")),
      DropdownMenuItem(
          value: "Seaweed Powder Soluble 0-0-16",
          child: Text("Seaweed Powder Soluble 0-0-16")),
      DropdownMenuItem(
          value: "Soluble Corn Steep Powder 7-6-4",
          child: Text("Soluble Corn Steep Powder 7-6-4")),
      DropdownMenuItem(value: "Other", child: Text("Other")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) => value == null ? "Select a country" : null,
        dropdownColor: Colors.white,
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems);
  }
}
