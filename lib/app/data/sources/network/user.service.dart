import 'package:aprofrem_mvvm/app/data/mappers/user.mapper.dart';
import 'package:aprofrem_mvvm/app/domain/models/response.model.dart';
import 'package:aprofrem_mvvm/core/di/components/http_client.dart';
import 'package:aprofrem_mvvm/core/di/service_locator.dart';

import './base/endpoints.dart' as Endpoints;

class UserService {
  final client = serviceLocator<HttpClient>();

  Future<ResponseModel> list() async {
    ResponseModel response = ResponseModel();

    final String url = Endpoints.myList.list;

    final ret = client.get(url);

    await ret.then((res) {
      response.status = res.statusCode;
      response.data = UserMapper.fromJsonList(res.data);
      response.message = res.statusMessage;
    }).catchError((e) {
      response.status = 500;
      response.data = e;
      response.message = "Server Error";
    });

    return response;
  }
}
