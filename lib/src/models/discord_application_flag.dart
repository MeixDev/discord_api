enum DiscordApplicationFlag {
  /// 1 << 12
  gatewayPresence,

  /// 1 << 13
  gatewayPresenceLimited,

  /// 1 << 14
  gatewayGuildMembers,

  /// 1 << 15
  gatewayGuildMembersLimited,

  /// 1 << 16
  verificationPendingGuildLimit,

  /// 1 << 17
  embedded,

  /// 1 << 18
  gatewayMessageContent,

  /// 1 << 19
  gatewayMessageContentLimited,
}
