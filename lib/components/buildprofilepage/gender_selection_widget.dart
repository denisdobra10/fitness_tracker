import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderSelectionWidget extends StatefulWidget {
  final VoidCallback onNextPressed;

  const GenderSelectionWidget({super.key, required this.onNextPressed});

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  String? _selectedGender = 'Masculin';

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<String>(
          isExpanded: true,
          value: _selectedGender,
          onChanged: (String? value) {
            setState(() {
              _selectedGender = value;
            });
          },
          items: <String>['Masculin', 'Feminin']
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_selectedGender != null) {
              appCoreProvider.updateInitialProfileData("sex", _selectedGender);
              widget.onNextPressed();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Selecteaza sexul'),
                ),
              );
            }
          },
          child: const Text('Mai departe'),
        ),
      ],
    );
  }
}
