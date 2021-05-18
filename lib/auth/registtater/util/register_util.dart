import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:test1/auth/registtater/model/register_model.dart';

class RegisterController extends GetxController {
  var registerModelList = new RegisterModel().obs;

  static var status = false.obs;

  registrationUser(name, email, password, phone, image, context) async {
    Map payload = {
      "name": name,
      "email": email,
      "password": password,
      "mobile": phone,
      "profile_image": image,
    };

    String url =
        "${"https://manadukaan.com/api/post/create_account_with_mobile"}";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: payload,
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      var data;
      try {
        data = jsonDecode(response.body);
        print("Response  Data_______$data");
        RegisterModel registerModel = RegisterModel.fromJson(data);

        print("Hello");
        print(registerModel);
        status.value = true;
        return registerModel;
      } catch (e) {
        status.value = false;
        print("Error_______$e");
      }
    } else {
      status.value = false;
      status.value = false;
    }
    return status.value;
  }
}
