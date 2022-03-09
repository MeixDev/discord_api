import 'discord_guild_member.dart';
import 'discord_premium_type.dart';
import 'discord_snowflake.dart';
import 'discord_user_flag.dart';

class DiscordUser {
  ///	the user's id
  ///
  /// required OAuth2 scope: identify
  final DiscordSnowflake id;

  /// the user's username, not unique across the platform
  ///
  /// required OAuth2 scope: identify
  final String username;

  /// the user's 4-digit discord-tag
  ///
  /// required OAuth2 scope: identify
  final String discriminator;

  /// the user's [avatar hash](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// required OAuth2 scope: identify
  final String? avatar;

  /// whether the user belongs to an OAuth2 application
  ///
  /// required OAuth2 scope: identify
  final bool? bot;

  /// whether the user is an Official Discord System user (part of the urgent system message)
  ///
  /// required OAuth2 scope: identify
  final bool? system;

  /// whether the user has two factor enabled on their account
  ///
  /// required OAuth2 scope: identify
  final bool? mfaEnabled;

  /// the user's [banner hash](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// required OAuth2 scope: identify
  final String? banner;

  /// the user's banner color encoded as an integer representation of hexadecimal color code
  ///
  /// required OAuth2 scope: identify
  final int? accentColor;

  /// the user's chosen [language option](https://discord.com/developers/docs/reference#locales)
  ///
  /// required OAuth2 scope: identify
  final String? locale;

  /// whether the email on this account has been verified
  ///
  /// required OAuth2 scope: email
  final bool? verified;

  /// the user's email
  ///
  /// required OAuth2 scope: email
  final String? email;

  /// the [flags](https://discord.com/developers/docs/resources/user#user-object-user-flags)
  /// on a user's account
  ///
  /// required OAuth2 scope: identify
  final int? flags;

  /// the [type of Nitro subscription](https://discord.com/developers/docs/resources/user#user-object-premium-types)
  /// on a user's account
  ///
  /// required OAuth2 scope: identify
  final int? premiumType;

  late final DiscordPremiumType? _premiumTypeAsEnum;

  /// the public [flags](https://discord.com/developers/docs/resources/user#user-object-user-flags)
  /// on a user's account
  ///
  /// required OAuth2 scope: identify
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

  List<DiscordUserFlag> get publicFlagsAsEnum =>
      _publicFlagsAsEnum ??= discordUserFlagsAsEnum(flags);

  factory DiscordUser.fromJson(Map<String, dynamic> json) => DiscordUser(
        id: DiscordSnowflake(json[idEntry] as String),
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
        member: json[memberEntry] != null
            ? DiscordGuildMember.fromJson(
                json[memberEntry] as Map<String, dynamic>,
              )
            : null,
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
    DiscordGuildMember? member,
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
