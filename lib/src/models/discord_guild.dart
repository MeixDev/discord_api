import 'discord_channel.dart';
import 'discord_emoji.dart';
import 'discord_explicit_content_filter_level.dart';
import 'discord_guild_feature.dart';
import 'discord_guild_member.dart';
import 'discord_guild_premium_tier.dart';
import 'discord_guild_scheduled_event.dart';
import 'discord_message_notifications_level.dart';
import 'discord_mfa_level.dart';
import 'discord_nsfw_level.dart';
import 'discord_presence_update.dart';
import 'discord_role.dart';
import 'discord_snowflake.dart';
import 'discord_stage_instance.dart';
import 'discord_sticker.dart';
import 'discord_system_channel_flag.dart';
import 'discord_verification_level.dart';
import 'discord_voice_state.dart';
import 'discord_welcome_screen.dart';

class DiscordGuild {
  /// guild id
  final DiscordSnowflake id;

  /// guild name (2-100 characters, excluding trailing and leading whitespace)
  final String name;

  /// [icon hash](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// is always returned, but can be null
  final String? icon;

  /// [icon hash](https://discord.com/developers/docs/reference#image-formatting),
  /// returned when in the template object
  ///
  /// is not always returned, and can be null
  final String? iconHash;

  /// [splash hash](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// is always returned, but can be null
  final String? splash;

  /// [discovery splash hash](https://discord.com/developers/docs/reference#image-formatting);
  /// only presents for guilds with the "DISCOVERABLE" feature
  ///
  /// is not always returned, and can be null
  final String? discoverySplash;

  /// true if [the user](https://discord.com/developers/docs/resources/user#get-current-user-guilds)
  /// is the owner of the guild
  ///
  /// * This field is only sent when using the [GET Current User Guilds](https://discord.com/developers/docs/resources/user#get-current-user-guilds) endpoint and are relative to the requested user
  ///
  /// is not always returned, hence the nullable property
  final bool? owner;

  /// id of owner
  final DiscordSnowflake ownerId;

  /// total permissions for [the user](https://discord.com/developers/docs/resources/user#get-current-user-guilds)
  /// in the guild (excludes overwrites)
  ///
  /// * This field is only sent when using the [GET Current User Guilds](https://discord.com/developers/docs/resources/user#get-current-user-guilds) endpoint and are relative to the requested user
  ///
  /// is not always returned, hence the nullable property
  final String? permissions;

  /// [voice region](https://discord.com/developers/docs/resources/voice#voice-region-object)
  /// id for the guild (deprecated)
  ///
  /// * This field is deprecated and is replaced by [channel.rtc_region](https://discord.com/developers/docs/resources/channel#channel-object-channel-structure)
  ///
  /// is not always returned, and can be null
  @Deprecated('Use channel.rtc_region instead')
  final String? region;

  /// id of afk channel
  ///
  /// is always returned, but can be null
  final DiscordSnowflake? afkChannelId;

  /// afk timeout in seconds
  final int afkTimeout;

  /// true if the server widget is enabled
  ///
  /// is not always returned, hence the nullable property
  final bool? widgetEnabled;

  /// the channel id that the widget will generate
  /// an invite to, or `null` if set to no invite
  ///
  /// is not always returned, and can be null
  final DiscordSnowflake? widgetChannelId;

  /// [verification level](https://discord.com/developers/docs/resources/guild#guild-object-verification-level)
  /// required for the guild
  final int verificationLevel;

  late final DiscordVerificationLevel? _verificationLevelAsEnum;

  /// default [message notifications level](https://discord.com/developers/docs/resources/guild#guild-object-default-message-notification-level)
  final int defaultMessageNotifications;

  late final DiscordMessageNotificationsLevel?
      _defaultMessageNotificationsAsEnum;

  /// [explicit content filter level](https://discord.com/developers/docs/resources/guild#guild-object-explicit-content-filter-level)
  final int explicitContentFilter;
  late final DiscordExplicitContentFilterLevel? _explicitContentFilterAsEnum;

  /// roles in the guild
  final List<DiscordRole> roles;

  /// custom guild emojis
  final List<DiscordEmoji> emojis;

