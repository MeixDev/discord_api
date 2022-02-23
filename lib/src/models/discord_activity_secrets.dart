class DiscordActivitySecrets {
  /// the secret for joining a party
  ///
  /// is not always returned, hence the nullable property
  final String? join;

  /// the secret for spectating a game
  ///
  /// is not always returned, hence the nullable property
  final String? spectate;

  /// the secret for a specific instanced match
  ///
  /// is not always returned, hence the nullable property
  final String? match;

  static const joinEntry = 'join';
  static const spectateEntry = 'spectate';
  static const matchEntry = 'match';

  DiscordActivitySecrets({
    this.join,
    this.spectate,
    this.match,
  });

  factory DiscordActivitySecrets.fromJson(Map<String, dynamic> json) =>
      DiscordActivitySecrets(
        join: json[joinEntry] as String?,
        spectate: json[spectateEntry] as String?,
        match: json[matchEntry] as String?,
      );
}
