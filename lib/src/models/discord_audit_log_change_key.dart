import 'package:discord_api/src/models/discord_optional_audit_entry_info.dart';
import 'package:discord_api/src/models/discord_snowflake.dart';

import 'discord_overwrite.dart';
import 'discord_role.dart';

enum DiscordAuditLogChangeKey {
  /// name: afk_channel_id
  ///
  /// object changed: guild
  ///
  /// type: snowflake
  ///
  /// description: afk channel changed
  afkChannelId,

  /// name: afk_timeout
  ///
  /// object changed: guild
  ///
  /// type: integer
  ///
  /// description: afk timeout duration changed
  afkTimeout,

  /// name: allow
  ///
  /// object changed: role
  ///
  /// type: string
  ///
  /// description: a permission on a text or voice channel was allowed for a role
  allow,

  /// name: application_id
  ///
  /// object changed: channel
  ///
  /// type: snowflake
  ///
  /// description: application id of the added or removed webhook or bot
  applicationId,

  /// name: archived
  ///
  /// object changed: thread
  ///
  /// type: boolean
  ///
  /// description: thread is now archived/unarchived
  archived,

  /// name: asset
  ///
  /// object changed: sticker
  ///
  /// type: string
  ///
  /// description: empty string
  asset,

  /// name: auto_archive_duration
  ///
  /// object changed: thread
  ///
  /// type: integer
  ///
  /// description: thread auto archive duration changed
  autoArchiveDuration,

  /// name: available
  ///
  /// object changed: sticker
  ///
  /// type: boolean
  ///
  /// description: availability of sticker changed
  available,

  /// name: avatar_hash
  ///
  /// object changed: user
  ///
  /// type: string
  ///
  /// description: user avatar changed
  avatarHash,

  /// name: banner_hash
  ///
  /// object changed: guild
  ///
  /// type: string
  ///
  /// description: guild banner changed
  bannerHash,

  /// name: bitrate
  ///
  /// object changed: channel
  ///
  /// type: integer
  ///
  /// description: voice channel bitrare changed
  bitrate,

  /// name: channel_id
  ///
  /// object changed: invite or guild scheduled event
  ///
  /// type: snowflake
  ///
  /// description: channel for invite code or guild scheduled event changed
  channelId,

  /// name: code
  ///
  /// object changed: invite
  ///
  /// type: string
  ///
  /// description: invite code changed
  code,

  /// name: color
  ///
  /// object changed: role
  ///
  /// type: integer
  ///
  /// description: role color changed
  color,

  /// name: communication_disabled_until
  ///
  /// object changed: member
  ///
  /// type: ISO8601 timestamp string
  ///
  /// description: member timeout state changed
  communicationDisabledUntil,

  /// name: deaf
  ///
  /// object changed: member
  ///
  /// type: boolean
  ///
  /// description: user server deafened/undeafened
  deaf,

  /// name: default_auto_archive_duration
  ///
  /// object changed: channel
  ///
  /// type: integer
  ///
  /// description: default auto archive duration for newly created threads changed
  defaultAutoArchiveDuration,

  /// name: default_message_notifications
  ///
  /// object changed: guild
  ///
  /// type: integer
  ///
  /// description: default [message notifications level](https://discord.com/developers/docs/resources/guild#guild-object-default-message-notification-level) changed
  defaultMessageNotifications,

  /// name: deny
  ///
  /// object changed: role
  ///
  /// type: string
  ///
  /// description: a permission on a text or voice channel was denied for a role
  deny,

  /// name: description
  ///
  /// object changed: guild, sticker, or guild scheduled event
  ///
  /// type: string
  ///
  /// description: description changed
  description,

  /// name: discovery_splash_hash
  ///
  /// object changed: guild
  ///
  /// type: string
  ///
  /// description: guild discovery splash changed
  discoverySplashHash,

  /// name: enable_emoticons
  ///
  /// object changed: integration
  ///
  /// type: boolean
  ///
  /// description: integration emoticons enabled/disabled
  enableEmoticons,

  /// name: entity_type
  ///
  /// object changed: guild scheduled event
  ///
  /// type: integer
  ///
  /// description: entity type of the guild scheduled event was changed
  entityType,

  /// name: expire_behavior
  ///
  /// object changed: integration
  ///
  /// type: integer
  ///
  /// description: integration expiring subscriber behavior changed
  expireBehavior,

  /// name: expire_grace_period
  ///
  /// object changed: integration
  ///
  /// type: integer
  ///
  /// description: integration expire grace period changed
  expireGracePeriod,

