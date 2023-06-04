import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class DistortedGlitchShaderScreen extends StatefulWidget {
  const DistortedGlitchShaderScreen({super.key});

  @override
  State<DistortedGlitchShaderScreen> createState() =>
      _DistortedGlitchShaderScreenState();
}

class _DistortedGlitchShaderScreenState
    extends State<DistortedGlitchShaderScreen>
    with SingleTickerProviderStateMixin {
  late final _time = _controller.drive(
    Tween(begin: 0.0, end: 1.0),
  );

  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 1,
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _time,
          builder: (context, child) => ShaderBuilder(
            (context, shader, child) => AnimatedSampler(
              (image, size, canvas) {
                shader
                  ..setFloat(0, _time.value)
                  ..setFloat(1, size.width)
                  ..setFloat(2, size.height)
                  ..setImageSampler(0, image)
                  ..setImageSampler(1, image);
                canvas.save();
                canvas.drawRect(
                  Offset.zero & size,
                  Paint()..shader = shader,
                );
                canvas.restore();
              },
              child: child!,
            ),
            assetKey: 'shaders/distorted_glitch.frag',
            child: Image.asset(
              'assets/cyberpunk.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
