

import 'package:dio/dio.dart';
import 'package:medical_retrieval/res/sever_url.dart';
import 'code.dart';

import 'dart:collection';

import 'result_data.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio = new Dio(); // 使用默认配置

  HttpManager();

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  Future<ResultData?> netFetch(
      url, params, Map<String, dynamic>? header, Options? option,
      {noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response? errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(
            statusCode: 666, requestOptions: RequestOptions(path: url));
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorResponse!.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(
          Code.errorHandleFunction(errorResponse!.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }
}

final HttpManager httpManager = new HttpManager();

///搜索结果请求
class SearchApi {
  final Dio _dio = Dio();

  Future<Response> search(String searchTerm) async {
    return await _dio.get('https://your-api-endpoint.com/search?q=$searchTerm');
  }
}

///登录
class LoginApi {
  final Dio _dio = Dio();
  Future<Response> login(
      String username,
      String password,
      String verifyCode,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.post('${SeverUrl.BASE_URL}${SeverUrl.login}',data: {
      'username':username,
      'password':password,
      'verifyCode':verifyCode,
    });
  }
}

///注册
class RegisterApi {
  final Dio _dio = Dio();

  Future<Response> register(
      String dpname,
      String username,
      String password,
      String linkman,
      String telephone,
      String useremail,
      String location,
      String verifyCode,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.post('${SeverUrl.BASE_URL}${SeverUrl.register}',data: {
      'dpname':dpname,
      'username':username,
      'password':password,
      'linkman':linkman,
      'telephone':telephone,
      'useremail':useremail,
      'location':location,
      'verifyCode':verifyCode,
    });
  }
}


///测试
class RegisterTest {
  final Dio _dio = Dio();

  Future<Response> register(
      String username,
      String password,
      String email,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.post('${SeverUrl.BASE_URL}${SeverUrl.register}',data: {
      'username':username,
      'password':password,
      'email':email,
    });
  }
}
///获取验证码
class VerifyCodeApi {
  final Dio _dio = Dio();
  Future<Response> getVerifyCode() async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.post('${SeverUrl.BASE_URL}${SeverUrl.getVerifyCode}',);
  }
}

///下载文件
class DownLoadFileApi {
  final Dio _dio = Dio();
  Future<Response> downLoadFile(
      String fileName,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.get('${SeverUrl.BASE_URL}${SeverUrl.downLoadFile}',queryParameters: {'fileName': fileName});
  }
}

///上传文件
// class UploadFileApi {
//   final Dio _dio = Dio();
//   Future<Response> uploadFile(
//       File file,
//       ) async {
//     _dio.options.contentType=Headers.formUrlEncodedContentType;
//     return await _dio.post('${SeverUrl.BASE_URL}${SeverUrl.uploadFile}',data: {'file':file});
//   }
// }

///预览文件
class ViewFileApi {
  final Dio _dio = Dio();
  Future<Response> viewFile(
      String fileName,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.get('${SeverUrl.BASE_URL}${SeverUrl.viewFile}',queryParameters: {'fileName': fileName});
  }
}

///创建库
class CreateIndexApi {
  final Dio _dio = Dio();
  Future<Response> createIndex(
      String index,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.post('${SeverUrl.BASE_URL}${SeverUrl.createIndex}',data: {'index': index});
  }
}

///搜索文档
class SearchDocApi {
  final Dio _dio = Dio();
  Future<Response> searchDoc(
      String index,
      String question,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.get('${SeverUrl.BASE_URL}${SeverUrl.searchDoc}',queryParameters: {'index': index,'question':question});
  }
}

///获取页数
class GetPageApi {
  final Dio _dio = Dio();
  Future<Response> getPage(
      String name,
      String keyword,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.post('${SeverUrl.BASE_URL}${SeverUrl.getPage}',data: {'name': name,'keyword':keyword});
  }
}

///获取摘要
class GetAbstractApi {
  final Dio _dio = Dio();
  Future<Response> getAbstract(
      String name,
      ) async {
    _dio.options.contentType=Headers.formUrlEncodedContentType;
    return await _dio.get('${SeverUrl.BASE_URL}${SeverUrl.getPage}',queryParameters: {'name': name,});
  }
}


