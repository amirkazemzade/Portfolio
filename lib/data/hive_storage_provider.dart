import 'package:hive/hive.dart';

const _isDarkKey = 'is_dark';

class HiveStorageProvider {
  HiveStorageProvider._();

  static final HiveStorageProvider _instance = HiveStorageProvider._();

  factory HiveStorageProvider() => _instance;

  final _collection = BoxCollection.open(
    'portfolio-storage',
    {_isDarkKey},
  );

  Future<CollectionBox<bool>> _getCollectionBox() async {
    final collection = await _collection;
    return collection.openBox<bool>(_isDarkKey);
  }

  Future<void> writeIsDark(bool isDark) async {
    final box = await _getCollectionBox();
    await box.put(_isDarkKey, isDark);
  }

  Future<bool?> readIsDark() async {
    final box = await _getCollectionBox();
    return box.get(_isDarkKey);
  }

  Future<void> deleteIsDark() async {
    final box = await _getCollectionBox();
    await box.delete(_isDarkKey);
  }
}
