import 'discord_activity_flag.dart';
import 'discord_activity_type.dart';
import 'discord_emoji.dart';
import 'discord_snowflake.dart';

import 'discord_activity_assets.dart';
import 'discord_activity_button.dart';
import 'discord_activity_party.dart';
import 'discord_activity_secrets.dart';
import 'discord_activity_timestamps.dart';

class DiscordActivity {
  /// the activity's name
  final String name;

  /// [activity type](https://discord.com/developers/docs/topics/gateway#activity-object-activity-types)
  final int type;

  late final DiscordActivityType? _typeAsEnum;

  /// stream url, is validated when type is 1 (Streaming)
  ///
  /// is not always returned, and can be null
  final String? url;

  /// unix timestamp (in milliseconds) of when the activity
  /// was added to the user's session
  final int createdAt;

  late final DateTime? _createdAtAsDateTime;

  /// unix timestamps for start and/or end of the game
  ///
  /// is not always returned, hence the nullable property
  final DiscordActivityTimestamps? timestamps;

  /// application id of the game
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? applicationId;

  /// what the player is currently doing
  ///
  /// is not always returned, and can be null
  final String? details;

  /// the user's current party status
  ///
  /// is not always returned, and can be null
  final String? state;

  /// the emoji used for a custom status
  ///
  /// is not always returned, and can be null
  final DiscordEmoji? emoji;

  /// information for the current party of the player
  ///
  /// is not always returned, hence the nullable property
  final DiscordActivityParty? party;

  /// images for the presence and their hover texts
  ///
  /// is not always returned, hence the nullable property
  final DiscordActivityAssets? assets;

  /// secrets for Rich Presence joining and spectating
  ///
  /// is not always returned, hence the nullable property
  final DiscordActivitySecrets? secrets;

  /// whether or not the activity is an instanced game session
  ///
  /// is not always returned, hence the nullable property
  final bool? instance;

  /// activity flags **OR**'d together, describes what the payload includes
  ///
  /// is not always returned, hence the nullable property
  final int? flags;

  late final List<DiscordActivityFlag>? _flagsAsEnum;

  /// the custom buttons shown in the Rich Presence (max 2)
  ///
  /// is not always returned, hence the nullable property
  final List<DiscordActivityButton>? buttons;

  static const nameEntry = 'name';
  static const typeEntry = 'type';
  static const urlEntry = 'url';
  static const createdAtEntry = 'created_at';
  static const timestampsEntry = 'timestamps';
  static const applicationIdEntry = 'application_id';
  static const detailsEntry = 'details';
  static const stateEntry = 'state';
  static const emojiEntry = 'emoji';
  static const partyEntry = 'party';
  static const assetsEntry = 'assets';
  static const secretsEntry = 'secrets';
  static const instanceEntry = 'instance';
  static const flagsEntry = 'flags';
  static const buttonsEntry = 'buttons';

  DiscordActivity({
    required this.name,
    required this.type,
    this.url,
    required this.createdAt,
    this.timestamps,
    this.applicationId,
    this.details,
    this.state,
    this.emoji,
    this.party,
    this.assets,
    this.secrets,
    this.instance,
    this.flags,
    this.buttons,
  });

  DateTime? get createdAtAsDateTime =>
      _createdAtAsDateTime ??= DateTime.fromMillisecondsSinceEpoch(createdAt);

  DiscordActivityType get typeAsEnum =>
      _typeAsEnum ??= DiscordActivityType.values[type];

  List<DiscordActivityFlag>? get flagsAsEnum {
    if (_flagsAsEnum != null) return _flagsAsEnum!;
    if (flags == null) return _flagsAsEnum ??= [];
    _flagsAsEnum = <DiscordActivityFlag>[];
    for (final k in DiscordActivityFlag.values) {
      if ((flags! & (1 << k.index)) >> k.index == 1) {
        _flagsAsEnum!.add(k);
      }
    }
    return _flagsAsEnum!;
  }

  factory DiscordActivity.fromJson(Map<String, dynamic> json) =>
      DiscordActivity(
        name: json[nameEntry] as String,
        type: json[typeEntry] as int,
        url: json[urlEntry] as String?,
        createdAt: json[createdAtEntry] as int,
        timestamps: DiscordActivityTimestamps.fromJson(
            json[timestampsEntry] as Map<String, dynamic>),
        applicationId: json[applicationIdEntry] != null
            ? DiscordSnowflake(json[applicationIdEntry] as String)
            : null,
        details: json[detailsEntry] as String?,
        state: json[stateEntry] as String?,
        emoji: json[emojiEntry] != null
            ? DiscordEmoji.fromJson(json[emojiEntry] as Map<String, dynamic>)
            : null,
        party: json[partyEntry] != null
            ? DiscordActivityParty.fromJson(
                json[partyEntry] as Map<String, dynamic>)
            : null,
        assets: json[assetsEntry] != null
            ? DiscordActivityAssets.fromJson(
                json[assetsEntry] as Map<String, dynamic>)
            : null,
        secrets: json[secretsEntry] != null
            ? DiscordActivitySecrets.fromJson(
                json[secretsEntry] as Map<String, dynamic>)
            : null,
        instance: json[instanceEntry] as bool?,
        flags: json[flagsEntry] as int?,
        buttons: json[buttonsEntry] != null
            ? List<DiscordActivityButton>.from(
                json[buttonsEntry].map(DiscordActivityButton.fromJson))
            : null,
      );
}
