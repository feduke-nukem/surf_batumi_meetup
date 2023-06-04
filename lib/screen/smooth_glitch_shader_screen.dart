import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class SmoothGlitchShaderScreen extends StatefulWidget {
  const SmoothGlitchShaderScreen({super.key});

  @override
  State<SmoothGlitchShaderScreen> createState() =>
      _SmoothGlitchShaderScreenState();
}

class _SmoothGlitchShaderScreenState extends State<SmoothGlitchShaderScreen>
    with SingleTickerProviderStateMixin {
  double _time = 0.0;

  late final _ticker = createTicker((elapsed) {
    setState(() {
      _time += 0.01;
    });
  });

  @override
  void initState() {
    super.initState();
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
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
                ..setFloat(0, _time)
                ..setFloat(1, size.width)
                ..setFloat(2, size.height)
                ..setImageSampler(0, image);
              canvas.save();
              canvas.drawRect(
                Offset.zero & size,
                Paint()..shader = shader,
              );
              canvas.restore();
            },
            child: child!,
          ),
          assetKey: 'shaders/smooth_glitch.frag',
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
