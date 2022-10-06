import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodapi/models/user_model.dart';
import 'package:riverpodapi/services.dart';

final userDataProvider = FutureProvider<List<Getapi>>((ref) async {
  return ref.watch(useProvider).apiService();
});
