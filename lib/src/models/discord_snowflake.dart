class DiscordSnowflake {
  final int timestamp;
  late final DateTime? _timestampAsDateTime;

  final int workerId;
  final int processId;
  final int increment;

  final String snowflake;

  DiscordSnowflake(this.snowflake)
      : timestamp = (int.parse(snowflake) >> 22) + 1420070400000,
        workerId = (int.parse(snowflake) & 0x3E0000) >> 17,
        processId = (int.parse(snowflake) & 0x1F000) >> 12,
        increment = int.parse(snowflake) & 0xFFF;

  DateTime get timestampAsDateTime =>
      _timestampAsDateTime ??= DateTime.fromMillisecondsSinceEpoch(timestamp);
}
