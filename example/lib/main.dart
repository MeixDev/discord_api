import 'package:flutter/material.dart';
import 'package:discord_api/discord_api.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'webview_page.dart';

const clientId = 'CLIENT_ID';
const clientSecret = 'CLIENT_SECRET';
const redirectUri = 'http://localhost:8080/callback';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discord API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Discord API Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _discordClient = DiscordClient(
    clientId: clientId,
    clientSecret: clientSecret,
    redirectUri: redirectUri,
    discordHttpClient:
        DiscordDioProvider(clientId: clientId, clientSecret: clientSecret),
  );

  final _flutterWebviewPlugin = FlutterWebviewPlugin();

  void _urlListener(String url) {
    if (url.startsWith(redirectUri)) {
      final code = Uri.parse(url).queryParameters['code'];
      if (code != null) {
        _discordClient.getAccessToken(code).then((token) {
          _flutterWebviewPlugin.close();
          setState(() {});
        });
      }
    }
  }

  Future<DiscordToken?> _openConnectionPage(
      {List<DiscordApiScope> scopes = const []}) {
    _flutterWebviewPlugin.onUrlChanged.listen(_urlListener);
    _flutterWebviewPlugin.onDestroy.listen((_) => Navigator.pop(context));

    final url = _discordClient.authorizeUri(scopes);

    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPage(url.toString()),
      ),
    ).then((_) {
      if (_discordClient.discordHttpClient.discordToken != null) {
        debugPrint(
            "TOKEN: ${_discordClient.discordHttpClient.discordToken?.accessToken}");
        return _discordClient.discordHttpClient.discordToken;
      }
      return null;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.scheduleFrameCallback((timeStamp) {
      _openConnectionPage(
        scopes: [
          DiscordApiScope.identify,
          DiscordApiScope.email,
          DiscordApiScope.guilds
        ],
      ).then((value) => setState(() {}));
    });
  }

  void _displayDataAlert({
    String? method,
    String? data,
    bool isImg = false,
    bool? isOnline,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(method ?? ''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isOnline != null)
                Text(
                  isOnline ? 'Online' : 'Offline',
                  style: TextStyle(
                    color: isOnline ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (!isImg && data != null) Text(data),
              if (isImg && data != null)
                Image.network(
                  data,
                  loadingBuilder: (_, __, ___) =>
                      const CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          // Text(
          //   'Welcome user: ${_discordClient.discordHttpClient.discordToken?.userId}',
          // ),
          Text(
            'Your Discord access token is: ${_discordClient.discordHttpClient.discordToken?.accessToken}',
          ),
          ElevatedButton(
            onPressed: () async {
              final user = await _discordClient.getCurrentUser();
              _displayDataAlert(
                method: 'getCurrentUser',
                data: user.toString(),
              );
            },
            child: const Text('Get Me'),
          ),
        ],
      ),
    );
  }
}
