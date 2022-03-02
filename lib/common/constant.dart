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

    final selectResponse = await client
        .from('candidates_final')
        .select(
            "id,verified,name,mobile,email,total_exp,current_company,current_company_type,current_ctc,min_expected_ctc,job_search_profile,skill,job_prefer_type,job_prefer_location,job_search_status,holding_ctc,notice_period_status,earliest_joining_date,college_name_highest_degree,candidate_status,remark")
        .execute();

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
