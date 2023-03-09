import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallPage extends StatefulWidget {
  final String channelName;
  final String username;

  const VideoCallPage(
      {Key? key, required this.channelName, required this.username})
      : super(key: key);

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  late AgoraClient client;

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "457e3f501bba48279f5c31ac8a5b5f67",
          channelName: widget.channelName,
          username: widget.username),
    );
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.channelName),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
            ),
            AgoraVideoButtons(
              client: client,
              onDisconnect: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}