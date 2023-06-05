import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final int initialNumber;
  final String label;
  const NumberPicker(
      {super.key, required this.initialNumber, required this.label});

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  static late int value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = widget.initialNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    value--;
                  });
                },
                icon: const Icon(Icons.remove),
              ),
              Text(
                '$value',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    value++;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Text(
            widget.label,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
