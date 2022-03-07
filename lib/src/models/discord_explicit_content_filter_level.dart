enum DiscordExplicitContentFilterLevel {
  /// media content will not be scanned
  disabled,

  /// media content sent by members without roles will be scanned
  membersWithoutRoles,

  /// media content sent by all members will be scanned
  allMembers,
}
