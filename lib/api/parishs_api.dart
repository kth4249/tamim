import 'package:tamim/main.dart';
import 'package:tamim/models/parish.dart';

class ParishsApi {
  static Future<List<Parish>> getParishsEqParams(
      {Map<String, dynamic> params = const {}}) async {
    var query = supabase.from('parishs').select('*');
    for (var param in params.entries) {
      query = query.eq(param.key, param.value);
    }
    final response = await query;
    logger.d("getParishsEqParams: $response");
    return response.map((json) => Parish.fromJson(json)).toList();
  }

  static Future<List<Parish>> getParishsLikeParams(
      Map<String, dynamic> params) async {
    final query = supabase.from('parishs').select('*');
    for (var param in params.entries) {
      query.like(param.key, '%${param.value}%');
    }
    final response = await query;
    return response.map((json) => Parish.fromJson(json)).toList();
  }
}