  /// enabled guild
  final List<String> features;

  late final List<DiscordGuildFeature>? _featuresAsEnum;

  /// required [MFA level](https://discord.com/developers/docs/resources/guild#guild-object-mfa-level)
  /// for the guild
  final int mfaLevel;

  late final DiscordMfaLevel? _mfaLevelAsEnum;

  /// application id of the guild creator if it is bot-created
  ///
  /// can be null
  final DiscordSnowflake? applicationId;

  /// the id of the channel where guild notices such as welcome
  /// messages and boost events are posted
  ///
  /// can be null
  final DiscordSnowflake? systemChannelId;

  /// [system channel flags](https://discord.com/developers/docs/resources/guild#guild-object-system-channel-flags)
  final int systemChannelFlags;

  late final List<DiscordSystemChannelFlag>? _systemChannelFlagsAsEnum;

  /// the id of the channel where Community guilds
  /// can display rules and/or guidelines
  ///
  /// can be null
  final DiscordSnowflake? rulesChannelId;

  /// when this guild was joined at
  /// as an ISO 8601 datetime string
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final String? joinedAt;

  late final DateTime? _joinedAtAsDateTime;

  /// true if this is considered a large guild
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final bool? large;

  /// true if this guild is unavailable due to an outage
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final bool? unavailable;

  /// total number of members in this guild
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final int? memberCount;

  /// states of members currently in voice channels;
  /// lacks the `guild_id` key
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordVoiceState>? voiceStates;

  /// users in the guild
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordGuildMember>? members;

  /// channels in the guild
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordChannel>? channels;

  /// all active threads in the guild that current user has permission to view
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordChannel>? threads;

  /// presences of the members in the guild, will only include
  /// non-offline members if the size is greater than `large threshold`
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordPresenceUpdate>? presences;

  /// the maximum number of presences for the guild
  /// (`null` is always returned, apart from the largest of guilds)
  ///
  /// is not always returned, and can be null
  final int? maxPresences;

  /// the maximum number of members for the guild
  ///
  /// is not always returned, hence the nullable property
  final int? maxMembers;

  /// the vanity url code for the guild
  ///
  /// can be null
  final String? vanityUrlCode;

  /// the description of a Community guild
  ///
  /// can be null
  final String? description;

  /// [banner hash](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// can be null
  final String? banner;

  /// [premium tier](https://discord.com/developers/docs/resources/guild#guild-object-premium-tier)
  /// (Server Boost level)
  final int premiumTier;

  late final DiscordGuildPremiumTier? _premiumTierAsEnum;

  /// the number of boosts this guild currently has
  ///
  /// is not always returned, hence the nullable property
  final int? premiumSubscriptionCount;

  /// the preferred [locale](https://discord.com/developers/docs/reference#locales)
  /// of a Community guild; used in server discovery and
  /// notices from Discord, and sent in interactions;
  /// defaults to "en-US"
  final String preferredLocale;

  /// the id of the channel where admins and moderators
  /// of Community guilds receive notices from Discord
  ///
  /// can be null
  final DiscordSnowflake? publicUpdatesChannelId;

  /// the maximum amount of users in a video channel
  ///
  /// is not always returned, hence the nullable property
  final int? maxVideoChannelUsers;

  /// approximate number of members in this guild, returned
  /// from the `GET /guilds/<id>` endpoint when `with_counts` is `true`
  ///
  /// is not always returned, hence the nullable property
  final int? approximateMemberCount;

  ///	approximate number of non-offline members in this guild, returned
  /// from the `GET /guilds/<id>` endpoint when `with_counts` is `true`
  ///
  /// is not always returned, hence the nullable property
  final int? approximatePresenceCount;

  /// the welcome screen of a Community guild, shown to new members,
  /// returned in an [Invite](https://discord.com/developers/docs/resources/invite#invite-object)'s
  /// guild object
  ///
  /// is not always returned, hence the nullable property
  final DiscordWelcomeScreen? welcomeScreen;

  /// [guild NSFW level](https://discord.com/developers/docs/resources/guild#guild-object-guild-nsfw-level)
  final int nsfwLevel;

