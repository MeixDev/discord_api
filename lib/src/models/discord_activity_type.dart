/// Enum of Activity Types
///
/// The streaming type currently only supports Twitch and YouTube.
/// Only `https://twitch.tv/` and `https://www.youtube.com/` urls will work.
enum DiscordActivityType {
  /// ID: 0
  /// Name: Game
  /// Format: Playing {name}
  /// Example: "Playing Rocket League"
  game,

  /// ID: 1
  /// Name: Streaming
  /// Format: Streaming {details}
  /// Example: "Streaming Rocket League"
  streaming,

  /// ID: 2
  /// Name: Listening
  /// Format: Listening to {name}
  /// Example: "Listening to Spotify"
  listening,

  /// ID: 3
  /// Name: Watching
  /// Format: Watching {name}
  /// Example: "Watching YouTube Together"
  watching,

  /// ID: 4
  /// Name: Custom
  /// Format: {emoji} {name}
  /// Example: ":smiley: I am cool"
  custom,

  /// ID: 5
  /// Name: Competing
  /// Format: Competing in {name}
  /// Example: "Competing in Arena World Champions"
  competing,
}
