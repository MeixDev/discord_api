enum DiscordUserFlag {
  /// 0
  none,

  /// 1 << 0
  staff,

  /// 1 << 1
  partner,

  /// 1 << 2
  hypesquad,

  /// 1 << 3
  bugHunterLevel1,

  /// 1 << 6
  hypesquadOnlineHouse1,

  /// 1 << 7
  hypesquadOnlineHouse2,

  /// 1 << 8
  hypesquadOnlineHouse3,

  /// 1 << 9
  premiumEarlySupporter,

  /// 1 << 10
  teamPseudoUser,

  /// 1 << 14
  bugHunterLevel2,

  /// 1 << 16
  verifiedBot,

  /// 1 << 17
  verifiedDeveloper,

  /// 1 << 18
  certifiedModerator,

  /// 1 << 19
  botHttpInteractions,
}

void _addPublicFlagAsEnum(
  String r,
  int index,
  DiscordUserFlag flag,
  List<DiscordUserFlag> f,
) {
  if (r.length >= index + 1 && r.substring(index, index + 1) == '1') {
    f.add(flag);
  }
}

List<DiscordUserFlag> discordUserFlagsAsEnum(int? flags) {
  if (flags == null || flags == 0) {
    return [DiscordUserFlag.none];
  }
  final f = <DiscordUserFlag>[];
  final radixString =
      String.fromCharCodes(flags.toRadixString(2).runes.toList().reversed);
  _addPublicFlagAsEnum(
    radixString,
    0,
    DiscordUserFlag.staff,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    1,
    DiscordUserFlag.partner,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    2,
    DiscordUserFlag.hypesquad,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    3,
    DiscordUserFlag.bugHunterLevel1,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    6,
    DiscordUserFlag.hypesquadOnlineHouse1,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    7,
    DiscordUserFlag.hypesquadOnlineHouse2,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    8,
    DiscordUserFlag.hypesquadOnlineHouse3,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    9,
    DiscordUserFlag.premiumEarlySupporter,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    10,
    DiscordUserFlag.teamPseudoUser,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    14,
    DiscordUserFlag.bugHunterLevel2,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    16,
    DiscordUserFlag.verifiedBot,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    17,
    DiscordUserFlag.verifiedDeveloper,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    18,
    DiscordUserFlag.certifiedModerator,
    f,
  );
  _addPublicFlagAsEnum(
    radixString,
    19,
    DiscordUserFlag.botHttpInteractions,
    f,
  );
  return f;
}