  late final DiscordNsfwLevel? _nsfwLevelAsEnum;

  /// Stage instances in the guild
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordStageInstance>? stageInstances;

  /// custom guild stickers
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordSticker>? stickers;

  /// the scheduled events in the guild
  ///
  /// * This field is only sent within the [GUILD_CREATE](https://discord.com/developers/docs/topics/gateway#guild-create) event
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordGuildScheduledEvent>? guildScheduledEvents;

  /// whether the guild has the boost progress bar enabled
  final bool premiumProgressBarEnabled;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const iconEntry = 'icon';
  static const iconHashEntry = 'icon_hash';
  static const splashEntry = 'splash';
  static const discoverySplashEntry = 'discovery_splash';
  static const ownerEntry = 'owner';
  static const ownerIdEntry = 'owner_id';
  static const permissionsEntry = 'permissions';
  static const regionEntry = 'region';
  static const afkChannelIdEntry = 'afk_channel_id';
  static const afkTimeoutEntry = 'afk_timeout';
  static const widgetEnabledEntry = 'widget_enabled';
  static const widgetChannelIdEntry = 'widget_channel_id';
  static const verificationLevelEntry = 'verification_level';
  static const defaultMessageNotificationsEntry =
      'default_message_notifications';
  static const explicitContentFilterEntry = 'explicit_content_filter';
  static const rolesEntry = 'roles';
  static const emojisEntry = 'emojis';
  static const featuresEntry = 'features';
  static const mfaLevelEntry = 'mfa_level';
  static const applicationIdEntry = 'application_id';
  static const systemChannelIdEntry = 'system_channel_id';
  static const systemChannelFlagsEntry = 'system_channel_flags';
  static const rulesChannelIdEntry = 'rules_channel_id';
  static const joinedAtEntry = 'joined_at';
  static const largeEntry = 'large';
  static const unavailableEntry = 'unavailable';
  static const memberCountEntry = 'member_count';
  static const voiceStatesEntry = 'voice_states';
  static const membersEntry = 'members';
  static const channelsEntry = 'channels';
  static const threadsEntry = 'threads';
  static const presencesEntry = 'presences';
  static const maxPresencesEntry = 'max_presences';
  static const maxMembersEntry = 'max_members';
  static const vanityUrlCodeEntry = 'vanity_url_code';
  static const descriptionEntry = 'description';
  static const bannerEntry = 'banner';
  static const premiumTierEntry = 'premium_tier';
  static const premiumSubscriptionCountEntry = 'premium_subscription_count';
  static const preferredLocaleEntry = 'preferred_locale';
  static const publicUpdatesChannelIdEntry = 'public_updates_channel_id';
  static const maxVideoChannelUsersEntry = 'max_video_channel_users';
  static const approximateMemberCountEntry = 'approximate_member_count';
  static const approximatePresenceCountEntry = 'approximate_presence_count';
  static const welcomeScreenEntry = 'welcome_screen';
  static const nsfwLevelEntry = 'nsfw_level';
  static const stageInstancesEntry = 'stage_instances';
  static const stickersEntry = 'stickers';
  static const guildScheduledEventsEntry = 'guild_scheduled_events';
  static const premiumProgressBarEnabledEntry = 'premium_progress_bar_enabled';

  DiscordGuild({
    required this.id,
    required this.name,
    this.icon,
    this.iconHash,
    this.splash,
    this.discoverySplash,
    this.owner,
    required this.ownerId,
    this.permissions,
    @Deprecated("Use channel.rtc_region instead") this.region,
    this.afkChannelId,
    required this.afkTimeout,
    this.widgetEnabled,
    this.widgetChannelId,
    required this.verificationLevel,
    required this.defaultMessageNotifications,
    required this.explicitContentFilter,
    required this.roles,
    required this.emojis,
    required this.features,
    required this.mfaLevel,
    this.applicationId,
    this.systemChannelId,
    required this.systemChannelFlags,
    this.rulesChannelId,
    this.joinedAt,
    this.large,
    this.unavailable,
    this.memberCount,
    this.voiceStates,
    this.members,
    this.channels,
    this.threads,
    this.presences,
    this.maxPresences,
    this.maxMembers,
    this.vanityUrlCode,
    this.description,
    this.banner,
    required this.premiumTier,
    this.premiumSubscriptionCount,
    required this.preferredLocale,
    this.publicUpdatesChannelId,
    this.maxVideoChannelUsers,
    this.approximateMemberCount,
    this.approximatePresenceCount,
    this.welcomeScreen,
    required this.nsfwLevel,
    this.stageInstances,
    this.stickers,
    this.guildScheduledEvents,
    required this.premiumProgressBarEnabled,
  });