  /// name: explicit_content_filter
  ///
  /// object changed: guild
  ///
  /// type: integer
  ///
  /// description: change in [whose messages](https://discord.com/developers/docs/resources/guild#guild-object-explicit-content-filter-level)
  /// are scanned and deleted for explicit content in the server
  explicitContentFilter,

  /// name: format_type
  ///
  /// object changed: sticker
  ///
  /// type: integer ([format type](https://discord.com/developers/docs/resources/sticker#sticker-object-sticker-format-types))
  ///
  /// description: format type of the sticker changed
  formatType,

  /// name: guild_id
  ///
  /// object changed: sticker
  ///
  /// type: snowflake
  ///
  /// description: guild sticker is in changed
  guildId,

  /// name: hoist
  ///
  /// object changed: role
  ///
  /// type: boolean
  ///
  /// description: role is now displayed/no longer displayed separate from online users
  hoist,

  /// name: icon_hash
  ///
  /// object changed: guild or role
  ///
  /// type: string
  ///
  /// description: icon changed
  iconHash,

  /// name: id
  ///
  /// object changed: any
  ///
  /// type: snowflake
  ///
  /// description: the id of the changed entity - sometimes used in conjunction with other keys
  id,

  /// name: invitable
  ///
  /// object changed: thread
  ///
  /// type: boolean
  ///
  /// description: private thread is now invitable/no longer invitable
  invitable,

  /// name: inviter_id
  ///
  /// object changed: invite
  ///
  /// type: snowflake
  ///
  /// description: user who created invite code changed
  inviterId,

  /// name: location
  ///
  /// object changed: guild scheduled event
  ///
  /// type: string
  ///
  /// description: change in channel id for guild scheduled event
  location,

  /// name: locked
  ///
  /// object changed: thread
  ///
  /// type: boolean
  ///
  /// description: thread is now locked/no longer locked
  locked,

  /// name: max_age
  ///
  /// object changed: invite
  ///
  /// type: integer
  ///
  /// description: how long invite code lasts changed
  maxAge,

  /// name: max_uses
  ///
  /// object changed: invite
  ///
  /// type: integer
  ///
  /// description: how many times invite code can be used changed
  maxUses,

  /// name: mentionable
  ///
  /// object changed: role
  ///
  /// type: boolean
  ///
  /// description: role is now mentionable/no longer mentionable
  mentionable,

  /// name: mfa_level
  ///
  /// object changed: guild
  ///
  /// type: integer
  ///
  /// description: two-factor auth requirement changed
  mfaLevel,

  /// name: mute
  ///
  /// object changed: member
  ///
  /// type: boolean
  ///
  /// description: user server muted/unmuted
  mute,

  /// name: name
  ///
  /// object changed: any
  ///
  /// type: string
  ///
  /// description: name changed
  name,

  /// name: nick
  ///
  /// object changed: member
  ///
  /// type: string
  ///
  /// description: user nickname changed
  nick,

  /// name: nsfw
  ///
  /// object changed: channel
  ///
  /// type: boolean
  ///
  /// description: channel nsfw restriction changed
  nsfw,

  /// name: owner_id
  ///
  /// object changed: guild
  ///
  /// type: snowflake
  ///
  /// description: guild owner changed
  ownerId,

  /// name: permission_overwrites
  ///
  /// object changed: channel
  ///
  /// type: array of [channel overwrite](https://discord.com/developers/docs/resources/channel#overwrite-object) objects
  ///
  /// description: permissions on a channel changed
  permissionOverwrites,

  /// name: permissions
  ///
  /// object changed: role
  ///
  /// type: string
  ///
  /// description: [permissions](https://discord.com/developers/docs/topics/permissions#permissions-bitwise-permission-flags) for a role changed
  permissions,

  /// name: position
  ///
  /// object changed: channel
  ///
  /// type: integer
  ///
  /// description: text or voice channel position changed
  position,

  /// name: preferred_locale
  ///
  /// object changed: guild
  ///
  /// type: string
  ///
  /// description: preferred language for the guild changed
  preferredLocale,

  /// name: privacy_level
  ///
  /// object changed: state instance or guild scheduled event
  ///
  /// type: integer ([privacy level](https://discord.com/developers/docs/resources/stage-instance#stage-instance-object-privacy-level))])
  ///
  /// description: privacy level of the stage instance or guild scheduled event changed
  privacyLevel,

  /// name: prune_delete_days
  ///
  /// object changed: guild
  ///
  /// type: integer
  ///
  /// description: change in number of days after which inactive and role-unassigned members are kicked
  pruneDeleteDays,

