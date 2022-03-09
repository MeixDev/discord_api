import 'discord_welcome_screen_channel.dart';

class DiscordWelcomeScreen {
  /// the server description shown in the welcome screen
  ///
  /// can be null
  final String? description;

  /// the channels shown in the welcome screen, up to 5
  final List<DiscordWelcomeScreenChannel> welcomeChannels;

  static const descriptionEntry = 'description';
  static const welcomeChannelsEntry = 'welcome_channels';

  DiscordWelcomeScreen({
    this.description,
    required this.welcomeChannels,
  });

  factory DiscordWelcomeScreen.fromJson(Map<String, dynamic> json) =>
      DiscordWelcomeScreen(
        description: json[descriptionEntry] as String?,
        welcomeChannels: List<DiscordWelcomeScreenChannel>.from(
          (json[welcomeChannelsEntry] as List<Map<String, dynamic>>)
              .map(DiscordWelcomeScreen.fromJson),
        ),
      );
}
