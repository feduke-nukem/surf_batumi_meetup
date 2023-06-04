import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class ShakingGlitchScreen extends StatefulWidget {
  const ShakingGlitchScreen({super.key});

  @override
  State<ShakingGlitchScreen> createState() => _ShakingGlitchScreenState();
}

class _ShakingGlitchScreenState extends State<ShakingGlitchScreen>
    with SingleTickerProviderStateMixin {
  double _time = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _time += 0.016;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ShaderBuilder(
          (context, shader, child) => AnimatedSampler(
            (image, size, canvas) {
              shader
                ..setFloat(0, size.width)
                ..setFloat(1, size.height)
                ..setFloat(2, _time)
                ..setImageSampler(0, image);

              canvas
                ..save()
                ..drawRect(
                  Offset.zero & size,
                  Paint()..shader = shader,
                )
                ..restore();
            },
            child: child!,
          ),
          assetKey: 'shaders/shaking_glitch.frag',
          child: Image.asset(
            'assets/cyberpunk.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
