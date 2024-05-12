import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightSelectionWidget extends StatefulWidget {
  final VoidCallback onNextPressed;

  const WeightSelectionWidget({super.key, required this.onNextPressed});

  @override
  State<WeightSelectionWidget> createState() => _WeightSelectionWidget();
}

class _WeightSelectionWidget extends State<WeightSelectionWidget> {
  double _currentWeight = 50;

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Greutatea ta: ${_currentWeight.toStringAsFixed(0)}kg',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Slider(
          value: _currentWeight,
          min: 0,
          max: 150,
          divisions: 150,
          label: _currentWeight.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentWeight = value;
            });
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            appCoreProvider.updateInitialProfileData("weight", _currentWeight);
            widget.onNextPressed();
          },
          child: const Text('Mai departe'),
        ),
      ],
    );
  }
}
