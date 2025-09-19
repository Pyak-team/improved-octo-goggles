
import 'dart:io';
import 'dart:typed_data';
import 'package:bencode/bencode.dart';
import 'package:http/http.dart' as http;

class TorrentEngine {
  final List<TorrentDownload> downloads = [];
  
  Future<void> addTorrent(String filePath) async {
    final file = File(filePath);
    final data = await file.readAsBytes();
    final torrent = decodeTorrentFile(data);
    
    final download = TorrentDownload(torrent);
    downloads.add(download);
    await download.start();
  }
}

class TorrentDownload {
  final TorrentInfo info;
  PeerConnection? peerConnection;
  
  TorrentDownload(this.info);
  
  Future<void> start() async {
    await connectToTracker();
    await connectToPeers();
  }
  
  Future<void> connectToTracker() async {
  }
}