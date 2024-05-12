import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameSelectionWidget extends StatefulWidget {
  final VoidCallback onNextPressed;

  const NameSelectionWidget({super.key, required this.onNextPressed});

  @override
  State<NameSelectionWidget> createState() => _NameSelectionWidgetState();
}

class _NameSelectionWidgetState extends State<NameSelectionWidget> {
  late String _name = '';

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Numele tau: $_name',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {
            setState(() {
              _name = value;
            });
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            appCoreProvider.updateInitialProfileData("name", _name);
            widget.onNextPressed();
          },
          child: const Text('Mai departe'),
        ),
      ],
    );
  }
}
