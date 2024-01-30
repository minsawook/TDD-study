
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Hello World!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () => onPressed?.call(),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                      child: Icon(
                        Icons.wb_sunny,
                        key: Key('icon_weather'),
                      ),
                    ),
                    Text('Weather today'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}