
  import 'package:flutter/material.dart';

Widget infoCard(
      {required IconData icon, required String text, Widget? trailing}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 8),
          Text(text),
          const Spacer(),
          if (trailing != null) trailing,
        ],
      ),
    );
  }


