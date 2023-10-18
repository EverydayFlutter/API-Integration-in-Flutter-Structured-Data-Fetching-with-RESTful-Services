import 'dart:convert';

import 'package:api_integration/models/agency.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl =
      "https://api.usaspending.gov/api/v2/references/toptier_agencies/";

  Future<AgencyResult> fetchAgencies() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return AgencyResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load agencies');
    }
  }
}
