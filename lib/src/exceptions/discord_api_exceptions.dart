class DiscordApiException implements Exception {
  final String message;

  const DiscordApiException(this.message);

  @override
  String toString() => 'DiscordException: $message';
}
