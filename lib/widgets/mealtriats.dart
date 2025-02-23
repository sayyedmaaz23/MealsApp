import 'package:flutter/material.dart';

class Mealtriats extends StatelessWidget {
  const Mealtriats({super.key, required this.icon, required this.msg});
  final IconData icon;
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(msg,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ))
      ],
    );
  }
}
