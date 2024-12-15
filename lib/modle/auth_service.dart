import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://10.0.2.2/Signup/auth/";
  final box = GetStorage();
  Future<Map<String, dynamic>> signUp(
      String name, String email, String password) async {
    final uri = Uri.parse("${baseUrl}Sign_up.php");

    try {
      final response = await http.post(uri, body: {
        "name": name,
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // إرجاع الاستجابة كـ JSON
      } else {
        return {"status": "error", "message": "فشل الاتصال بالخادم"};
      }
    } catch (e) {
      return {"status": "error", "message": "حدث خطأ: $e"};
    }
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse("${baseUrl}Sign_in.php");

    try {
      final response = await http.post(url, body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["status"] == "ok") {
          // حفظ البيانات في التخزين
          box.write('name', data['name']);
          box.write('email', data['email']);
        }
        return data;
      } else {
        return {"status": "error", "message": "فشل الاتصال بالخادم"};
      }
    } catch (e) {
      return {"status": "error", "message": "حدث خطأ: $e"};
    }
  }


  // دالة لجلب الأخبار كـ Stream
  Stream<List<dynamic>> fetchNewsStream() async* {
    final String apiUrl = "http://10.0.2.2/Signup/news.php"; // رابط API

    while (true) {
      try {
        final response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          final newsList = jsonDecode(response.body);
          yield newsList; // إرسال الأخبار إلى الـ Stream
        } else {
          yield []; // إرسال قائمة فارغة إذا كان هناك خطأ
        }
      } catch (e) {
        yield []; // إرسال قائمة فارغة عند حدوث استثناء
      }
      await Future.delayed(Duration(seconds: 5)); // تحديث البيانات كل 10 ثوانٍ
    }
  }
}
