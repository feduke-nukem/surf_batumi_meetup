import 'package:flutter/material.dart';
import 'package:statsfl/statsfl.dart';
import 'package:surf_batumi_meetup/screen/screen.dart';

enum ExampleType {
  animatedGlitch,
  animatedGlitchShaderAnalog,
  distortedGlitchShader,
  shakingGlitch,
  smoothGlitchShader,
  fractalPyramid;
}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StatsFl(
      height: 100.0,
      width: double.infinity,
      align: Alignment.bottomCenter,
      child: MaterialApp(
        title: 'Animated Glitch Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Animated Glitch demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ExampleType.values.map(
            (e) {
              final title = switch (e) {
                ExampleType.animatedGlitch => 'Animated Glitch',
                ExampleType.animatedGlitchShaderAnalog =>
                  'Animated Glitch Shader Analog',
                ExampleType.distortedGlitchShader => 'Distorted Glitch Shader',
                ExampleType.shakingGlitch => 'Shaking Glitch Shader',
                ExampleType.smoothGlitchShader => 'SmoothGlitch Shader',
                ExampleType.fractalPyramid => 'Bonus',
              };

              final screen = switch (e) {
                ExampleType.animatedGlitch => const AnimatedGlitchScreen(),
                ExampleType.animatedGlitchShaderAnalog =>
                  const AnimatedGlitchShaderAnalogScreen(),
                ExampleType.distortedGlitchShader =>
                  const DistortedGlitchShaderScreen(),
                ExampleType.shakingGlitch => const ShakingGlitchScreen(),
                ExampleType.smoothGlitchShader =>
                  const SmoothGlitchShaderScreen(),
                ExampleType.fractalPyramid => const FractalPyramidScreen(),
              };

              final color = switch (e) {
                ExampleType.animatedGlitch => Colors.deepPurple,
                ExampleType.animatedGlitchShaderAnalog => Colors.blue,
                ExampleType.distortedGlitchShader => Colors.orange,
                ExampleType.shakingGlitch => Colors.pink,
                ExampleType.smoothGlitchShader => Colors.indigo,
                ExampleType.fractalPyramid => Colors.red,
              };

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    minimumSize: Size(MediaQuery.of(context).size.width, 40.0),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => screen,
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
