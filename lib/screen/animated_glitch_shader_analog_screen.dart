import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';

class AnimatedGlitchShaderAnalogScreen extends StatefulWidget {
  const AnimatedGlitchShaderAnalogScreen({super.key});

  @override
  State<AnimatedGlitchShaderAnalogScreen> createState() =>
      _AnimatedGlitchShaderAnalogScreenState();
}

class _AnimatedGlitchShaderAnalogScreenState
    extends State<AnimatedGlitchShaderAnalogScreen> {
  double _distortionOffsetDivisor = 15.0;
  double _colorChannelOffsetDivisor = 20.0;
  double _level = 0.2;
  double _frequency = 0.6;
  int _glitchAmount = 2;
  int _chance = 50;
  bool _showDistortion = true;
  bool _showColorChannel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Distortion Offset reduce',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _distortionOffsetDivisor,
                onChanged: (value) {
                  setState(() {
                    _distortionOffsetDivisor = value;
                  });
                },
                min: 1,
                max: 40,
              ),
              const Text(
                'Color Channel Offset reduce',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _colorChannelOffsetDivisor,
                onChanged: (value) {
                  setState(() {
                    _colorChannelOffsetDivisor = value;
                  });
                },
                min: 1,
                max: 45,
              ),
              const Text(
                'level',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _level,
                onChanged: (value) {
                  setState(() {
                    _level = value;
                  });
                },
                min: 0.0,
                max: 1.0,
              ),
              const Text(
                'glitchAmount',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _glitchAmount.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _glitchAmount = value.toInt();
                  });
                },
                min: 0,
                max: 10,
              ),
              const Text(
                'frequency',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _frequency,
                onChanged: (value) {
                  setState(() {
                    _frequency = value;
                  });
                },
                min: 0.0,
                max: 1.0,
              ),
              const Text(
                'chance',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _chance.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _chance = value.toInt();
                  });
                },
                min: 0,
                max: 100,
              ),
              const Text(
                'showDistortion',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _showDistortion,
                onChanged: (value) {
                  setState(() {
                    _showDistortion = value;
                  });
                },
              ),
              const Text(
                'showColorChannel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _showColorChannel,
                onChanged: (value) {
                  setState(() {
                    _showColorChannel = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedGlitchWithShader(
          chance: _chance,
          showColorChannel: _showColorChannel,
          showDistortion: _showDistortion,
          colorChannelSpreadReduce: _colorChannelOffsetDivisor,
          distortionSpreadReduce: _distortionOffsetDivisor,
          frequency: _frequency,
          glitchAmount: _glitchAmount,
          level: _level,
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
