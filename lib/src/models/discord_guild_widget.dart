import 'package:discord_api/src/models/discord_channel.dart';
import 'package:discord_api/src/models/discord_snowflake.dart';
import 'package:discord_api/src/models/discord_user.dart';

class DiscordGuildWidget {
  /// guild id
  final DiscordSnowflake id;

  /// guild name (2-100 characters)
  final String name;

  /// instant invite for the guilds specified widget invite channel
  final String? instantInvite;

  /// voice and stage channels which are accessible by @everyone
  ///
  /// list of partial channel objects
  final List<DiscordChannel> channels;

  /// special widget user objects that includes users presence (limit 100)
  ///
  /// list of partial user objects
  final List<DiscordUser> members;

  /// number of online members in this guild
  final int presenceCount;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const instantInviteEntry = 'instant_invite';
  static const channelsEntry = 'channels';
  static const membersEntry = 'members';
  static const presenceCountEntry = 'presence_count';

  DiscordGuildWidget({
    required this.id,
    required this.name,
    this.instantInvite,
    required this.channels,
    required this.members,
    required this.presenceCount,
  });

  factory DiscordGuildWidget.fromJson(Map<String, dynamic> json) =>
      DiscordGuildWidget(
        id: DiscordSnowflake(json[idEntry] as String),
        name: json[nameEntry] as String,
        instantInvite: json[instantInviteEntry] as String?,
        channels: List<DiscordChannel>.from(
            (json[channelsEntry] as List<Map<String, dynamic>>)
                .map(DiscordChannel.fromJson)),
        members: List<DiscordUser>.from(
            (json[membersEntry] as List<Map<String, dynamic>>)
                .map(DiscordUser.fromJson)),
        presenceCount: json[presenceCountEntry] as int,
      );
}
