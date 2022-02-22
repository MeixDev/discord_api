enum DiscordMessageFlag {
  /// 1 << 0
  crossposted,

  /// 1 << 1
  isCrosspost,

  /// 1 << 2
  suppressEmbeds,

  /// 1 << 3
  sourceMessageDeleted,

  /// 1 << 4
  urgent,

  /// 1 << 5
  hasThread,

  /// 1 << 6
  ephemeral,

  /// 1 << 7
  loading,

  /// 1 << 8
  failedToMentionSomeRolesInThread,
}
