import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class IconWidget extends StatelessWidget {
  IconData icon;
  Color color;
   IconWidget({required this.icon,this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:Colors.black.withOpacity(0.2)
        ),
        child: Icon(icon,size:Dimension.scaleWidth(40),color: Colors.white,));
  }
}
