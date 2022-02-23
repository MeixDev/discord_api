import 'discord_status.dart';

/// active sessions are indicated with an "online", "idle", or "dnd"
/// string per platform. If a user is offline or invisible, the
/// corresponding field is not present.
class DiscordClientStatus {
  /// the user's status set for an active desktop
  /// (Windows, Linux, Mac) application session
  ///
  /// is not always returned, hence the nullable property
  final String? desktop;

  late final DiscordStatus? _desktopAsEnum;

  /// the user's status set for an active mobile
  /// (iOS, Android) application session
  ///
  /// is not always returned, hence the nullable property
  final String? mobile;

  late final DiscordStatus? _mobileAsEnum;

  /// the user's status set for an active web
  /// (browser, bot account) application session
  ///
  /// is not always returned, hence the nullable property
  final String? web;

  late final DiscordStatus? _webAsEnum;

  static const desktopEntry = "desktop";
  static const mobileEntry = "mobile";
  static const webEntry = "web";

  DiscordClientStatus({
    this.desktop,
    this.mobile,
    this.web,
  });

  DiscordStatus? get desktopAsEnum {
    if (_desktopAsEnum == null) {
      if (desktop == null) {
        _desktopAsEnum ??= DiscordStatus.offline;
      }
      _desktopAsEnum ??=
          DiscordStatus.values.firstWhere((e) => e.name == desktop);
    }
    return _desktopAsEnum;
  }

  DiscordStatus? get mobileAsEnum {
    if (_mobileAsEnum == null) {
      if (mobile == null) {
        _mobileAsEnum ??= DiscordStatus.offline;
      }
      _mobileAsEnum ??=
          DiscordStatus.values.firstWhere((e) => e.name == mobile);
    }
    return _mobileAsEnum;
  }

  DiscordStatus? get webAsEnum {
    if (_webAsEnum == null) {
      if (web == null) {
        _webAsEnum ??= DiscordStatus.offline;
      }
      _webAsEnum ??= DiscordStatus.values.firstWhere((e) => e.name == web);
    }
    return _webAsEnum;
  }

  factory DiscordClientStatus.fromJson(Map<String, dynamic> json) =>
      DiscordClientStatus(
        desktop: json[desktopEntry] as String?,
        mobile: json[mobileEntry] as String?,
        web: json[webEntry] as String?,
      );
}
