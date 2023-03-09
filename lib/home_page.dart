import 'package:flutter/material.dart';

import 'call_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController channelName = TextEditingController();
  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Column(
                    children: [
                      TextFormField(
                        controller: channelName,
                        decoration:
                            const InputDecoration(labelText: "Channel Name"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: userName,
                        decoration:
                            const InputDecoration(labelText: "Username"),
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VideoCallPage(
                                        channelName: channelName.text,
                                        username: userName.text,
                                      )));
                        },
                        child: Text("Go"))
                  ],
                );
              });
        },
      ),
    );
  }
}
