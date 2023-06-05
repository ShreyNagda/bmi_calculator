import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final double bmi;
  const ResultScreen({super.key, required this.bmi});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String msg;
  late AssetImage image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double bmi = widget.bmi;
    if (bmi < 18.5) {
      msg = "You are\nUNDERWEIGHT";
      image = const AssetImage('assets/images/thin_man.png');
    } else if (bmi >= 18.5 && bmi < 24.9) {
      msg = "You are\nFIT";
      image = const AssetImage('assets/images/muscular_man.png');
    } else {
      msg = "You are\nOVERWEIGHT";
      image = const AssetImage('assets/images/fat_man.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: SizedBox(
                // color: Colors.red,
                width: orientation == Orientation.landscape
                    ? constraints.maxHeight / 2
                    : constraints.maxWidth / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: orientation == Orientation.landscape
                          ? 16 / 9
                          : 9 / 16,
                      child: Image(
                        image: image,
                        width: 300,
                      ),
                    ),
                    Text(
                      msg,
                      style: const TextStyle(
                          fontSize: 24, fontFamily: 'Montserrat'),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
