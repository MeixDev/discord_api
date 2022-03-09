# discord_api
_____

[![Dart](https://github.com/MeixDev/discord_api_flutter/actions/workflows/dart.yml/badge.svg)](https://github.com/MeixDev/discord_api_flutter/actions/workflows/dart.yml)
[![Pub](https://img.shields.io/pub/v/discord_api?color=blue&logo=dart)](https://pub.dev/packages/discord_api)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

A wrapper in pure Dart to connect to Discord using OAuth2.

All the endpoints and objects are implemented as defined in the [Discord API Reference](https://discord.com/developers/docs/reference)

## Getting Started

_____

**NOTE: This package is still in its early stage. While all models are supposedly implemented, they're not fully tested and all endpoints aren't implemented. Please do not hesitate to open a merge request if you added support for a specific endpoint !**

**This release isn't fully tested yet. Future releases will only happen once the currently available endpoints are fully-tested. Feel free to [open an issue](https://github.com/TesteurManiak/discord_api_flutter/issues) to make suggestions regarding which endpoints should be added in priority, depending on your needs.**

To use this package, you will need to register an application on the [Discord developer console](https://discord.com/developers/applications) to get a client ID and a client Secret.

After registering your application, you will need to instantiate the `DiscordClient` class from the package, with your `clientId`, `clientSecret` and your `redirectUri`.

You will also need to pass a `DiscordHttpClient` to it. You can either implement your own, or use the provided `DiscordDioProvider`. (Do note that this class will later be moved to its own package in order to remove the `dio` dependency on this package)

```dart
  final _discordClient = DiscordClient(
    clientId: clientId,
    clientSecret: clientSecret,
    redirectUri: redirectUri,
    discordHttpClient:
        DiscordDioProvider(clientId: clientId, clientSecret: clientSecret),
  );
```

Now that you initialized the client, the last step before using the endpoints wrappers will be to manage the first connection with your Discord application, and initialize the Tokens you'll receive. 

You can find a complete example of this in the [example](https://github.com/MeixDev/discord_api_flutter/blob/main/example/lib/main.dart), using the package [flutter_webview_plugin](https://pub.dev/packages/flutter_webview_plugin). 

You can also use url_launcher with deep linking, use an external window in web as described in [this article](https://itnext.io/flutter-web-oauth-authentication-through-external-window-d890a7ff6463) by my friend [TesteurManiak](https://github.com/TesteurManiak), or any other method that you fancy depending on your targeted systems.

## Supported Endpoints

**Note**: While theorically functional (and proven to be in human tests for most), those endpoints haven't yet been unitary tested.
_____

### User

* [x] Get Current User
* [x] Get User
* [x] Modify Current User
* [x] Get Current User Guilds
* [x] Get Current User Guild Member
* [x] Leave Guild
* [x] Create DM
* [ ] Create Group DM
* [x] Get Current User Connections

### Guild

* [x] Get Guild
* [x] Get Guild Preview
* [ ] Modify Guild
* [ ] Delete Guild
* [ ] Create Guild Channel
* [ ] Modify Guild Channel Positions
* [ ] List Active Threads
* [ ] Get Guild Member
* [ ] List Guild Members
* [ ] Search Guild Members
* [ ] Add Guild Member 
* [ ] List Guild Members
* [ ] Search Guild Members
* [ ] Add Guild Member
* [ ] Modify Guild Member
* [ ] Modify Current Member
* [ ] Modify Current User Nick
* [ ] Add Guild Member Role
* [ ] Remove Guild Member Role
* [ ] Remove Guild Member
* [ ] Get Guild Bans
* [ ] Get Guild Ban
* [ ] Create Guild Ban
* [ ] Remove Guild Ban
* [ ] Get Guild Roles
* [ ] Create Guild Role
* [ ] Modify Guild Role Positions
* [ ] Modify Guild Role
* [ ] Delete Guild Role
* [ ] Get Guild Prune Count
* [ ] Begin Guild Prune
* [ ] Get Guild Voice Regions
* [ ] Get Guild Invites
* [ ] Get Guild Integrations
* [ ] Delete Guild Integration
* [ ] Get Guild Widget Settings
* [ ] Modify Guild Widget
* [ ] Get Guild Widget
* [ ] Get Guild Vanity URL
* [ ] Get Guild Widget Image
* [ ] Get Guild Welcome Screen
* [ ] Modify Guild Welcome Screen
* [ ] Modify Current User Voice State
* [ ] Modify User Voice State

### Emoji

* [ ] List Guild Emojis
* [ ] Get Guild Emoji
* [ ] Create Guild Emoji
* [ ] Modify Guild Emoji
* [ ] Delete Guild Emoji

### Channel

* [ ] Get Channel
* [ ] Modify Channel
* [ ] Delete/Close Channel
* [ ] Get Channel Messages
* [ ] Get Channel Message
* [ ] Create Message
* [ ] Crosspost Message
* [ ] Create Reaction
* [ ] Delete Own Reaction
* [ ] Delete User Reaction
* [ ] Get Reactions
* [ ] Delete All Reactions
* [ ] Delete All Reactions for Emoji
* [ ] Edit Message
* [ ] Delete Message
* [ ] Bulk Delete Messages
* [ ] Edit Channel Permissions
* [ ] Get Channel Invites
* [ ] Create Channel Invite
* [ ] Delete Channel Permission
* [ ] Follow News Channel
* [ ] Trigger Typing Indicator
* [ ] Get Pinned Messages
* [ ] Pin Message
* [ ] Unpin Message
* [ ] Group DM Add Recipient
* [ ] Group DM Remove Recipient
* [ ] Start Thread with Message
* [ ] Start Thread without Message
* [ ] Join Thread
* [ ] Add Thread Member
* [ ] Leave Thread
* [ ] Remove Thread Member
* [ ] Get Thread Member
* [ ] List Thread Members
* [ ] List Active Threads
* [ ] List Public Archived Threads
* [ ] List Private Archived Threads
* [ ] List Joined Private Archive Threads

### Audit Logs

* [ ] Get Guild Audit Log

### Guild Scheduled Event

* [ ] List Scheduled Events for Guild
* [ ] Create Guild Scheduled Event
* [ ] Get Guild Scheduled Event
* [ ] Modify Guild Scheduled Event
* [ ] Delete Guild Scheduled Event
* [ ] Get Guild Scheduled Event Users
* [ ] Guild Scheduled Event Status Update Automation
* [ ] Guild Scheduled Event Permissions Requirements

### Guild Template

* [ ] Get Guild Template
* [ ] Create Guild from Guild Template
* [ ] Get Guild Templates
* [ ] Create Guild Template
* [ ] Sync Guild Template
* [ ] Modify Guild Template
* [ ] Delete Guild Template

### Invite

* [ ] Get Invite
* [ ] Delete Invite

### Stage Instance

* [ ] Create Stage Instance
* [ ] Get Stage Instance
* [ ] Modify Stage Instance
* [ ] Delete Stage Instance

### Sticker

* [ ] Get Sticker
* [ ] List Nitro Sticker Packs
* [ ] List Guild Stickers
* [ ] Get Guild Sticker
* [ ] Create Guild Sticker
* [ ] Modify Guild Sticker
* [ ] Delete Guild Sticker

### Voice

* [ ] List Voice Regions

### Webhook

* [ ] Create Webhook
* [ ] Get Channel Webhooks
* [ ] Get Guild Webhooks
* [ ] Get Webhook
* [ ] Get Webhook with Token
* [ ] Modify Webhook
* [ ] Modify Webhook with Token
* [ ] Delete Webhook
* [ ] Delete Webhook with Token
* [ ] Execute Webhook
* [ ] Execute Slack-Compatible Webhook
* [ ] Execute GitHub-Compatible Webhook
* [ ] Get Webhook Message
* [ ] Edit Webhook Message
* [ ] Delete Webhook Message

### OAuth2

* [ ] Get Current Bot Application Information
* [ ] Get Current Authorization Information

