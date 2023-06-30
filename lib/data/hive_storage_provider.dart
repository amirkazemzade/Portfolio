import 'dart:developer';

import 'package:hive/hive.dart';

const _isDarkKey = 'is_dark';
const _seedColorKey = 'seed_color';

class HiveStorageProvider {
  HiveStorageProvider._();

  static final HiveStorageProvider _instance = HiveStorageProvider._();

  factory HiveStorageProvider() => _instance;

  final _collection = BoxCollection.open(
    'portfolio-storage',
    {_isDarkKey, _seedColorKey},
  );

  Future<CollectionBox<bool>> _getIsDarkCollectionBox() async {
    final collection = await _collection;
    return collection.openBox<bool>(_isDarkKey);
  }

  Future<CollectionBox<int>> _getSeedColorCollectionBox() async {
    final collection = await _collection;
    return collection.openBox<int>(_seedColorKey);
  }

  Future<void> writeIsDark(bool isDark) async {
    final box = await _getIsDarkCollectionBox();
    await box.put(_isDarkKey, isDark);
  }

  Future<bool?> readIsDark() async {
    final box = await _getIsDarkCollectionBox();
    return box.get(_isDarkKey);
  }

  Future<void> deleteIsDark() async {
    final box = await _getIsDarkCollectionBox();
    await box.delete(_isDarkKey);
  }

  Future<void> writeSeedColor(int seedColor) async {
    final box = await _getSeedColorCollectionBox();
    await box.put(_seedColorKey, seedColor);
  }

  Future<int?> readSeedColor() async {
    final box = await _getSeedColorCollectionBox();
    try {
      final seedColor = box.get(_seedColorKey);
      return seedColor;
    } catch (e, t) {
      log('hive error: $e\n$t');
      return null;
    }
  }

  Future<void> deleteSeedColor() async {
    final box = await _getSeedColorCollectionBox();
    await box.delete(_seedColorKey);
  }
}