  /// name: public_updates_channel_id
  ///
  /// object changed: guild
  ///
  /// type: snowflake
  ///
  /// description: id of the public updates channel changed
  publicUpdatesChannelId,

  /// name: rate_limit_per_user
  ///
  /// object changed: channel
  ///
  /// type: integer
  ///
  /// description: amount of seconds a user has to wait before sending another message changed
  rateLimitPerUser,

  /// name: region
  ///
  /// object changed: guild
  ///
  /// type: string
  ///
  /// description: region of the guild changed
  region,

  /// name: rules_channel_id
  ///
  /// object changed: guild
  ///
  /// type: snowflake
  ///
  /// description: id of the rules channel changed
  rulesChannelId,

  /// name: splash_hash
  ///
  /// object changed: guild
  ///
  /// type: string
  ///
  /// description: invite splash hash artwork changed
  splashHash,

  /// name: status
  ///
  /// object changed: guild scheduled event
  ///
  /// type : integer ([status](https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-status))
  ///
  /// description: status of guild scheduled event was changed
  status,

  /// name: system_channel_id
  ///
  /// object changed: guild
  ///
  /// type: snowflake
  ///
  /// description: id of the system channel changed
  systemChannelId,

  /// name: tags
  ///
  /// object changed: sticker
  ///
  /// type: string
  ///
  /// description: related emoji of sticker changed
  tags,

  /// name: temporary
  ///
  /// object changed: invite
  ///
  /// type: boolean
  ///
  /// description: invite code is temporary/never expires
  temporary,

  /// name: topic
  ///
  /// object changed: channel or stage instance
  ///
  /// type: string
  ///
  /// description: topic of text channel or stage instance changed
  topic,

  /// name: type
  ///
  /// object changed: any
  ///
  /// type: integer or string
  ///
  /// description: type of entity created
  type,

  /// name: unicode_emoji
  ///
  /// object changed: role
  ///
  /// type: string
  ///
  /// description: role unicode emoji changed
  unicodeEmoji,

  /// name: user_limit
  ///
  /// object changed: voice channel
  ///
  /// type: integer
  ///
  /// description: new user limit in a voice channel
  userLimit,

  /// name: uses
  ///
  /// object changed: invite
  ///
  /// type: integer
  ///
  /// description: how many times invite code has been used
  uses,

  /// name: vanity_url_code
  ///
  /// object changed: guild
  ///
  /// type: string
  ///
  /// description: guild invite vanity url changed
  vanityUrlCode,

  /// name: verification_level
  ///
  /// object changed: guild
  ///
  /// type: integer
  ///
  /// description: required verification level of the guild changed
  verificationLevel,

  /// name: widget_channel_id
  ///
  /// object changed: guild
  ///
  /// type: snowflake
  ///
  /// description: channel id of the server widget changed
  widgetChannelId,

  /// name: widget_enabled
  ///
  /// object changed: guild
  ///
  /// type: boolean
  ///
  /// description: server widget enabled/disabled
  widgetEnabled,

  /// name: $add
  ///
  /// object changed: guild
  ///
  /// type: array of partial role objects
  ///
  /// description: new role added
  $add,

  /// name: $remove
  ///
  /// object changed: guild
  ///
  /// type: array of partial role objects
  ///
  /// description: role removed
  $remove,
}

DiscordAuditLogChangeKey discordAuditLogChangeKeyFromValue(String s) {
  return DiscordAuditLogChangeKey.values.firstWhere((e) => e.toApiString == s);
}