  DiscordVerificationLevel get verificationLevelAsEnum =>
      _verificationLevelAsEnum ??=
          DiscordVerificationLevel.values[verificationLevel];

  DiscordMessageNotificationsLevel get defaultMessageNotificationsAsEnum =>
      _defaultMessageNotificationsAsEnum ??=
          DiscordMessageNotificationsLevel.values[defaultMessageNotifications];

  DiscordExplicitContentFilterLevel get explicitContentFilterAsEnum =>
      _explicitContentFilterAsEnum ??=
          DiscordExplicitContentFilterLevel.values[explicitContentFilter];

  DiscordMfaLevel get mfaLevelAsEnum =>
      _mfaLevelAsEnum ??= DiscordMfaLevel.values[mfaLevel];

  List<DiscordSystemChannelFlag> get systemChannelFlagsAsEnum {
    if (_systemChannelFlagsAsEnum != null) return _systemChannelFlagsAsEnum!;
    _systemChannelFlagsAsEnum = <DiscordSystemChannelFlag>[];
    for (final k in DiscordSystemChannelFlag.values) {
      if ((systemChannelFlags & (1 << k.index)) >> k.index == 1) {
        _systemChannelFlagsAsEnum!.add(k);
      }
    }
    return _systemChannelFlagsAsEnum!;
  }

  DateTime? get joinedAtAsDateTime {
    if (joinedAt == null) return null;
    return _joinedAtAsDateTime ??= DateTime.parse(joinedAt!);
  }

  DiscordGuildPremiumTier get premiumTierAsEnum =>
      _premiumTierAsEnum ??= DiscordGuildPremiumTier.values[premiumTier];

  DiscordNsfwLevel get nsfwLevelAsEnum =>
      _nsfwLevelAsEnum ??= DiscordNsfwLevel.values[nsfwLevel];

  List<DiscordGuildFeature> get featuresAsEnum =>
      _featuresAsEnum ??= discordGuildFeaturesFromValues(features);

