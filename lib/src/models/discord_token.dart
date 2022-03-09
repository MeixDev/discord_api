import 'discord_token_webhook.dart';

class DiscordToken {
  final String accessToken;
  final String refreshToken;
  final String scope;
  final String tokenType;
  late final List<String>? scopes;
  final int expiresIn;
  late final DateTime expiresAt;
  final DiscordTokenWebhook? webhook;

  static const accessTokenEntry = 'access_token';
  static const tokenTypeEntry = 'token_type';
  static const refreshTokenEntry = 'refresh_token';
  static const scopeEntry = 'scope';
  static const expiresInEntry = 'expires_in';
  static const webhookEntry = 'webhook';

  DiscordToken({
    required this.accessToken,
    required this.refreshToken,
    required this.scope,
    required this.tokenType,
    required this.expiresIn,
    this.webhook,
  }) {
    scopes = scope.split(' ');
    // Removing 60 seconds as a sanity check.
    expiresAt = DateTime.now().add(Duration(seconds: expiresIn - 60));
  }

  bool get isValid => expiresAt.isAfter(DateTime.now());

  factory DiscordToken.fromJson(Map<String, dynamic> json) => DiscordToken(
        accessToken: json[accessTokenEntry] as String,
        refreshToken: json[refreshTokenEntry] as String,
        scope: json[scopeEntry] as String,
        tokenType: json[tokenTypeEntry] as String,
        expiresIn: json[expiresInEntry] as int,
        webhook: json[webhookEntry] != null
            ? DiscordTokenWebhook.fromJson(
                json[webhookEntry] as Map<String, dynamic>,
              )
            : null,
      );

  DiscordToken copyWith({
    String? accessToken,
    String? refreshToken,
    String? scope,
    String? tokenType,
    int? expiresIn,
    DiscordTokenWebhook? webhook,
  }) =>
      DiscordToken(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        scope: scope ?? this.scope,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        webhook: webhook ?? this.webhook,
      );
}
