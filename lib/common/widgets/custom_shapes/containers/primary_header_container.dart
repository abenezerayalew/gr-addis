import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../utils/constants/colors.dart';
import 'curved_edges.dart';

class GPrimaryHeaderContainer extends StatelessWidget {
  const GPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return

        /// - Test for curved container
        /// - If it is not working, just remove this(ClipPath) widget and add bottom curve (borderRadius) from curved_edges.dart file.
        ClipPath(
      clipper: GCustomCurvedEdges(),
      child: GCurvedEdgesWidget(
          child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -250,
            child: GCircularContainer(
              backgroundColor: GColors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
              top: 100,
              right: -300,
              child: GCircularContainer(
                  backgroundColor: GColors.white.withOpacity(0.1))),
          child
        ],
      )),
    );
  }
}

class GCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    /// - first

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    /// - second
    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    /// - third
    final thirdfirstCurve = Offset(size.width, size.height - 20);
    final thirdlastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdfirstCurve.dx, thirdfirstCurve.dy,
        thirdlastCurve.dx, thirdlastCurve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