  factory DiscordGuild.fromJson(Map<String, dynamic> json) => DiscordGuild(
        id: DiscordSnowflake(json[idEntry] as String),
        name: json[nameEntry] as String,
        icon: json[iconEntry] as String?,
        iconHash: json[iconHashEntry] as String?,
        splash: json[splashEntry] as String?,
        discoverySplash: json[discoverySplashEntry] as String?,
        owner: json[ownerEntry] as bool?,
        ownerId: DiscordSnowflake(json[ownerIdEntry] as String),
        permissions: json[permissionsEntry] as String?,
        // ignore: deprecated_member_use_from_same_package
        region: json[regionEntry] as String,
        afkChannelId: json[afkChannelIdEntry] != null
            ? DiscordSnowflake(json[afkChannelIdEntry] as String)
            : null,
        afkTimeout: json[afkTimeoutEntry] as int,
        widgetEnabled: json[widgetEnabledEntry] as bool?,
        widgetChannelId: json[widgetChannelIdEntry] != null
            ? DiscordSnowflake(json[widgetChannelIdEntry] as String)
            : null,
        verificationLevel: json[verificationLevelEntry] as int,
        defaultMessageNotifications:
            json[defaultMessageNotificationsEntry] as int,
        explicitContentFilter: json[explicitContentFilterEntry] as int,
        roles: List<DiscordRole>.from(
          (json[rolesEntry] as List<Map<String, dynamic>>)
              .map(DiscordRole.fromJson),
        ),
        emojis: List<DiscordEmoji>.from(
          (json[emojisEntry] as List<Map<String, dynamic>>)
              .map(DiscordEmoji.fromJson),
        ),
        features: List<String>.from(json[featuresEntry] as List<String>),
        mfaLevel: json[mfaLevelEntry] as int,
        applicationId: json[applicationIdEntry] != null
            ? DiscordSnowflake(json[applicationIdEntry] as String)
            : null,
        systemChannelId: json[systemChannelIdEntry] != null
            ? DiscordSnowflake(json[systemChannelIdEntry] as String)
            : null,
        systemChannelFlags: json[systemChannelFlagsEntry] as int,
        rulesChannelId: json[rulesChannelIdEntry] != null
            ? DiscordSnowflake(json[rulesChannelIdEntry] as String)
            : null,
        joinedAt: json[joinedAtEntry] as String?,
        large: json[largeEntry] as bool?,
        unavailable: json[unavailableEntry] as bool?,
        memberCount: json[memberCountEntry] as int?,
        voiceStates: json[voiceStatesEntry] != null
            ? List<DiscordVoiceState>.from(
                (json[voiceStatesEntry] as List<Map<String, dynamic>>)
                    .map(DiscordVoiceState.fromJson),
              )
            : null,
        members: json[membersEntry] != null
            ? List<DiscordGuildMember>.from(
                (json[membersEntry] as List<Map<String, dynamic>>)
                    .map(DiscordGuildMember.fromJson),
              )
            : null,
        channels: json[channelsEntry] != null
            ? List<DiscordChannel>.from(
                (json[channelsEntry] as List<Map<String, dynamic>>)
                    .map(DiscordChannel.fromJson),
              )
            : null,
        threads: json[presencesEntry] != null
            ? List<DiscordChannel>.from(
                (json[presencesEntry] as List<Map<String, dynamic>>)
                    .map(DiscordChannel.fromJson),
              )
            : null,
        presences: json[presencesEntry] != null
            ? List<DiscordPresenceUpdate>.from(
                (json[presencesEntry] as List<Map<String, dynamic>>)
                    .map(DiscordPresenceUpdate.fromJson),
              )
            : null,
        maxPresences: json[maxPresencesEntry] as int?,
        maxMembers: json[maxMembersEntry] as int?,
        vanityUrlCode: json[vanityUrlCodeEntry] as String?,
        description: json[descriptionEntry] as String?,
        banner: json[bannerEntry] as String?,
        premiumTier: json[premiumTierEntry] as int,
        premiumSubscriptionCount: json[premiumSubscriptionCountEntry] as int?,
        preferredLocale: json[preferredLocaleEntry] as String,
        publicUpdatesChannelId: json[publicUpdatesChannelIdEntry] != null
            ? DiscordSnowflake(json[publicUpdatesChannelIdEntry] as String)
            : null,
        maxVideoChannelUsers: json[maxVideoChannelUsersEntry] as int?,
        approximateMemberCount: json[approximateMemberCountEntry] as int?,
        approximatePresenceCount: json[approximatePresenceCountEntry] as int?,
        welcomeScreen: json[welcomeScreenEntry] != null
            ? DiscordWelcomeScreen.fromJson(
                json[welcomeScreenEntry] as Map<String, dynamic>,
              )
            : null,
        nsfwLevel: json[nsfwLevelEntry] as int,
        stageInstances: json[stageInstancesEntry] != null
            ? List<DiscordStageInstance>.from(
                (json[stageInstancesEntry] as List<Map<String, dynamic>>)
                    .map(DiscordStageInstance.fromJson),
              )
            : null,
        stickers: json[stickersEntry] != null
            ? List<DiscordSticker>.from(
                (json[stickersEntry] as List<Map<String, dynamic>>)
                    .map(DiscordSticker.fromJson),
              )
            : null,
        guildScheduledEvents: json[guildScheduledEventsEntry] != null
            ? List<DiscordGuildScheduledEvent>.from(
                (json[guildScheduledEventsEntry] as List<Map<String, dynamic>>)
                    .map(DiscordGuildScheduledEvent.fromJson),
              )
            : null,
        premiumProgressBarEnabled: json[premiumProgressBarEnabledEntry] as bool,
      );
}
