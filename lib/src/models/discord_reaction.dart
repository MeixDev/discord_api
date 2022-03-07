import 'discord_emoji.dart';

class DiscordReaction {
  /// times this emoji has been used to react
  final int count;

  /// whether the current user reacted using this emoji
  final bool me;

  /// emoji information
  final DiscordEmoji emoji;

  static const countEntry = 'count';
  static const meEntry = 'me';
  static const emojiEntry = 'emoji';

  DiscordReaction({
    required this.count,
    required this.me,
    required this.emoji,
  });

  factory DiscordReaction.fromJson(Map<String, dynamic> json) =>
      DiscordReaction(
        count: json[countEntry] as int,
        me: json[meEntry] as bool,
        emoji: DiscordEmoji.fromJson(json[emojiEntry] as Map<String, dynamic>),
      );
}
