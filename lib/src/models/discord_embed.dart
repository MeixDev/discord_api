class DiscordEmbed {
  final String? title;
  final String? type;
  final String? description;
  final String? url;
  final String? timestamp;
  late final DateTime? _timestampAsDateTime;
  final int? color;
  final DiscordEmbedFooter? footer;
  final DiscordEmbedImage? image;
  final DiscordEmbedThumbnail? thumbnail;
  final DiscordEmbedVideo? video;
  final DiscordEmbedProvider? provider;
  final DiscordEmbedAuthor? author;
  final List<DiscordEmbedField>? fields;
}

enum DiscordEmbedType {
  rich,
  image,
  video,
  gifv,
  article,
  link,
}

class DiscordEmbedFooter {
  final String? text;
  final String? iconUrl;
  final String? proxyIconUrl;

  static const textEntry = 'text';
  static const iconUrlEntry = 'icon_url';
  static const proxyIconUrlEntry = 'proxy_icon_url';

  DiscordEmbedFooter({
    this.text,
    this.iconUrl,
    this.proxyIconUrl,
  });

  factory DiscordEmbedFooter.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedFooter(
        text: json[textEntry] as String?,
        iconUrl: json[iconUrlEntry] as String?,
        proxyIconUrl: json[proxyIconUrlEntry] as String?,
      );
}

class DiscordEmbedImage {
  final String url;
  final String? proxyUrl;
  final int? height;
  final int? width;

  static const urlEntry = 'url';
  static const proxyUrlEntry = 'proxy_url';
  static const heightEntry = 'height';
  static const widthEntry = 'width';

  DiscordEmbedImage({
    required this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  factory DiscordEmbedImage.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedImage(
        url: json[urlEntry] as String,
        proxyUrl: json[proxyUrlEntry] as String?,
        height: json[heightEntry] as int?,
        width: json[widthEntry] as int?,
      );
}

class DiscordEmbedThumbnail {
  final String url;
  final String? proxyUrl;
  final int? height;
  final int? width;

  static const urlEntry = 'url';
  static const proxyUrlEntry = 'proxy_url';
  static const heightEntry = 'height';
  static const widthEntry = 'width';

  DiscordEmbedThumbnail({
    required this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  factory DiscordEmbedThumbnail.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedThumbnail(
        url: json[urlEntry] as String,
        proxyUrl: json[proxyUrlEntry] as String?,
        height: json[heightEntry] as int?,
        width: json[widthEntry] as int?,
      );
}

class DiscordEmbedVideo {
  final String url;
  final String? proxyUrl;
  final int? height;
  final int? width;

  static const urlEntry = 'url';
  static const proxyUrlEntry = 'proxy_url';
  static const heightEntry = 'height';
  static const widthEntry = 'width';

  DiscordEmbedVideo({
    required this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  factory DiscordEmbedVideo.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedVideo(
        url: json[urlEntry] as String,
        proxyUrl: json[proxyUrlEntry] as String?,
        height: json[heightEntry] as int?,
        width: json[widthEntry] as int?,
      );
}

class DiscordEmbedProvider {
  final String? name;
  final String? url;

  static const nameEntry = 'name';
  static const urlEntry = 'url';

  DiscordEmbedProvider({
    this.name,
    this.url,
  });

  factory DiscordEmbedProvider.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedProvider(
        name: json[nameEntry] as String?,
        url: json[urlEntry] as String?,
      );
}

class DiscordEmbedAuthor {
  final String name;
  final String? url;
  final String? iconUrl;
  final String? proxyIconUrl;

  static const nameEntry = 'name';
  static const urlEntry = 'url';
  static const iconUrlEntry = 'icon_url';
  static const proxyIconUrlEntry = 'proxy_icon_url';

  DiscordEmbedAuthor({
    required this.name,
    this.url,
    this.iconUrl,
    this.proxyIconUrl,
  });

  factory DiscordEmbedAuthor.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedAuthor(
        name: json[nameEntry] as String,
        url: json[urlEntry] as String?,
        iconUrl: json[iconUrlEntry] as String?,
        proxyIconUrl: json[proxyIconUrlEntry] as String?,
      );
}

class DiscordEmbedField {
  final String name;
  final String value;
  final bool? inline;

  static const nameEntry = 'name';
  static const valueEntry = 'value';
  static const inlineEntry = 'inline';

  DiscordEmbedField({
    required this.name,
    required this.value,
    this.inline,
  });

  factory DiscordEmbedField.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedField(
        name: json[nameEntry] as String,
        value: json[valueEntry] as String,
        inline: json[inlineEntry] as bool?,
      );
}
