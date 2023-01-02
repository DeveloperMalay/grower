import 'package:flutter/material.dart';
import '../../../../utils/const.dart';
import '../../calculated_result_screen/calculated_result_screen.dart';

class DisclaimerAlertDialog extends StatelessWidget {
  const DisclaimerAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text("Disclaimer")),
          SizedBox(
            height: 6,
          ),
          Center(
            child: Container(
              height: 2,
              width: 100,
              color: primaryColor,
            ),
          )
        ],
      ),
      content: SizedBox(
        height: 310,
        width: 300,
        child: Scrollbar(
          thumbVisibility: true,
          radius: Radius.circular(10),
          child: ListView(
            children: [
              SizedBox(
                width: 280,
                child: Row(
                  children: [
                    Text(
                      'NOTICE OF WARRANTY –',
                      style: TextStyle(color: primaryColor, fontSize: 14),
                    ),
                    Text(
                      "Grower’s Secret",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ],
                ),
              ),
              Text(
                "Inc. warrants that the product conforms to its chemical description as is reasonable for the purposes stated on the label when used following directions under normal conditions of use. Crop injury, ineffectiveness, or other unintended consequences may result because of such factors as weather conditions, presence of other material, or manner of use or application, all of which are beyond the control of Grower’s Secret, Inc. In no case shall Grower’s Secret, Inc. be liable for consequential, special, or indirect damages resulting from the use or handling of this product. Grower’s Secret, Inc. makes no warranties of merchantability or fitness for a particular purpose nor any other express or implied warranty except as stated above.The rate may vary depending on application (soil or foliar), plant type, needs, size, soil conditions, and other products being applied. Ultimately, you are the grower and you know your plants better than we do. Grower's Secret suggests you engage with a professional that understands how to sample your soil and tissues and then makes recommendations based on those results concerning application rates.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              )
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CalculatedResultScreen()));
          },
          child: Center(
            child: Container(
              width: 120,
              margin: EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: primaryColor)),
              child: const Center(
                child: Text('Okay', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
