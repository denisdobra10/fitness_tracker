import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgeSelectionWidget extends StatefulWidget {
  const AgeSelectionWidget({super.key, required this.onNextPressed});
  final VoidCallback onNextPressed;
  @override
  State<AgeSelectionWidget> createState() => _AgeSelectionWidgetState();
}

class _AgeSelectionWidgetState extends State<AgeSelectionWidget> {
  double _currentAge = 18;

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Varsta ta: ${_currentAge.toStringAsFixed(0)} ani',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Slider(
          value: _currentAge,
          min: 18,
          max: 99,
          divisions: 150,
          label: _currentAge.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentAge = value;
            });
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            appCoreProvider.updateInitialProfileData("age", _currentAge);
            widget.onNextPressed();
          },
          child: const Text('Mai departe'),
        ),
      ],
    );
  }
}
