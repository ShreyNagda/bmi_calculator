import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const CustomCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap,
      required this.selected});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: widget.onTap,
          child: Card(
            color: widget.selected ? Colors.blue : Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(
                    widget.icon,
                    size: 55,
                  ),
                  Text(widget.label, style: const TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
