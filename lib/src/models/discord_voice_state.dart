import 'discord_guild_member.dart';
import 'discord_snowflake.dart';

class DiscordVoiceState {
  /// the guild id this voice state is for
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? guildId;

  /// the channel id this user is connected to
  ///
  /// is always returned, but can be null
  final DiscordSnowflake? channelId;

  /// the user id this voice state is for
  final DiscordSnowflake userId;

  /// the guild member this voice state is for
  ///
  /// is not always returned, hence the nullable property
  final DiscordGuildMember? member;

  /// the session id for this voice state
  final String sessionId;

  /// whether this user is deafened by the server
  final bool deaf;

  /// whether this user is muted by the server
  final bool muted;

  /// whether this user is locally deafened
  final bool selfDeaf;

  /// whether this user is locally muted
  final bool selfMuted;

  /// whether this user is streaming using "Go Live"
  ///
  /// is not always returned, hence the nullable property
  final bool? selfStream;

  /// whether this user's camera is enabled
  final bool selfVideo;

  /// whether this user is muted by the current user
  final bool suppress;

  /// the time at which the user request to speak,
  /// as an ISO 8601 timestamp
  ///
  /// is always returned, but can be null
  final String? requestToSpeakTimestamp;

  late final DateTime? _requestToSpeakTimestampAsDateTime;

  static const guildIdEntry = 'guild_id';
  static const channelIdEntry = 'channel_id';
  static const userIdEntry = 'user_id';
  static const memberEntry = 'member';
  static const sessionIdEntry = 'session_id';
  static const deafEntry = 'deaf';
  static const mutedEntry = 'muted';
  static const selfDeafEntry = 'self_deaf';
  static const selfMutedEntry = 'self_muted';
  static const selfStreamEntry = 'self_stream';
  static const selfVideoEntry = 'self_video';
  static const suppressEntry = 'suppress';
  static const requestToSpeakTimestampEntry = 'request_to_speak_timestamp';

  DiscordVoiceState({
    this.guildId,
    this.channelId,
    required this.userId,
    this.member,
    required this.sessionId,
    required this.deaf,
    required this.muted,
    required this.selfDeaf,
    required this.selfMuted,
    this.selfStream,
    required this.selfVideo,
    required this.suppress,
    this.requestToSpeakTimestamp,
  });

  /// returns the [requestToSpeakTimestamp] as a DateTime
  DateTime? get requestToSpeakTimestampAsDateTime {
    if (requestToSpeakTimestamp == null) return null;
    return _requestToSpeakTimestampAsDateTime ??=
        DateTime.parse(requestToSpeakTimestamp!);
  }

  factory DiscordVoiceState.fromJson(Map<String, dynamic> json) =>
      DiscordVoiceState(
        guildId: json[guildIdEntry] != null
            ? DiscordSnowflake(json[guildIdEntry] as String)
            : null,
        channelId: json[channelIdEntry] != null
            ? DiscordSnowflake(json[channelIdEntry] as String)
            : null,
        userId: DiscordSnowflake(json[userIdEntry] as String),
        member: json[memberEntry] != null
            ? DiscordGuildMember.fromJson(
                json[memberEntry] as Map<String, dynamic>,
              )
            : null,
        sessionId: json[sessionIdEntry] as String,
        deaf: json[deafEntry] as bool,
        muted: json[mutedEntry] as bool,
        selfDeaf: json[selfDeafEntry] as bool,
        selfMuted: json[selfMutedEntry] as bool,
        selfStream: json[selfStreamEntry] as bool?,
        selfVideo: json[selfVideoEntry] as bool,
        suppress: json[suppressEntry] as bool,
        requestToSpeakTimestamp: json[requestToSpeakTimestampEntry] as String?,
      );
}
