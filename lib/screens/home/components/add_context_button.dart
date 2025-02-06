import 'package:flutter/material.dart';

class AddContextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddContextButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // 1. Style the button
      style: ElevatedButton.styleFrom(
        // Primary button color
        backgroundColor: const Color(0xFF007AFF), // or Colors.blue, etc.
        // Round the corners
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), 
        ),
        // Increase vertical/horizontal padding for a bigger tap area
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      onPressed: onPressed,
      // 2. Build a Row with an icon + text
      child: Row(
        mainAxisSize: MainAxisSize.min, // Wraps content; remove if you want full-width
        children: [
          Icon(
            Icons.note_add_outlined,  // or any icon that fits your design
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          const Text(
            'Add more context', 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}