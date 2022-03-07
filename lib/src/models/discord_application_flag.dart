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

void _addFlagAsEnum(
  String r,
  int index,
  DiscordApplicationFlag flag,
  List<DiscordApplicationFlag> f,
) {
  if (r.length >= index + 1 && r.substring(index, index + 1) == '1') {
    f.add(flag);
  }
}

List<DiscordApplicationFlag> discordApplicationFlagsAsEnum(int? flags) {
  if (flags == null) {
    return <DiscordApplicationFlag>[];
  }
  final flagsAsEnum = <DiscordApplicationFlag>[];
  final radixString =
      String.fromCharCodes(flags.toRadixString(2).runes.toList().reversed);
  _addFlagAsEnum(
    radixString,
    12,
    DiscordApplicationFlag.gatewayPresence,
    flagsAsEnum,
  );
  _addFlagAsEnum(
    radixString,
    13,
    DiscordApplicationFlag.gatewayPresenceLimited,
    flagsAsEnum,
  );
  _addFlagAsEnum(
    radixString,
    14,
    DiscordApplicationFlag.gatewayGuildMembers,
    flagsAsEnum,
  );
  _addFlagAsEnum(
    radixString,
    15,
    DiscordApplicationFlag.gatewayGuildMembersLimited,
    flagsAsEnum,
  );
  _addFlagAsEnum(
    radixString,
    16,
    DiscordApplicationFlag.verificationPendingGuildLimit,
    flagsAsEnum,
  );
  _addFlagAsEnum(
    radixString,
    17,
    DiscordApplicationFlag.embedded,
    flagsAsEnum,
  );
  _addFlagAsEnum(
    radixString,
    18,
    DiscordApplicationFlag.gatewayMessageContent,
    flagsAsEnum,
  );
  _addFlagAsEnum(
    radixString,
    19,
    DiscordApplicationFlag.gatewayMessageContentLimited,
    flagsAsEnum,
  );
  return flagsAsEnum;
}
