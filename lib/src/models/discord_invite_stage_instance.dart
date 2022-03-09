import 'package:discord_api/src/models/discord_guild_member.dart';

//@Deprecated("This is deprecated")
class DiscordInviteStageInstance {
  /// the members speaking in the Stage
  final List<DiscordGuildMember> members;

  /// the number of users in the Stage
  final int participantCount;

  /// the number of users speaking in the Stage
  final int speakerCount;

  /// the topic of the Stage instance (1-120 characters)
  final String topic;

  static const membersEntry = "members";
  static const participantCountEntry = "participant_count";
  static const speakerCountEntry = "speaker_count";
  static const topicEntry = "topic";

  DiscordInviteStageInstance({
    required this.members,
    required this.participantCount,
    required this.speakerCount,
    required this.topic,
  });

  factory DiscordInviteStageInstance.fromJson(Map<String, dynamic> json) =>
      DiscordInviteStageInstance(
        members: List<DiscordGuildMember>.from(
          json[membersEntry].map(DiscordGuildMember.fromJson),
        ),
        participantCount: json[participantCountEntry] as int,
        speakerCount: json[speakerCountEntry] as int,
        topic: json[topicEntry] as String,
      );
}
