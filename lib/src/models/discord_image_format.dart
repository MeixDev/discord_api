enum DiscordImageFormat {
  jpeg,
  png,
  webp,
  gif,
  lottie,
}

DiscordImageFormat discordImageFormatFromValue(String s) {
  return DiscordImageFormat.values
      .firstWhere((element) => element.fileExtension == s);
}

extension ToFileExtension on DiscordImageFormat {
  String get fileExtension {
    switch (this) {
      case DiscordImageFormat.jpeg:
        return 'jpg';
      case DiscordImageFormat.png:
        return 'png';
      case DiscordImageFormat.webp:
        return 'webp';
      case DiscordImageFormat.gif:
        return 'gif';
      case DiscordImageFormat.lottie:
        return 'json';
    }
  }
}
