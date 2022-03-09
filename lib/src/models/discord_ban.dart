import 'discord_user.dart';

class DiscordBan {
  // the reason for the ban
  final String? reason;

  /// the banned user
  final DiscordUser user;

  static const reasonEntry = 'reason';
  static const userEntry = 'user';

  DiscordBan({
    this.reason,
    required this.user,
  });

  factory DiscordBan.fromJson(Map<String, dynamic> json) {
    return DiscordBan(
      reason: json[reasonEntry] as String?,
      user: DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>),
    );
  }
}
