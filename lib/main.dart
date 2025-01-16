import 'package:flutter/material.dart';

void main() {
  runApp(SpotlightApp());
}

class SpotlightApp extends StatelessWidget {
  const SpotlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpotlightEffectPractice(),
    );
  }
}

class SpotlightEffectPractice extends StatefulWidget {
  const SpotlightEffectPractice({super.key});

  @override
  State<SpotlightEffectPractice> createState() =>
      _SpotlightEffectPracticeState();
}

class _SpotlightEffectPracticeState extends State<SpotlightEffectPractice> {
  Offset _spotlightPosition = Offset(200, 300);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _spotlightPosition += details.delta;
            });
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '''
    Hello! My name is Zeeshan, and I am a skilled software engineer and Flutter developer with a passion for creating innovative and efficient mobile applications. With expertise in building dynamic and user-friendly solutions, I specialize in leveraging the power of Flutter to craft seamless cross-platform experiences.

I thrive on solving complex challenges, whether it’s designing responsive UIs, optimizing app performance, or implementing cutting-edge features. My approach to development focuses on clean, maintainable code and delivering products that align with user needs and expectations.

As a tech enthusiast, I enjoy exploring the latest tools and technologies in the ever-evolving world of software development. I am committed to continuous learning and always look forward to contributing to impactful projects.
                    ''',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return RadialGradient(
                      center: Alignment(
                        (_spotlightPosition.dx - rect.width / 2) /
                            (rect.width / 2),
                        (_spotlightPosition.dy - rect.height / 2) /
                            (rect.height / 2),
                      ),
                      radius: 0.3,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      // stops: [0.3, 1.0],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
