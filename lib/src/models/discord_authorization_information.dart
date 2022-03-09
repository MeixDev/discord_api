import 'discord_api_scope.dart';
import 'discord_application.dart';
import 'discord_user.dart';

class DiscordAuthorizationInformation {
  final DiscordApplication application;
  final List<String> scopes;
  late final List<DiscordApiScope>? _scopesAsEnum;
  final DateTime expiresAt;
  final DiscordUser? user;

  static const applicationEntry = 'application';
  static const scopesEntry = 'scopes';
  static const expiresEntry = 'expires';
  static const userEntry = 'user';

  DiscordAuthorizationInformation(
      {required this.application,
      required this.scopes,
      required this.expiresAt,
      this.user});

  List<DiscordApiScope> get scopesAsEnum => _scopesAsEnum ??= scopes.map((s) {
        final nameSegments = s.split('.');
        for (int i = 1; i < nameSegments.length; i++) {
          nameSegments[i] = nameSegments[i].substring(0, 1).toUpperCase() +
              nameSegments[i].substring(1);
        }
        final dartName = nameSegments.join();
        return DiscordApiScope.values
            .firstWhere((v) => v.toString() == 'DiscordApiScope.' + dartName);
      }).toList();

  factory DiscordAuthorizationInformation.fromJson(Map<String, dynamic> json) =>
      DiscordAuthorizationInformation(
        application: DiscordApplication.fromJson(
            json[applicationEntry] as Map<String, dynamic>),
        scopes: List<String>.from(json[scopesEntry] as List<String>),
        expiresAt: DateTime.parse(json[expiresEntry] as String),
        user: json[userEntry] != null
            ? DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>)
            : null,
      );
}
