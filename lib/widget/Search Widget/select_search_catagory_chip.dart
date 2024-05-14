import 'package:flutter/material.dart';

class SelectSearchCatagoryChip extends StatelessWidget {
  const SelectSearchCatagoryChip(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.icon});
  final String title;
  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      padding: const EdgeInsets.only(left: 3),
      width: 90,
      height: 32,
      decoration: BoxDecoration(
          color: (isSelected)
              ? Colors.blue
              : const Color.fromARGB(22, 255, 153, 0),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Icon(
            icon,
            color: (isSelected) ? Colors.white : Colors.blue,
          ),
          Text(
            title,
            style: TextStyle(
              color: (isSelected) ? Colors.white : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectSearchCatagoryChipForLargeText extends StatelessWidget {
  const SelectSearchCatagoryChipForLargeText(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.icon});
  final String title;
  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      padding: const EdgeInsets.only(left: 3),
      width: 130,
      height: 32,
      decoration: BoxDecoration(
          color: (isSelected)
              ? Colors.blue
              : const Color.fromARGB(22, 255, 153, 0),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Icon(
            icon,
            color: (isSelected) ? Colors.white : Colors.blue,
          ),
          Text(
            title,
            style: TextStyle(
              color: (isSelected) ? Colors.white : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
