import 'discord_mention_type.dart';

class DiscordAllowedMentions {
  /// an array of [allowed mention types](https://discord.com/developers/docs/resources/channel#allowed-mentions-object-allowed-mention-types)
  /// to parse from the content.
  final List<String> parse;

  late final List<DiscordMentionType>? _parseAsEnum;

  /// array of role_ids to mention (Max size of 100)
  ///
  /// Should be converted to DiscordSnowflake if the need arise
  final List<String> roles;

  /// array of user_ids to mention (Max size of 100)
  ///
  /// Should be converted to DiscordSnowflake if the need arise
  final List<String> users;

  /// for replies, whether to mention the author of the message being
  /// replied to (default false)
  final bool repliedUser;

  static const parseEntry = 'parse';
  static const rolesEntry = 'roles';
  static const usersEntry = 'users';
  static const repliedUserEntry = 'replied_user';

  DiscordAllowedMentions({
    required this.parse,
    required this.roles,
    required this.users,
    required this.repliedUser,
  });

  DiscordMentionType _getFromString(String value) {
    switch (value) {
      case 'users':
        return DiscordMentionType.users;
      case 'roles':
        return DiscordMentionType.roles;
      case 'everyone':
        return DiscordMentionType.everyone;
      default:
        throw ArgumentError('Unknown mention type: $value');
    }
  }

  List<DiscordMentionType> get parseAsEnum =>
      _parseAsEnum ??= parse.map((e) => _getFromString(e)).toList();

  factory DiscordAllowedMentions.fromJson(Map<String, dynamic> json) =>
      DiscordAllowedMentions(
        parse: List<String>.from(json[parseEntry] as List<String>),
        roles: List<String>.from(json[rolesEntry] as List<String>),
        users: List<String>.from(json[usersEntry] as List<String>),
        repliedUser: json[repliedUserEntry] as bool,
      );
}
