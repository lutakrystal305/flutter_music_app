import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class ParticleWidget extends StatelessWidget {
  Size size;
  ParticleWidget(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularParticle(
        // key: UniqueKey(),
        awayRadius: 80,
        numberOfParticles: 200,
        speedOfParticles: 1,
        height: size.height,
        width: size.width,
        onTapAnimation: true,
        particleColor: Colors.white.withAlpha(150),
        awayAnimationDuration: Duration(milliseconds: 600),
        maxParticleSize: 4,
        isRandSize: true,
        isRandomColor: true,
        awayAnimationCurve: Curves.easeInOutBack,
        enableHover: true,
        hoverColor: Colors.white,
        hoverRadius: 90,
        connectDots: true, //not recommended
      ),
    );
  }
}
