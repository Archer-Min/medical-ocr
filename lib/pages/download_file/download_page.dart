import 'dart:html';

import 'package:flutter/material.dart';

class DownloadProgressPage extends StatelessWidget {
  final Future<File> downloadFileFuture;

  const DownloadProgressPage({Key? key, required this.downloadFileFuture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloading...')),
      body: Center(
        child: FutureBuilder<File>(
          future: downloadFileFuture,
          builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Download failed');
              } else if (snapshot.hasData) {
                return Text('Download complete');
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
