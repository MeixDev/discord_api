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
