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
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF007AFF), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), 
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.note_add_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          const Text(
            'Add files', 
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