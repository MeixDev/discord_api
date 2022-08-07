import 'discord_user.dart';

class DiscordGuildMember {
  /// the user this guild member represents
  ///
  /// is not always returned, hence the nullable property
  final DiscordUser? user;

  /// this user's guild nickname
  ///
  /// is not always returned, and can be null
  final String? nick;

  /// the member's [guild avatar hash](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// is not always returned, and can be null
  final String? avatar;

  /// array of [role](https://discord.com/developers/docs/topics/permissions#role-object) object ids
  final List<String> roles;

  /// when the user joined the guild,
  /// as an ISO 8601 string
  final String joinedAt;

  late final DateTime? _joinedAtAsDateTime;

  /// when the user starter [boosting](https://support.discord.com/hc/en-us/articles/360028038352-Server-Boosting-) the guild
  ///
  /// is not always returned, and can be null
  final String? premiumSince;

  late final DateTime? _premiumSinceAsDateTime;

  /// whether the user is deafened in voice channels
  final bool deaf;

  /// whether the user is muted in voice channels
  final bool mute;

  /// whether the user has not yet passed the guild's [Membership Screening](https://discord.com/developers/docs/resources/guild#membership-screening-object) requirements
  ///
  /// is not always returned, hence the nullable property
  final bool? pending;

  /// total permissions of the member in the channel, including overwrites,
  /// returned when in the interaction object
  ///
  /// is not always returned, hence the nullable property
  final String? permissions;

  /// when the user's [timeout](https://support.discord.com/hc/en-us/articles/4413305239191-Time-Out-FAQ)
  /// will expire and the user will be able to communicate in the guild again,
  /// null or a time in the past if the user is not timed out
  ///
  /// is not always returned, and can be nullable
  final String? communicationDisabledUntil;

  late final DateTime? _communicationDisabledUntilAsDateTime;

  static const userEntry = 'user';
  static const nickEntry = 'nick';
  static const avatarEntry = 'avatar';
  static const rolesEntry = 'roles';
  static const joinedAtEntry = 'joined_at';
  static const premiumSinceEntry = 'premium_since';
  static const deafEntry = 'deaf';
  static const muteEntry = 'mute';
  static const pendingEntry = 'pending';
  static const permissionsEntry = 'permissions';
  static const communicationDisabledUntilEntry = 'communication_disabled_until';

  DiscordGuildMember({
    this.user,
    this.nick,
    this.avatar,
    required this.roles,
    required this.joinedAt,
    this.premiumSince,
    required this.deaf,
    required this.mute,
    this.pending,
    this.permissions,
    this.communicationDisabledUntil,
  });

  DateTime get joinedAtAsDateTime {
    _joinedAtAsDateTime ??= DateTime.parse(joinedAt);
    return _joinedAtAsDateTime!;
  }

  DateTime? get premiumSinceAsDateTime {
    return _premiumSinceAsDateTime ??=
        premiumSince != null ? DateTime.parse(premiumSince!) : null;
  }

  DateTime? get communicationDisabledUntilAsDateTime {
    return _communicationDisabledUntilAsDateTime ??=
        communicationDisabledUntil != null
            ? DateTime.parse(communicationDisabledUntil!)
            : null;
  }

  factory DiscordGuildMember.fromJson(Map<String, dynamic> json) =>
      DiscordGuildMember(
        user: json[userEntry] != null
            ? DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>)
            : null,
        nick: json[nickEntry] as String?,
        avatar: json[avatarEntry] as String?,
        roles: List<String>.from(json[rolesEntry] as List<dynamic>),
        joinedAt: json[joinedAtEntry] as String,
        premiumSince: json[premiumSinceEntry] as String?,
        deaf: json[deafEntry] as bool,
        mute: json[muteEntry] as bool,
        pending: json[pendingEntry] as bool?,
        permissions: json[permissionsEntry] as String?,
        communicationDisabledUntil:
            json[communicationDisabledUntilEntry] as String?,
      );
}
