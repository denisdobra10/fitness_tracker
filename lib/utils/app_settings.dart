import 'package:fitness_tracker/services/api_service.dart';
import 'package:fitness_tracker/utils/local_storage.dart';
import 'package:flutter/material.dart';

final Map<String, String> appData = {
  'image_path': 'assets/random-user.jpg',
};

final macroNutrientsEnergeticValues = {'protein': 4, 'fat': 9, 'carbo': 4};

class AppCore extends ChangeNotifier {
  final Map<String, dynamic> _initialProfileData = {
    "name": "",
    "sex": "",
    "age": -1,
    "weight": -1,
    "height": -1,
    "activity": ""
  };

  late Map<String, dynamic> _userData;

  Map<String, dynamic> get initialProfileData =>
      Map.unmodifiable(_initialProfileData);

  Map<String, dynamic> get userData => _userData;

  void updateInitialProfileData(String key, dynamic value) {
    if (!_initialProfileData.containsKey(key)) {
      throw ArgumentError('Invalid key: $key');
    }

    _initialProfileData[key] = value;
    notifyListeners();
  }

  void updateUserData(Map<String, dynamic> data) {
    _userData = data;
    LocalStorage.save('userData', _userData);
    notifyListeners();
  }

  Future<void> updateUserDataFromStorage() async {
    final userData = await LocalStorage.load('userData');
    if (userData != null) {
      _userData = userData;
      notifyListeners();
    } else {
      _userData = <String, dynamic>{};
      notifyListeners();
    }
  }

  Future<bool> hasProfile() async {
    //await LocalStorage.delete('userData');
    await updateUserDataFromStorage();

    if (_userData.isNotEmpty) {
      Map<String, dynamic>? response =
          await ApiService().getUserData(_userData['user']['id']);
      _userData = response!;
      notifyListeners();
    }

    return _userData.isNotEmpty;
  }
}
