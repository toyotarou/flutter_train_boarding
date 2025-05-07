import 'package:supabase_flutter/supabase_flutter.dart';

import 'dup_spot_model.dart';

class DupSpotRepository {
  ///
  Future<List<DupSpotModel>> getSupabaseDupSpotNameLimit() async {
    try {
      final PostgrestList response = await Supabase.instance.client.from('dup_spot_name_limit').select();

      final List<DupSpotModel> list =
          // ignore: always_specify_types
          (response as List).map((json) => DupSpotModel.fromJson(json as Map<String, dynamic>)).toList();

      return list;
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching dup_spot_name_limit at supabase: $error');
      return <DupSpotModel>[];
    }
  }
}
