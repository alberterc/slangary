import 'package:flutter/material.dart';
import 'package:slangary/models/urban_dict.dart';
import 'package:slangary/services/saved_service.dart';

class SavedProvider with ChangeNotifier {
  List<Definition> _saved = [];

  List<Definition> get saved => _saved;

  Future<void> loadSaved() async {
    _saved = await SavedService(dbVersion: 1).getSaved();
  }
}
