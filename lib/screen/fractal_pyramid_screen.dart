import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class FractalPyramidScreen extends StatefulWidget {
  const FractalPyramidScreen({super.key});

  @override
  State<FractalPyramidScreen> createState() => _FractalPyramidScreenState();
}

class _FractalPyramidScreenState extends State<FractalPyramidScreen>
    with SingleTickerProviderStateMixin {
  double _time = 0.0;

  late final _ticker = createTicker((elapsed) {
    setState(() {
      _time += 0.060;
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
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ShaderBuilder(
          (context, shader, child) => AnimatedSampler(
            (image, size, canvas) {
              shader
                ..setFloat(0, _time)
                ..setFloat(1, size.width)
                ..setFloat(2, size.height);
              canvas.save();
              canvas.drawRect(
                Offset.zero & size,
                Paint()..shader = shader,
              );
              canvas.restore();
            },
            child: child!,
          ),
          assetKey: 'shaders/fractal_pyramid.frag',
          child: SizedBox(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
          ),
        ),
      ),
    );
  }
}
