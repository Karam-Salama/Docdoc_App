import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/login/data/models/login_request_body.dart';
import 'package:doc_doc/features/login/data/models/login_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo({required this.apiService});

  Future<ApiResult<LoginResponse>> login (LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}