extension ApiValue on DiscordAuditLogChangeKey {
  Type get toType {
    switch (this) {
      case DiscordAuditLogChangeKey.afkChannelId:
      case DiscordAuditLogChangeKey.applicationId:
      case DiscordAuditLogChangeKey.channelId:
      case DiscordAuditLogChangeKey.guildId:
      case DiscordAuditLogChangeKey.id:
      case DiscordAuditLogChangeKey.inviterId:
      case DiscordAuditLogChangeKey.ownerId:
      case DiscordAuditLogChangeKey.publicUpdatesChannelId:
      case DiscordAuditLogChangeKey.rulesChannelId:
      case DiscordAuditLogChangeKey.systemChannelId:
      case DiscordAuditLogChangeKey.widgetChannelId:
        return DiscordSnowflake;
      case DiscordAuditLogChangeKey.afkTimeout:
      case DiscordAuditLogChangeKey.autoArchiveDuration:
      case DiscordAuditLogChangeKey.bitrate:
      case DiscordAuditLogChangeKey.color:
      case DiscordAuditLogChangeKey.defaultAutoArchiveDuration:
      case DiscordAuditLogChangeKey.defaultMessageNotifications:
      case DiscordAuditLogChangeKey.entityType:
      case DiscordAuditLogChangeKey.expireBehavior:
      case DiscordAuditLogChangeKey.expireGracePeriod:
      case DiscordAuditLogChangeKey.explicitContentFilter:
      case DiscordAuditLogChangeKey.formatType:
      case DiscordAuditLogChangeKey.maxAge:
      case DiscordAuditLogChangeKey.maxUses:
      case DiscordAuditLogChangeKey.mfaLevel:
      case DiscordAuditLogChangeKey.position:
      case DiscordAuditLogChangeKey.privacyLevel:
      case DiscordAuditLogChangeKey.pruneDeleteDays:
      case DiscordAuditLogChangeKey.rateLimitPerUser:
      case DiscordAuditLogChangeKey.status:
      case DiscordAuditLogChangeKey.userLimit:
      case DiscordAuditLogChangeKey.uses:
      case DiscordAuditLogChangeKey.verificationLevel:
        return int;
      case DiscordAuditLogChangeKey.allow:
      case DiscordAuditLogChangeKey.asset:
      case DiscordAuditLogChangeKey.avatarHash:
      case DiscordAuditLogChangeKey.bannerHash:
      case DiscordAuditLogChangeKey.code:
      case DiscordAuditLogChangeKey.communicationDisabledUntil:
      case DiscordAuditLogChangeKey.deny:
      case DiscordAuditLogChangeKey.description:
      case DiscordAuditLogChangeKey.discoverySplashHash:
      case DiscordAuditLogChangeKey.iconHash:
      case DiscordAuditLogChangeKey.location:
      case DiscordAuditLogChangeKey.name:
      case DiscordAuditLogChangeKey.nick:
      case DiscordAuditLogChangeKey.permissions:
      case DiscordAuditLogChangeKey.preferredLocale:
      case DiscordAuditLogChangeKey.region:
      case DiscordAuditLogChangeKey.splashHash:
      case DiscordAuditLogChangeKey.tags:
      case DiscordAuditLogChangeKey.topic:
      case DiscordAuditLogChangeKey.unicodeEmoji:
      case DiscordAuditLogChangeKey.vanityUrlCode:
        return String;
      case DiscordAuditLogChangeKey.archived:
      case DiscordAuditLogChangeKey.available:
      case DiscordAuditLogChangeKey.deaf:
      case DiscordAuditLogChangeKey.enableEmoticons:
      case DiscordAuditLogChangeKey.hoist:
      case DiscordAuditLogChangeKey.invitable:
      case DiscordAuditLogChangeKey.locked:
      case DiscordAuditLogChangeKey.mentionable:
      case DiscordAuditLogChangeKey.mute:
      case DiscordAuditLogChangeKey.nsfw:
      case DiscordAuditLogChangeKey.temporary:
      case DiscordAuditLogChangeKey.widgetEnabled:
        return bool;
      case DiscordAuditLogChangeKey.$add:
      case DiscordAuditLogChangeKey.$remove:
        return List<DiscordRole>;
      case DiscordAuditLogChangeKey.permissionOverwrites:
        return List<DiscordOverwrite>;
      case DiscordAuditLogChangeKey.type:
        return Object; // "integer or string"
    }
  }

