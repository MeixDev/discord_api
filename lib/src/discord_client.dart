import 'dart:async';

import 'package:discord_api/src/discord_cdn_helper.dart';

import 'exceptions/discord_api_exceptions.dart';

import 'models/discord_api_scope.dart';
import 'models/discord_authorization_information.dart';
import 'models/discord_token.dart';
import 'providers/discord_http_client.dart';

class DiscordClient {
  static const apiVersion = "9";

  static const oauth2Path = "oauth2";
  static const authPath = "authorize";
  static const tokenPath = "token";
  static const revokePath = "revoke";
  static const apiPath = "api";
  static const versionPath = "v$apiVersion";

  static final baseUrl = Uri(scheme: "https", host: "discord.com");

  final String redirectUri;
  final String clientId;
  final String clientSecret;
  final DiscordHttpClient discordHttpClient;

  /// Contains all methods necessary to build elements from Discord's CDN endpoints.
  final DiscordCdnHelper cdn = DiscordCdnHelper();

  /// If you need it, you can get the [DiscordDioProvider] from the discord_api_dio_provider package.
  /// Otherwise, you'll have to implement `discordHttpClient` yourself.
  DiscordClient({
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
    required this.discordHttpClient,
    DiscordToken? token,
  }) {
    if (token != null) {
      initializeToken(token);
    }
  }

  /// Return the authorization Uri for the Discord API.
  Uri authorizeUri(List<DiscordApiScope> scopes) {
    final scopesSet = <String>{}..addAll(scopes.map((e) => e.string).toSet());
    return baseUrl.replace(pathSegments: <String>[
      apiPath,
      versionPath,
      oauth2Path,
      authPath
    ], queryParameters: {
      'response_type': 'code',
      'client_id': clientId,
      'scope': scopesSet.join(' '),
      'redirect_uri': redirectUri,
      //'state': generateState() ?
    });
  }

  static Uri get tokenUri => baseUrl.replace(
      pathSegments: <String>[apiPath, versionPath, oauth2Path, tokenPath]);
  static Uri get revokeUri => baseUrl.replace(
      pathSegments: <String>[apiPath, versionPath, oauth2Path, revokePath]);

  void initializeToken(DiscordToken discordToken) =>
      discordHttpClient.initializeToken(discordToken);

  // There is little reason to call either of those methods, as they're related to the authorization flow, and not any API usage.

  Future<void> getAccessToken(String code) async {
    await discordHttpClient.getAccessToken(code, redirectUri);
  }

  Future<void> refreshAccessToken() async {
    await discordHttpClient.refreshAccessToken();
  }

  Future<void> revokeRefreshToken() async {
    await discordHttpClient.revokeRefreshToken();
  }

  Future<DiscordAuthorizationInformation>
      getCurrentAuthorizationInformation() async {
    try {
      final data = await discordHttpClient
          .getCall([apiPath, versionPath, oauth2Path, '@me']);
      return DiscordAuthorizationInformation.fromJson(data);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }
}
