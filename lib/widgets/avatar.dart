import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    this.radius = 22,
    this.color = Colors.blueGrey,
  });

  final String? imageUrl;
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return CircleAvatar(radius: radius, backgroundColor: color);
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.network(
          imageUrl!,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Container(
              width: radius * 2,
              height: radius * 2,
              color: const Color(0xFFE5E7EB),
              child: const Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))),
            );
          },
          errorBuilder: (context, error, stack) => CircleAvatar(radius: radius, backgroundColor: color),
        ),
      ),
    );
  }
}


