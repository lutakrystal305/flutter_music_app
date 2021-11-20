class Songs {
  String? id;
  String? song;
  String? singer;
  String? audio;
  String? img;

  Songs({this.id, this.song, this.singer, this.audio, this.img});

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    song = json['song'];
    singer = json['singer'];
    audio = json['audio'];
    img = json['img'];
  }
}
