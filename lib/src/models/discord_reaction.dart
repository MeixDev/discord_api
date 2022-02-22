import 'discord_emoji.dart';

class DiscordReaction {
  final int count;
  final bool me;
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
