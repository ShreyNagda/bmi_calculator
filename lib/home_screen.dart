import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late int _height;
  late int _weight;
  late int _age;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _height = 170;
    _weight = 60;
    _age = 20;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'B M I',
          ),
          titleTextStyle:
              Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
          // titleTextStyle: const TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            // color: Colors.teal,
            // width: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      icon: Icons.male_rounded,
                      label: "Male",
                      selected: selectedIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    CustomCard(
                      icon: Icons.female_rounded,
                      label: "Female",
                      selected: selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Slider(
                        min: 0,
                        max: 300,
                        value: _height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _height = value.toInt();
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Height (in cm)'),
                          Text('$_height'),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Slider(
                        min: 0,
                        max: 200,
                        value: _weight.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _weight = value.toInt();
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Weight (in kg)'),
                          Text('$_weight'),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Slider(
                        min: 0,
                        max: 150,
                        value: _age.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _age = value.toInt();
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Age (in yrs)'),
                          Text('$_age'),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        checkBMI();
                      },
                      child: const Text('Check B M I'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkBMI() {
    double height = _height / 100; //Height in metres.
    double bmi = _weight / (height * height);
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => ResultScreen(bmi: bmi,),
          fullscreenDialog: true,
        ));
  }
}
