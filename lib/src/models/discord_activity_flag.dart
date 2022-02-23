enum DiscordActivityFlag {
  /// 1 << 0
  instance,

  /// 1 << 1
  join,

  /// 1 << 2
  spectate,

  /// 1 << 3
  joinRequest,

  /// 1 << 4
  sync,

  /// 1 << 5
  play,

  /// 1 << 6
  partyPrivacyFriends,

  /// 1 << 7
  partyPrivacyVoiceChannel,

  /// 1 << 8
  embedded,
}
