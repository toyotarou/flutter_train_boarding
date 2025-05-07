import 'package:supabase_flutter/supabase_flutter.dart';

import 'bus_info_model.dart';

class BusInfoRepository {
  ///
  Future<List<BusInfoModel>> getSupabaseBusInfo() async {
    try {
      final PostgrestList response = await Supabase.instance.client.from('bus_stop_address').select();

      final List<BusInfoModel> list =
          // ignore: always_specify_types
          (response as List).map((json) => BusInfoModel.fromJson(json as Map<String, dynamic>)).toList();

      return list;
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching bus_stop_address at supabase: $error');
      return <BusInfoModel>[];
    }
  }
}
