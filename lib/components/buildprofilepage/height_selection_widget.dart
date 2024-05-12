import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightSelectionWidget extends StatefulWidget {
  final VoidCallback onNextPressed;

  const HeightSelectionWidget({super.key, required this.onNextPressed});

  @override
  State<HeightSelectionWidget> createState() => _HeightSelectionWidget();
}

class _HeightSelectionWidget extends State<HeightSelectionWidget> {
  double _currentHeight = 150;

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Inaltimea ta: ${_currentHeight.toStringAsFixed(0)}cm',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Slider(
          value: _currentHeight,
          min: 0,
          max: 300,
          divisions: 300,
          label: _currentHeight.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentHeight = value;
            });
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            appCoreProvider.updateInitialProfileData("height", _currentHeight);
            widget.onNextPressed();
          },
          child: const Text('Mai departe'),
        ),
      ],
    );
  }
}
