class TileData {
  final String _title;

  String get title => _title;
  final String _image;
  final String _time;
  final String _description;

  TileData({required title, required image, required time, required description})
      : _title = title,
        _image = image,
        _time = time,
        _description = description;

  static final staticTileData = [
    TileData(
        title: 'Dart for Beginners',
        image: 'assets/dart_course.png',
        time: '23 H 17 M',
        description: 'Beginner course focused on Dart basics.'),
    TileData(
      title: 'Clean UI Course',
      image: 'assets/ui.png',
      time: '18 H 29 M',
      description: 'Create beautiful user interfaces.',
    ),
  ];

  String get image => _image;

  String get time => _time;

  String get description => _description;
}
