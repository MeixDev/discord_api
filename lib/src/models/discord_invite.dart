import 'discord_application.dart';
import 'discord_channel.dart';
import 'discord_guild.dart';
import 'discord_guild_scheduled_event.dart';
import 'discord_invite_stage_instance.dart';
import 'discord_invite_target_type.dart';
import 'discord_user.dart';

class DiscordInvite {
  /// the invite code (unique ID)
  final String code;

  /// the guild this invite is for
  ///
  /// partial guild object
  final DiscordGuild? guild;

  /// the channel this invite is for
  ///
  /// partial channel object
  final DiscordChannel? channel;

  /// the user who created this invite
  final DiscordUser? inviter;

  /// the [type of target](https://discord.com/developers/docs/resources/invite#invite-object-invite-target-types)
  /// for this voice channel invite
  final int? targetType;

  late final DiscordInviteTargetType? _targetTypeAsEnum;

  /// the user whose stream to display for this voice channel stream invite
  final DiscordUser? targetUser;

  /// the embedded application to open for this voice channel embedded application invite
  ///
  /// partial application object
  final DiscordApplication? targetApplication;

  /// approximate count of online members, returned from the
  /// `GET /invites/<code>` endpoint when `with_counts` is set to `true`
  final int? approximatePresenceCount;

  /// approximate count of total members, returned from the
  /// `GET /invites/<code>` endpoint when `with_counts` is set to `true`
  final int? approximateMemberCount;

  /// the expiration date of this invite, returned from the
  /// `GET /invites/<code>` endpoint when `with_expiration` is set to `true`
  ///
  /// as an ISO 8601 date string
  final String? expiresAt;

  late final DateTime? _expiresAtAsDateTime;

  @Deprecated("")

  /// stage instance data if there is a [public Stage instance](https://discord.com/developers/docs/resources/stage-instance)
  /// in the Stage channel this invite is for
  final DiscordInviteStageInstance? stageInstance;

  /// guild scheduled event data, only included if `guild_scheduled_event_id` contains a valid guild scheduled event id
  final DiscordGuildScheduledEvent? guildScheduledEvent;

  static const codeEntry = 'code';
  static const guildEntry = 'guild';
  static const channelEntry = 'channel';
  static const inviterEntry = 'inviter';
  static const targetTypeEntry = 'target_type';
  static const targetUserEntry = 'target_user';
  static const targetApplicationEntry = 'target_application';
  static const approximatePresenceCountEntry = 'approximate_presence_count';
  static const approximateMemberCountEntry = 'approximate_member_count';
  static const expiresAtEntry = 'expires_at';
  static const stageInstanceEntry = 'stage_instance';
  static const guildScheduledEventEntry = 'guild_scheduled_event';

  DiscordInvite({
    required this.code,
    this.guild,
    this.channel,
    this.inviter,
    this.targetType,
    this.targetUser,
    this.targetApplication,
    required this.approximatePresenceCount,
    required this.approximateMemberCount,
    this.expiresAt,
    this.stageInstance,
    this.guildScheduledEvent,
  });

  DiscordInviteTargetType? get targetTypeAsEnum => _targetTypeAsEnum ??=
      targetType != null ? DiscordInviteTargetType.values[targetType!] : null;

  DateTime? get expiresAtAsDateTime => _expiresAtAsDateTime ??=
      expiresAt != null ? DateTime.parse(expiresAt!) : null;

  factory DiscordInvite.fromJson(Map<String, dynamic> json) => DiscordInvite(
        code: json[codeEntry] as String,
        guild: json[guildEntry] != null
            ? DiscordGuild.fromJson(json[guildEntry] as Map<String, dynamic>)
            : null,
        channel: json[channelEntry] != null
            ? DiscordChannel.fromJson(
                json[channelEntry] as Map<String, dynamic>)
            : null,
        inviter: json[inviterEntry] != null
            ? DiscordUser.fromJson(json[inviterEntry] as Map<String, dynamic>)
            : null,
        targetType: json[targetTypeEntry] as int?,
        targetUser: json[targetUserEntry] != null
            ? DiscordUser.fromJson(
                json[targetUserEntry] as Map<String, dynamic>)
            : null,
        targetApplication: json[targetApplicationEntry] != null
            ? DiscordApplication.fromJson(
                json[targetApplicationEntry] as Map<String, dynamic>)
            : null,
        approximatePresenceCount: json[approximatePresenceCountEntry] as int?,
        approximateMemberCount: json[approximateMemberCountEntry] as int?,
        expiresAt: json[expiresAtEntry] as String?,
        stageInstance: json[stageInstanceEntry] != null
            ? DiscordInviteStageInstance.fromJson(
                json[stageInstanceEntry] as Map<String, dynamic>)
            : null,
        guildScheduledEvent: json[guildScheduledEventEntry] != null
            ? DiscordGuildScheduledEvent.fromJson(
                json[guildScheduledEventEntry] as Map<String, dynamic>)
            : null,
      );
}
