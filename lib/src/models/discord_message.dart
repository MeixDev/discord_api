import 'discord_application.dart';
import 'discord_attachment.dart';
import 'discord_channel.dart';
import 'discord_channel_mention.dart';
import 'discord_embed.dart';
import 'discord_message_activity.dart';
import 'discord_message_flag.dart';
import 'discord_message_reference.dart';
import 'discord_message_type.dart';
import 'discord_snowflake.dart';
import 'discord_reaction.dart';
import 'discord_user.dart';

class DiscordMessage {
  final DiscordSnowflake id;
  final DiscordSnowflake? channelId;
  final DiscordSnowflake? guildId;
  final DiscordUser author; //can be a fake user, such as a webhook
  final DiscordGuildMember? member;
  final String content;
  final String timestamp;
  late final DateTime? _timestampAsDateTime;
  final String editedTimestamp;
  late final DateTime? _editedTimestampAsDateTime;
  final bool tts;
  final bool mentionEveryone;
  final List<DiscordUser> mentions;
  final List<String> mentionRoles;
  final List<DiscordChannelMention>? mentionChannels;
  final List<DiscordAttachment> attachments;
  final List<DiscordEmbed> embeds;
  final List<DiscordReaction>? reactions;

  /// Can be sent as either integer or string. In doubt,
  /// we will put both in Strings.
  final String? nonce;

  final bool pinned;
  final DiscordSnowflake? webhookId;
  final int type;
  late final DiscordMessageType? _typeAsEnum;
  final DiscordMessageActivity? activity;
  final DiscordApplication? application;
  final DiscordSnowflake? applicationId;
  final DiscordMessageReference? messageReference;
  final int? flags;
  late final List<DiscordMessageFlag>? _flagsAsEnum;
  final DiscordMessage? referencedMessage;
  final DiscordChannel? thread;
  final List<DiscordMessageComponent> components;
  final List<DiscordStickerItem> stickerItems;
  final List<DiscordSticker> stickers; // Deprecated
}
