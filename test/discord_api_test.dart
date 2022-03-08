import 'package:discord_api/src/discord_cdn_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final cdn = DiscordCdnHelper.instance;

  group('DiscordCdnHelper tests', () {
    test("Get 131492741409538048's Avatar in size 64", () {
      final value = cdn.getUserAvatar(
          userId: "131492741409538048",
          userAvatarHash: "64d4f5dfcb00059794c20f656cb19c2b",
          size: 64);
      expect(value, isNotNull);
      expect(value,
          "https://cdn.discordapp.com/avatars/131492741409538048/64d4f5dfcb00059794c20f656cb19c2b.png?size=64");
    });
  });
}
