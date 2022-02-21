import 'package:discord_api/src/models/discord_token.dart';

import '../models/discord_token.dart';

abstract class DiscordHttpClient {
  DiscordToken? get discordToken;

  /// Method to initialize the token the first time after connection.
  ///
  /// [discordToken]: Token obtained with the first connection.
  void initializeToken(DiscordToken discordToken);

  /// Generic method for authenticated GET calls.
  Future<T> getCall<T>(
    Iterable<String> pathSegments, {
    Map<String, dynamic> queryParameters = const {},
  });

  /// Generic method for authenticated POST calls.
  Future<T> postCall<T>(
    Iterable<String> pathSegments,
    dynamic data, {
    Map<String, dynamic> queryParameters = const {},
  });

  /// Generic method for authenticated PATCH calls.
  Future<T> patchCall<T>(
    Iterable<String> pathSegments,
    dynamic data, {
    Map<String, dynamic> queryParameters = const {},
  });

  /// Generic method for authenticated PUT calls.
  Future<T> putCall<T>(
    Iterable<String> pathSegments,
    dynamic data, {
    Map<String, dynamic> queryParameters = const {},
  });

  /// Generic method for authenticated DELETE calls.
  Future<T?> deleteCall<T>(
    Iterable<String> pathSegments, {
    Map<String, dynamic> queryParameters = const {},
  });

  Future<DiscordToken> validateToken();
  Future<DiscordToken> getAccessToken(String code, String redirectUri);
  Future<DiscordToken> refreshAccessToken();
  Future<void> revokeRefreshToken();
}
