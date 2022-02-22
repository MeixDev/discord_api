import 'package:discord_api/src/models/discord_snowflake.dart';
import 'package:discord_api/src/models/discord_user_flag.dart';

import 'discord_premium_type.dart';

class DiscordUser {
  final DiscordSnowflake id;

  final String username;
  final String discriminator;

  final String? avatar;

  final bool? bot;
  final bool? system;
  final bool? mfaEnabled;

  final String? banner;
  final int? accentColor;

  final String? locale;

  final bool? verified;
  final String? email;

  final int? flags;

  final int? premiumType;
  late final DiscordPremiumType? _premiumTypeAsEnum;
  final int? publicFlags;
  late final List<DiscordUserFlag>? _publicFlagsAsEnum;

  /// Isn't technically part of the object as per its definition.
  /// Some endpoints add it nonetheless.
  final DiscordGuildMember? member;

  static const idEntry = 'id';
  static const usernameEntry = 'username';
  static const discriminatorEntry = 'discriminator';
  static const avatarEntry = 'avatar';
  static const botEntry = 'bot';
  static const systemEntry = 'system';
  static const mfaEnabledEntry = 'mfa_enabled';
  static const bannerEntry = 'banner';
  static const accentColorEntry = 'accent_color';
  static const localeEntry = 'locale';
  static const verifiedEntry = 'verified';
  static const emailEntry = 'email';
  static const flagsEntry = 'flags';
  static const premiumTypeEntry = 'premium_type';
  static const publicFlagsEntry = 'public_flags';
  static const memberEntry = 'member';

  DiscordUser({
    required this.id,
    required this.username,
    required this.discriminator,
    this.avatar,
    this.bot,
    this.system,
    this.mfaEnabled,
    this.banner,
    this.accentColor,
    this.locale,
    this.verified,
    this.email,
    this.flags,
    this.premiumType,
    this.publicFlags,
    this.member,
  });

  DiscordPremiumType get premiumTypeAsEnum =>
      _premiumTypeAsEnum ??= DiscordPremiumType.values[premiumType ?? 0];

  void _addPublicFlagAsEnum(String r, int index, DiscordUserFlag flag) {
    if (r.length >= index + 1 && r.substring(index, index + 1) == '1') {
      _publicFlagsAsEnum!.add(flag);
    }
  }

  List<DiscordUserFlag> get publicFlagsAsEnum {
    if (flags == null || flags == 0) {
      _publicFlagsAsEnum = [DiscordUserFlag.none];
      return _publicFlagsAsEnum!;
    }
    if (_publicFlagsAsEnum != null) {
      return _publicFlagsAsEnum!;
    }
    _publicFlagsAsEnum = <DiscordUserFlag>[];
    final radixString =
        String.fromCharCodes(flags!.toRadixString(2).runes.toList().reversed);
    _addPublicFlagAsEnum(radixString, 0, DiscordUserFlag.staff);
    _addPublicFlagAsEnum(radixString, 1, DiscordUserFlag.partner);
    _addPublicFlagAsEnum(radixString, 2, DiscordUserFlag.hypesquad);
    _addPublicFlagAsEnum(radixString, 3, DiscordUserFlag.bugHunterLevel1);
    _addPublicFlagAsEnum(radixString, 6, DiscordUserFlag.hypesquadOnlineHouse1);
    _addPublicFlagAsEnum(radixString, 7, DiscordUserFlag.hypesquadOnlineHouse2);
    _addPublicFlagAsEnum(radixString, 8, DiscordUserFlag.hypesquadOnlineHouse3);
    _addPublicFlagAsEnum(radixString, 9, DiscordUserFlag.premiumEarlySupporter);
    _addPublicFlagAsEnum(radixString, 10, DiscordUserFlag.teamPseudoUser);
    _addPublicFlagAsEnum(radixString, 14, DiscordUserFlag.bugHunterLevel2);
    _addPublicFlagAsEnum(radixString, 16, DiscordUserFlag.verifiedBot);
    _addPublicFlagAsEnum(radixString, 17, DiscordUserFlag.verifiedDeveloper);
    _addPublicFlagAsEnum(radixString, 18, DiscordUserFlag.certifiedModerator);
    _addPublicFlagAsEnum(radixString, 19, DiscordUserFlag.botHttpInteractions);
    return _publicFlagsAsEnum!;
  }

  factory DiscordUser.fromJson(Map<String, dynamic> json) => DiscordUser(
        id: DiscordSnowflake(json[idEntry]),
        username: json[usernameEntry] as String,
        discriminator: json[discriminatorEntry] as String,
        avatar: json[avatarEntry] as String?,
        bot: json[botEntry] as bool?,
        system: json[systemEntry] as bool?,
        mfaEnabled: json[mfaEnabledEntry] as bool?,
        banner: json[bannerEntry] as String?,
        accentColor: json[accentColorEntry] as int?,
        locale: json[localeEntry] as String?,
        verified: json[verifiedEntry] as bool?,
        email: json[emailEntry] as String?,
        flags: json[flagsEntry] as int?,
        premiumType: json[premiumTypeEntry] as int?,
        publicFlags: json[publicFlagsEntry] as int?,
        member: json[memberEntry] as String?,
      );

  DiscordUser copyWith({
    DiscordSnowflake? id,
    String? username,
    String? discriminator,
    String? avatar,
    bool? bot,
    bool? system,
    bool? mfaEnabled,
    String? banner,
    int? accentColor,
    String? locale,
    bool? verified,
    String? email,
    int? flags,
    int? premiumType,
    int? publicFlags,
    String? member,
  }) {
    return DiscordUser(
      id: id ?? this.id,
      username: username ?? this.username,
      discriminator: discriminator ?? this.discriminator,
      avatar: avatar ?? this.avatar,
      bot: bot ?? this.bot,
      system: system ?? this.system,
      mfaEnabled: mfaEnabled ?? this.mfaEnabled,
      banner: banner ?? this.banner,
      accentColor: accentColor ?? this.accentColor,
      locale: locale ?? this.locale,
      verified: verified ?? this.verified,
      email: email ?? this.email,
      flags: flags ?? this.flags,
      premiumType: premiumType ?? this.premiumType,
      publicFlags: publicFlags ?? this.publicFlags,
      member: member ?? this.member,
    );
  }
}
