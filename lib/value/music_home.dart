import 'package:music_flutter_app/models/music_model.dart';

List<Songs> music_home = [
  {
    'audio':
        "https://res.cloudinary.com/dzusurwpd/video/upload/v1631775272/Avicii_-_Wake_Me_Up_Official_Video_cetqvo.mp3",
    'song': 'Wake me up',
    'singer': 'Avicii',
    'img':
        'https://res.cloudinary.com/dzusurwpd/image/upload/v1632192422/avicii-wake-me-up-video-650-430_vlszdz.jpg'
  },
  {
    'audio':
        "https://res.cloudinary.com/dzusurwpd/video/upload/v1631804423/Enrique_Iglesias_-_Bailando_ft._Descemer_Bueno_Gente_De_Zona_Espa%C3%B1ol_vwiitw.mp3",
    'song': 'Bailando',
    'singer': 'Long name',
    'img':
        'https://res.cloudinary.com/dzusurwpd/image/upload/v1632192675/enrique-iglesias-bailando-tunnel_hzofhj.jpg'
  },
  {
    'audio':
        "https://res.cloudinary.com/dzusurwpd/video/upload/v1632192747/Gym_Class_Heroes-_Stereo_Hearts_ft._Adam_Levine_OFFICIAL_VIDEO_lwl7dc.mp3",
    'song': 'Stereo Hearts',
    'singer': 'Gym class Heroes',
    'img':
        'https://res.cloudinary.com/dzusurwpd/image/upload/v1632192746/maxresdefault_3_lg7mc1.jpg'
  },
  {
    'audio':
        "https://res.cloudinary.com/dzusurwpd/video/upload/v1632192607/Ed_Sheeran_-_Shape_of_You_Official_Music_Video_pryajo.mp3",
    'song': 'Shape of you',
    'singer': 'Ed Sheeran',
    'img':
        'https://res.cloudinary.com/dzusurwpd/image/upload/v1632192606/image1-19_itfnz8.jpg'
  },
  {
    'audio':
        "https://res.cloudinary.com/dzusurwpd/video/upload/v1632192395/Alan_Walker_-_Diamond_Heart_feat._Sophia_Somajo_yt1u4u.mp3",
    'song': 'Diamond Heart',
    'singer': 'Alan Walker',
    'img':
        'https://res.cloudinary.com/dzusurwpd/image/upload/v1632192394/maxresdefault_pgvvk4.jpg'
  },
].map<Songs>((e) => Songs.fromJson(e)).toList();
