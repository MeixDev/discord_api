class DiscordIntegrationAccount {
  /// id of the account
  final String id;

  /// name of the account
  final String name;

  static const idEntry = 'id';
  static const nameEntry = 'name';

  DiscordIntegrationAccount({
    required this.id,
    required this.name,
  });

  factory DiscordIntegrationAccount.fromJson(Map<String, dynamic> json) {
    return DiscordIntegrationAccount(
      id: json[idEntry] as String,
      name: json[nameEntry] as String,
    );
  }
}
