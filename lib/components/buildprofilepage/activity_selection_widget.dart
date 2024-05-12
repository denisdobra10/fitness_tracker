import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityLevelSelectionWidget extends StatefulWidget {
  final VoidCallback onNextPressed;

  const ActivityLevelSelectionWidget({super.key, required this.onNextPressed});

  @override
  State<ActivityLevelSelectionWidget> createState() =>
      _ActivityLevelSelectionWidgetState();
}

class _ActivityLevelSelectionWidgetState
    extends State<ActivityLevelSelectionWidget> {
  String? _selectedActivityLevel = 'Moderat';

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<String>(
          isExpanded: true,
          value: _selectedActivityLevel,
          onChanged: (String? value) {
            setState(() {
              _selectedActivityLevel = value;
            });
          },
          items: <String>['Scazut', 'Moderat', 'Ridicat']
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
            if (_selectedActivityLevel != null) {
              appCoreProvider.updateInitialProfileData(
                  "activity", _selectedActivityLevel);
              widget.onNextPressed();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Selecteaza un nivel de activitate'),
                ),
              );
            }
          },
          child: const Text('Pregateste profilul'),
        ),
      ],
    );
  }
}
