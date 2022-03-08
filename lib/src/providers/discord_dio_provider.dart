import 'package:dio/dio.dart';

import '../discord_client.dart';
import '../exceptions/discord_api_exceptions.dart';
import '../models/discord_token.dart';
import 'discord_http_client.dart';

class DiscordDioProvider extends DiscordHttpClient {
  final dio = Dio();
  final String clientId;
  final String clientSecret;

  DiscordToken? _discordToken;

  @override
  DiscordToken? get discordToken => _discordToken;

  DiscordDioProvider({
    required this.clientId,
    required this.clientSecret,
  });

  @override
  Future<T> getCall<T>(
    Iterable<String> pathSegments, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final token = await validateToken();
    final options = Options(
      headers: {
        'Client-Id': clientId,
        'Authorization': 'Bearer ${token.accessToken}',
      },
    );
    final response = await dio.getUri<T>(
      DiscordClient.baseUrl.replace(
        pathSegments: <String>[
          DiscordClient.apiPath,
          DiscordClient.versionPath,
          ...pathSegments
        ],
        queryParameters: queryParameters,
      ),
      options: options,
    );
    return response.data!;
  }

  @override
  Future<T> postCall<T>(
    Iterable<String> pathSegments,
    dynamic data, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final token = await validateToken();
    final options = Options(
      contentType: Headers.jsonContentType,
      headers: {
        'Client-Id': clientId,
        'Authorization': 'Bearer ${token.accessToken}',
      },
    );
    final response = await dio.postUri<T>(
      DiscordClient.baseUrl.replace(
        pathSegments: <String>[
          DiscordClient.apiPath,
          DiscordClient.versionPath,
          ...pathSegments
        ],
        queryParameters: queryParameters,
      ),
      options: options,
      data: data,
    );
    return response.data!;
  }

  @override
  Future<T> patchCall<T>(
    Iterable<String> pathSegments,
    dynamic data, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final token = await validateToken();
    final options = Options(
      contentType: Headers.jsonContentType,
      headers: {
        'Client-Id': clientId,
        'Authorization': 'Bearer ${token.accessToken}',
      },
    );
    final response = await dio.patchUri<T>(
      DiscordClient.baseUrl.replace(
        pathSegments: <String>[
          DiscordClient.apiPath,
          DiscordClient.versionPath,
          ...pathSegments
        ],
        queryParameters: queryParameters,
      ),
      options: options,
      data: data,
    );
    return response.data!;
  }

  @override
  Future<T> putCall<T>(
    Iterable<String> pathSegments,
    dynamic data, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final token = await validateToken();
    final options = Options(
      contentType: Headers.jsonContentType,
      headers: {
        'Client-Id': clientId,
        'Authorization': 'Bearer ${token.accessToken}',
      },
    );
    final response = await dio.putUri<T>(
      DiscordClient.baseUrl.replace(
        pathSegments: <String>[
          DiscordClient.apiPath,
          DiscordClient.versionPath,
          ...pathSegments
        ],
        queryParameters: queryParameters,
      ),
      options: options,
      data: data,
    );
    return response.data!;
  }

  @override
  void initializeToken(DiscordToken discordToken) =>
      _discordToken = discordToken;

  @override
  Future<T?> deleteCall<T>(
    Iterable<String> pathSegments, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final token = await validateToken();
    final options = Options(
      contentType: Headers.jsonContentType,
      headers: {
        'Client-Id': clientId,
        'Authorization': 'Bearer ${token.accessToken}',
      },
    );
    final response = await dio.deleteUri<T>(
      DiscordClient.baseUrl.replace(
        pathSegments: <String>[
          DiscordClient.apiPath,
          DiscordClient.versionPath,
          ...pathSegments
        ],
      ),
      options: options,
    );
    return response.data;
  }

  @override
  Future<DiscordToken> getAccessToken(String code, String redirectUri) async {
    final options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );
    final data = <String, String>{
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': 'authorization_code',
      'code': code,
      'redirect_uri': redirectUri,
    };
    final response = await dio.postUri<Map<String, dynamic>>(
      DiscordClient.tokenUri,
      options: options,
      data: data,
    );
    if (response.data != null) {
      _discordToken = DiscordToken.fromJson(response.data!);
      return _discordToken!;
    } else {
      throw const DiscordApiException('Could not get token');
    }
  }

  @override
  Future<DiscordToken> refreshAccessToken() async {
    assert(_discordToken != null);
    final options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );
    final data = <String, String>{
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': 'refresh_token',
      'refresh_token': _discordToken!.refreshToken,
    };
    final response = await dio.postUri<Map<String, dynamic>>(
      DiscordClient.tokenUri,
      options: options,
      data: data,
    );
    if (response.data != null) {
      _discordToken = DiscordToken.fromJson(response.data!);
      return _discordToken!;
    } else {
      throw const DiscordApiException('Could not refresh token');
    }
  }

  @override
  Future<void> revokeRefreshToken() async {
    assert(_discordToken != null);
    final options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );
    final data = <String, String>{
      'client_id': clientId,
      'client_secret': clientSecret,
      'token': _discordToken!.refreshToken,
    };
    final response = await dio.postUri<Map<String, dynamic>>(
      DiscordClient.tokenUri,
      options: options,
      data: data,
    );
    if (response.statusCode != null && response.statusCode == 200) {
      _discordToken = null;
    } else {
      throw const DiscordApiException('Could not revoke token');
    }
  }

  @override
  Future<DiscordToken> validateToken() async {
    DiscordToken? token = discordToken;
    if (token == null) {
      throw const DiscordApiException('No OAuth token registered');
    }
    if (!token.isValid) {
      token = await refreshAccessToken();
    }
    return token;
  }
}
