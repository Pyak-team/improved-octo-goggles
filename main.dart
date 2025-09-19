import 'package:flutter/material.dart';
import 'torrent_engine.dart';

void main() => runApp(TorrentClientApp());

class TorrentClientApp extends StatelessWidget {
  final TorrentEngine engine = TorrentEngine();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Torrent Client',
      theme: ThemeData.dark(),
      home: HomeScreen(engine: engine),
    );  
  }
}

class HomeScreen extends StatefulWidget {
  final TorrentEngine engine;
  
  HomeScreen({required this.engine});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Torrent Client')),
      body: Column(
        children: [
          _buildAddButton(),
          _buildDownloadsList(),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton(
      onPressed: _addTorrent,
      child: Text('Добавить торрент'),
    );
  }

  Widget _buildDownloadsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.engine.downloads.length,
        itemBuilder: (context, index) {
          final download = widget.engine.downloads[index];
          return ListTile(
            title: Text(download.info.name),
            subtitle: LinearProgressIndicator(value: 0.5),
            trailing: Text('500 KB/s'),
          );
        },
      ),
    );
  }

  void _addTorrent() async {
  }
}