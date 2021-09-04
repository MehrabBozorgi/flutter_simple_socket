import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  IO.Socket? socket;

  serverSocket() {
    socket = IO.io(
      'http://192.168.1.33:3000',
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );

    socket!.connect();
    socket!.onConnect((_) {
      print('connect');
      //با مقدار
      socket!.emit('send_data', "mehrab");
      //
      //
      //
      //بدون ارسال مقدار
      socket!.emit('sey_hello');
    });
    socket!.on(
      'data',
      (x) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('An Occurred'),
          content: Text(x),
          actions: [
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('send'),
          onPressed: () {
            serverSocket();
            print('id : ${socket!.id}');
          },
        ),
      ),
    );
  }
}
