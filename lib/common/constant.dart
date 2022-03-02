import 'dart:convert';
import 'package:supabase/supabase.dart' as supa;

class SupaConstants {
  SupaConstants._();

  static const supabaseUrl = 'https://utpwqzjnwuicdzvfujxy.supabase.co';

  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0NDA2OTk0NCwiZXhwIjoxOTU5NjQ1OTQ0fQ.NcHuEC1RQHjAERDsCMkZzNRDBmI9Y586cOnkSik8yFU';

  static Future<String> all_candidate() async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    final selectResponse =
        await client.from('candidates_final').select().execute();

    String responseBody = "";
    if (selectResponse.error == null) {
      // print('response.data: ${selectResponse.data}');
      responseBody = json.encode(selectResponse.data);
    } else {
      responseBody = json.encode("[]");
    }

    return responseBody;
  }
}
