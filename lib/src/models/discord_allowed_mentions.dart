import 'discord_mention_type.dart';

class DiscordAllowedMentions {
  final List<String> parse;
  late final List<DiscordMentionType>? _parseAsEnum;
  final List<String> roles;
  final List<String> users;
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
        parse: List<String>.from(json[parseEntry]),
        roles: List<String>.from(json[rolesEntry]),
        users: List<String>.from(json[usersEntry]),
        repliedUser: json[repliedUserEntry] as bool,
      );
}
