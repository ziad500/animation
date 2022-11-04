import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _margin = 0;
  double _opacity = 1;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    double width = widthScreen * 0.5;

    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        width: width,
        color: _color,
        duration: const Duration(seconds: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                if (_margin == 50) {
                  setState(() {
                    _margin = 0;
                    _color = Colors.blue;
                    _opacity = 1;
                  });
                } else if (_margin == 0) {
                  setState(() {
                    _margin = 50;
                    _color = Colors.red;
                    _opacity = 0;
                  });
                }
              },
              child: const Text("animate margin"),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: const Text(
                "hide me",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
