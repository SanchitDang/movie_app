import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/color_provider.dart';


class ColorSlider extends StatefulWidget {
  const ColorSlider({Key? key}) : super(key: key);

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ColorProvider>(builder: (context, myProvider, child){
              return  Column(
                children: [
                  Slider(
                      min: 0,
                      max: 1,
                      value: myProvider.getColorVal,
                      onChanged: (newVal){
                        myProvider.setColorVal(newVal);
                      }
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(height: 200, color: Colors.red.withOpacity(myProvider.getColorVal),)),
                      Expanded(
                          child: Container(height: 200, color: Colors.blue.withOpacity(myProvider.getColorVal),)),
                    ],
                  )
                ],
              );
            }),


          ],
        ),
      ),
    );
  }
}
