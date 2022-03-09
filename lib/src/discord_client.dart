import 'dart:async';

import 'discord_cdn_helper.dart';
import 'exceptions/discord_api_exceptions.dart';
import 'models/discord_api_scope.dart';
import 'models/discord_authorization_information.dart';
import 'models/discord_channel.dart';
import 'models/discord_connection.dart';
import 'models/discord_guild.dart';
import 'models/discord_guild_member.dart';
import 'models/discord_guild_preview.dart';
import 'models/discord_token.dart';
import 'models/discord_user.dart';
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
  final DiscordCdnHelper cdn = DiscordCdnHelper.instance;

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
    return baseUrl.replace(
      pathSegments: <String>[apiPath, versionPath, oauth2Path, authPath],
      queryParameters: {
        'response_type': 'code',
        'client_id': clientId,
        'scope': scopesSet.join(' '),
        'redirect_uri': redirectUri,
        //'state': generateState() ?
      },
    );
  }

  static Uri get tokenUri => baseUrl.replace(
        pathSegments: <String>[apiPath, versionPath, oauth2Path, tokenPath],
      );
  static Uri get revokeUri => baseUrl.replace(
        pathSegments: <String>[apiPath, versionPath, oauth2Path, revokePath],
      );

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
      return DiscordAuthorizationInformation.fromJson(
        data as Map<String, dynamic>,
      );
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<DiscordUser> getCurrentUser() async {
    try {
      final data = await discordHttpClient.getCall([
        "users",
        "@me",
      ]);
      return DiscordUser.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<DiscordUser> getUser(String userId) async {
    try {
      final data = await discordHttpClient.getCall([
        "users",
        userId,
      ]);
      return DiscordUser.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  /// imageData must be a [data URI scheme](https://discord.com/developers/docs/reference#image-data)
  Future<DiscordUser> modifyCurrentUser({
    String? username,
    String? imageData,
  }) async {
    try {
      final args = <String, dynamic>{};
      if (username != null) {
        args['username'] = username;
      }
      if (imageData != null) {
        args['avatar'] = imageData;
      }
      final data = await discordHttpClient.patchCall(
        [
          "users",
          "@me",
        ],
        args,
      );
      return DiscordUser.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<List<DiscordGuild>> getCurrentUserGuilds({
    String? beforeId,
    String? afterId,
    int limit = 200,
  }) async {
    try {
      final args = <String, dynamic>{};
      if (beforeId != null) {
        args['before'] = beforeId;
      }
      if (afterId != null) {
        args['after'] = afterId;
      }
      args['limit'] = limit;
      final data = await discordHttpClient.getCall(
        [
          "users",
          "@me",
          "guilds",
        ],
        queryParameters: args,
      );
      return List<DiscordGuild>.from(
        (data as List<Map<String, dynamic>>).map(DiscordGuild.fromJson),
      );
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<DiscordGuildMember> getCurrentUserGuildMember(String guildId) async {
    try {
      final data = await discordHttpClient.getCall(
        [
          "users",
          "@me",
          "guilds",
          guildId,
          "member",
        ],
      );
      return DiscordGuildMember.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<void> leaveGuild(String guildId) async {
    try {
      await discordHttpClient.deleteCall(
        [
          "users",
          "@me",
          "guilds",
          guildId,
        ],
      );
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<DiscordChannel> createDM(String recipientId) async {
    try {
      final data = await discordHttpClient.postCall(
        [
          "users",
          "@me",
          "channels",
        ],
        <String, dynamic>{
          'recipient_id': recipientId,
        },
      );
      return DiscordChannel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  // Future<DiscordChannel> createGroupDM(...);

  Future<List<DiscordConnection>> getCurrentUserConnections() async {
    try {
      final data = await discordHttpClient.getCall(
        [
          "users",
          "@me",
          "connections",
        ],
      );
      return List<DiscordConnection>.from(
        (data as List<Map<String, dynamic>>).map(DiscordConnection.fromJson),
      );
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<DiscordGuild> getGuild(
    String guildId, {
    bool withCounts = false,
  }) async {
    try {
      final data = await discordHttpClient.getCall(
        [
          "guilds",
          guildId,
        ],
        queryParameters: <String, dynamic>{
          'with_counts': withCounts,
        },
      );
      return DiscordGuild.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }

  Future<DiscordGuildPreview> getGuildPreview(String guildId) async {
    try {
      final data = await discordHttpClient.getCall(
        [
          "guilds",
          guildId,
          "preview",
        ],
      );
      return DiscordGuildPreview.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw DiscordApiException(e.toString());
    }
  }
}
