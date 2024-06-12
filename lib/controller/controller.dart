import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CatController extends GetxController {
  Dio dio = Dio();
  List images = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCatImages();
  }

  void getCatImages() async {
    final response =
        await dio.get("https://api.thecatapi.com/v1/images/search?limit=10",
            options: Options(headers: {
              'Authorization':
                  'live_61eGPohh5R6OSVxNLfLFzhZZIiW7Ut1cc32Rn2rxfgK5fwP22o6yuEfHRhgnYgUP'
            }));
    if (response.statusCode == 200) {
      images.assignAll(response.data);
    } else {
      Get.snackbar("Erreur", "${response.statusCode}");
    }
  }
}
