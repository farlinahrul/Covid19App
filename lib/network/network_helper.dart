import 'package:covid19app/network/urls.dart';
import 'package:dio/dio.dart';

class NetworkHelper {
  /// Amount of time in Milliseconds for connection Timeout
  final int? connectTimeout;
  NetworkHelper({this.connectTimeout});

  /// Performs a GET request with [queryParameters]
  Future<T> get<T>({
    required String path,
    required T Function(dynamic data) onSuccess,
    required T Function(dynamic error) onError,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool isRawResult = false,
  }) async {
    final Dio _client = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: connectTimeout,
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    try {
      final response = await _client.get(
        path,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );

      return isRawResult
          ? onSuccess(response.data)
          : onSuccess(response.data['content']);
    } on DioError catch (e) {
      print('${e.message} ${e.response} for ${Urls.baseUrl}$path');
      print(e.toString());
      return onError(e);
    } catch (e) {
      print(e.toString());
      return onError(e);
    }
  }

  /// Performs a POST request with [body], then executes the functions
  /// with generic return value
  Future<T> post<T>({
    required String path,
    required T Function(dynamic content) onSuccess,
    required T Function(dynamic error) onError,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    bool containsFile = false,
    bool isRawResult = false,
  }) async {
    final Dio _client = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: connectTimeout,
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    try {
      _client.interceptors.add(LogInterceptor(requestBody: true));
      final response = await _client.post(
        path,
        data: containsFile ? FormData.fromMap(body) : body,
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      return isRawResult
          ? onSuccess(response.data)
          : onSuccess(response.data['content']);
    } on DioError catch (e) {
      print('${e.message} ${e.response} for ${Urls.baseUrl}$path');
      return onError(e);
    } catch (e) {
      print(e.toString());
      return onError(e);
    }
  }

  /// Performs a PUT request with [body], then executes the functions
  /// with generic return value
  ///
  /// if the request contains a file, set [containsFile] to true
  /// user [queryParameters] if necessary
  Future<T> put<T>({
    required String path,
    required T Function(dynamic content) onSuccess,
    required T Function(dynamic error) onError,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool containsFile = false,
    bool isRawResult = false,
  }) async {
    final Dio _client = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: connectTimeout,
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    try {
      final response = await _client.put(
        path,
        data: containsFile ? FormData.fromMap(body) : body,
        queryParameters: queryParameters,
        // Comment out to check progress on data sending
        // onSendProgress: (int sent, int total) {
        //   print('$sent $total');
        // },
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      return isRawResult
          ? onSuccess(response.data)
          : onSuccess(response.data['content']);
    } on DioError catch (e) {
      print('${e.message} for ${Urls.baseUrl}$path');
      return onError(e);
    } catch (e) {
      print(e.toString());
      return onError(e);
    }
  }

  Future<T> delete<T>({
    required String path,
    required T Function(dynamic content) onSuccess,
    required T Function(dynamic error) onError,
    Map<String, dynamic>? headers,
    bool isRawResult = false,
  }) async {
    final Dio _client = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: connectTimeout,
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    try {
      final response = await _client.delete(
        path,
        options: Options(headers: headers),
      );

      return isRawResult
          ? onSuccess(response.data)
          : onSuccess(response.data['content']);
    } on DioError catch (e) {
      print('${e.message} for ${Urls.baseUrl}$path');
      return onError(e);
    } catch (e) {
      print(e.toString());
      return onError(e);
    }
  }
}
