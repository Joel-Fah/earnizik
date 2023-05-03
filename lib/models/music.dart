import 'dart:math';

class Music {
  int id;
  String authorImage;
  String cover;
  String title;
  String authorName;
  String type;
  bool isLiked;
  int playCount;

  Music({
    required this.id,
    required this.authorImage,
    required this.cover,
    required this.title,
    required this.authorName,
    required this.type,
    required this.isLiked,
    required this.playCount,
  });
}

int musicId = 1;
Random random = Random();
int minCount = 100;
int maxCount = 1000;

List<String> authorImages = [
  'https://images.pexels.com/photos/3586798/pexels-photo-3586798.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/4355346/pexels-photo-4355346.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/1840608/pexels-photo-1840608.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/3220360/pexels-photo-3220360.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/1982852/pexels-photo-1982852.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/3310695/pexels-photo-3310695.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/2846602/pexels-photo-2846602.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/3283568/pexels-photo-3283568.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/2530775/pexels-photo-2530775.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/4890733/pexels-photo-4890733.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/2728264/pexels-photo-2728264.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/837358/pexels-photo-837358.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/5397723/pexels-photo-5397723.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/4662950/pexels-photo-4662950.jpeg?auto=compress&cs=tinysrgb&w=400',
  'https://images.pexels.com/photos/3533228/pexels-photo-3533228.png?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/4993292/pexels-photo-4993292.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/2083751/pexels-photo-2083751.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3063478/pexels-photo-3063478.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1874866/pexels-photo-1874866.jpeg?auto=compress&cs=tinysrgb&w=600',
];
List<String> covers = [
  'https://images.pexels.com/photos/7645271/pexels-photo-7645271.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1677710/pexels-photo-1677710.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/9264012/pexels-photo-9264012.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1646311/pexels-photo-1646311.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/268941/pexels-photo-268941.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3078831/pexels-photo-3078831.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3509970/pexels-photo-3509970.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1719627/pexels-photo-1719627.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/4200745/pexels-photo-4200745.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/4906238/pexels-photo-4906238.jpeg?auto=compress&cs=tinysrgb&w=600',
];
List<String> titles = [];
List<String> authors = [];
List<String> types = ['album', 'song',];
List<bool> isLiked = [true, false];
List<int> playCounts = List.generate(authorImages.length, (index) => minCount + random.nextInt(maxCount + 1) - minCount);

List<Music> musics = List.generate(
  authorImages.length,
  (index) => Music(
    id: index + 1,
    authorImage: authorImages[index],
    cover: covers[random.nextInt(covers.length)],
    title: 'Title $index',
    authorName: authors[index],
    type: types[random.nextInt(types.length)],
    isLiked: isLiked[random.nextInt(isLiked.length)],
    playCount: playCounts[random.nextInt(playCounts.length)],
  ),
);
