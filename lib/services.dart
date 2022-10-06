import 'package:riverpod/riverpod.dart';
import 'package:riverpodapi/components/endpoint.dart';
import 'package:riverpodapi/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthenicationService {
  Future<List<Getapi>> apiService() async {
    String url = apicontant.baseurl + apicontant.endpoint;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return getapiFromJson(response.body);
    }

    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('something Went Wrong');
    }
  }
}

final useProvider =
    Provider<AuthenicationService>((ref) => AuthenicationService());
final userString = Provider<String>((ref) => 'Hi There');