  String get toApiString {
    switch (this) {
      case DiscordAuditLogChangeKey.$add:
        return '\$add';
      case DiscordAuditLogChangeKey.$remove:
        return '\$remove';
      case DiscordAuditLogChangeKey.afkChannelId:
        return 'afk_channel_id';
      case DiscordAuditLogChangeKey.afkTimeout:
        return 'afk_timeout';
      case DiscordAuditLogChangeKey.allow:
        return 'allow';
      case DiscordAuditLogChangeKey.applicationId:
        return 'application_id';
      case DiscordAuditLogChangeKey.archived:
        return 'archived';
      case DiscordAuditLogChangeKey.asset:
        return 'asset';
      case DiscordAuditLogChangeKey.autoArchiveDuration:
        return 'auto_archive_duration';
      case DiscordAuditLogChangeKey.available:
        return 'available';
      case DiscordAuditLogChangeKey.avatarHash:
        return 'avatar_hash';
      case DiscordAuditLogChangeKey.bannerHash:
        return 'banner_hash';
      case DiscordAuditLogChangeKey.bitrate:
        return 'bitrate';
      case DiscordAuditLogChangeKey.channelId:
        return 'channel_id';
      case DiscordAuditLogChangeKey.code:
        return 'code';
      case DiscordAuditLogChangeKey.color:
        return 'color';
      case DiscordAuditLogChangeKey.communicationDisabledUntil:
        return 'communication_disabled_until';
      case DiscordAuditLogChangeKey.deaf:
        return 'deaf';
      case DiscordAuditLogChangeKey.defaultAutoArchiveDuration:
        return 'default_auto_archive_duration';
      case DiscordAuditLogChangeKey.defaultMessageNotifications:
        return 'default_message_notifications';
      case DiscordAuditLogChangeKey.deny:
        return 'deny';
      case DiscordAuditLogChangeKey.description:
        return 'description';
      case DiscordAuditLogChangeKey.discoverySplashHash:
        return 'discovery_splash_hash';
      case DiscordAuditLogChangeKey.enableEmoticons:
        return 'enable_emoticons';
      case DiscordAuditLogChangeKey.entityType:
        return 'entity_type';
      case DiscordAuditLogChangeKey.expireBehavior:
        return 'expire_behavior';
      case DiscordAuditLogChangeKey.expireGracePeriod:
        return 'expire_grace_period';
      case DiscordAuditLogChangeKey.explicitContentFilter:
        return 'explicit_content_filter';
      case DiscordAuditLogChangeKey.formatType:
        return 'format_type';
      case DiscordAuditLogChangeKey.guildId:
        return 'guild_id';
      case DiscordAuditLogChangeKey.hoist:
        return 'hoist';
      case DiscordAuditLogChangeKey.iconHash:
        return 'icon_hash';
      case DiscordAuditLogChangeKey.id:
        return 'id';
      case DiscordAuditLogChangeKey.invitable:
        return 'invitable';
      case DiscordAuditLogChangeKey.inviterId:
        return 'inviter_id';
      case DiscordAuditLogChangeKey.location:
        return 'location';
      case DiscordAuditLogChangeKey.locked:
        return 'locked';
      case DiscordAuditLogChangeKey.maxAge:
        return 'max_age';
      case DiscordAuditLogChangeKey.maxUses:
        return 'max_uses';
      case DiscordAuditLogChangeKey.mentionable:
        return 'mentionable';
      case DiscordAuditLogChangeKey.mfaLevel:
        return 'mfa_level';
      case DiscordAuditLogChangeKey.mute:
        return 'mute';
      case DiscordAuditLogChangeKey.name:
        return 'name';
      case DiscordAuditLogChangeKey.nick:
        return 'nick';
      case DiscordAuditLogChangeKey.nsfw:
        return 'nsfw';
      case DiscordAuditLogChangeKey.ownerId:
        return 'owner_id';
      case DiscordAuditLogChangeKey.permissionOverwrites:
        return 'permission_overwrites';
      case DiscordAuditLogChangeKey.permissions:
        return 'permissions';
      case DiscordAuditLogChangeKey.position:
        return 'position';
      case DiscordAuditLogChangeKey.preferredLocale:
        return 'preferred_locale';
      case DiscordAuditLogChangeKey.privacyLevel:
        return 'privacy_level';
      case DiscordAuditLogChangeKey.pruneDeleteDays:
        return 'prune_delete_days';
      case DiscordAuditLogChangeKey.publicUpdatesChannelId:
        return 'public_updates_channel_id';
      case DiscordAuditLogChangeKey.rateLimitPerUser:
        return 'rate_limit_per_user';
      case DiscordAuditLogChangeKey.region:
        return 'region';
      case DiscordAuditLogChangeKey.rulesChannelId:
        return 'rules_channel_id';
      case DiscordAuditLogChangeKey.splashHash:
        return 'splash_hash';
      case DiscordAuditLogChangeKey.status:
        return 'status';
      case DiscordAuditLogChangeKey.systemChannelId:
        return 'system_channel_id';
      case DiscordAuditLogChangeKey.tags:
        return 'tags';
      case DiscordAuditLogChangeKey.temporary:
        return 'temporary';
      case DiscordAuditLogChangeKey.topic:
        return 'topic';
      case DiscordAuditLogChangeKey.type:
        return 'type';
      case DiscordAuditLogChangeKey.unicodeEmoji:
        return 'unicode_emoji';
      case DiscordAuditLogChangeKey.userLimit:
        return 'user_limit';
      case DiscordAuditLogChangeKey.uses:
        return 'uses';
      case DiscordAuditLogChangeKey.vanityUrlCode:
        return 'vanity_url_code';
      case DiscordAuditLogChangeKey.verificationLevel:
        return 'verification_level';
      case DiscordAuditLogChangeKey.widgetChannelId:
        return 'widget_channel_id';
      case DiscordAuditLogChangeKey.widgetEnabled:
        return 'widget_enabled';
    }
  }
}
