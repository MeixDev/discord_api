import 'discord_channel.dart';
import 'discord_guild.dart';
import 'discord_snowflake.dart';
import 'discord_user.dart';

class DiscordWebhook {
  final DiscordSnowflake id;
  final int type;
  final DiscordSnowflake? guildId;
  final DiscordSnowflake? channelId;
  final DiscordUser? user;
  final String? name;
  final String? avatar;
  final String? token;
  final DiscordSnowflake? applicationId;
  final DiscordGuild? sourceGuild;
  final DiscordChannel? sourceChannel;
  final String? url;
}
