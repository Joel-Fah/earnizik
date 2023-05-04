import 'package:cached_network_image/cached_network_image.dart';
import 'package:earnizik/models/music.dart';
import 'package:earnizik/ui/components/helper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remixicon/remixicon.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
      const HomeTab(),
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Remix.music_2_line,
              size: 50.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Rewards'),
          ],
        ),
      ),
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Remix.search_2_line,
              size: 50.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Search'),
          ],
        ),
      ),
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Remix.heart_3_line,
              size: 50.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Favorites'),
          ],
        ),
      ),
    ];

    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Remix.home_3_line),
        label: 'Home',
        activeIcon: Icon(Remix.home_3_fill),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Remix.music_2_line),
        label: 'Rewards',
        activeIcon: Icon(Remix.music_2_fill),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Remix.search_2_line),
        label: 'Search',
        activeIcon: Icon(Remix.home_3_fill),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Remix.heart_3_line),
        label: 'Favorites',
        activeIcon: Icon(Remix.heart_3_fill),
      ),
    ];
    assert(kTabPages.length == kBottomNavBarItems.length);

    final bottomNavBar = BottomNavigationBar(
      items: kBottomNavBarItems,
      currentIndex: _currentIndex,
      onTap: (value) => setState(() {
        _currentIndex = value;
      }),
      type: BottomNavigationBarType.fixed,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Welcome Joël',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Remix.notification_2_line,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      body: kTabPages[_currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.all(20.0),
      children: [
        Heading(
          title: 'Trending Artists',
          onPressed: () {},
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: musics.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(width: 5.0),
            itemBuilder: (context, index) {
              Music musicItem = musics[index];
              return CachedNetworkImage(
                imageUrl: musicItem.authorImage,
                placeholder: (context, url) => ClipPath(
                  clipper: PolygonClipper(),
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: LoadingAnimationWidget.threeRotatingDots(
                      color: const Color(0xFFF1E0D9),
                      size: 25.0,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => ClipPath(
                  clipper: PolygonClipper(),
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(
                      Remix.music_2_line,
                      size: 30,
                      color: Color(0xFFF1E0D9),
                    ),
                  ),
                ),
                imageBuilder: (context, imageProvider) {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipPath(
                      clipper: PolygonClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),
        Heading(
          title: 'Popular Songs',
          onPressed: () {},
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: ContextVariables.height(context) / 3.5,
          child: ListView.separated(
            itemCount: musics.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Music musicItem = musics[index];
              return MusicCard(
                musicItem: musicItem,
                errorIcon: IconlyBroken.star,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Heading(
          title: 'Trending Albums',
          onPressed: () {},
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: ContextVariables.height(context) / 3.5,
          child: ListView.separated(
            itemCount: musics.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Music musicItem = musics.reversed.toList()[index];
              return MusicCard(
                musicItem: musicItem,
                errorIcon: IconlyBroken.play,
                errorIconAngle: 0,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Heading(
          title: 'Popular Podcasts',
          onPressed: () {},
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: ContextVariables.height(context) / 3.5,
          child: ListView.separated(
            itemCount: musics.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Music musicItem = musics[index];
              return MusicCard(
                musicItem: musicItem,
                errorIcon: IconlyBroken.voice_2,
                errorIconAngle: 0,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.musicItem,
    this.errorIconAngle,
    required this.errorIcon,
  });

  final Music musicItem;
  final double? errorIconAngle;
  final IconData errorIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ContextVariables.width(context) / 2.3,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: musicItem.cover,
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Theme.of(context).primaryColor),
                  top: BorderSide(color: Theme.of(context).primaryColor),
                  right: BorderSide(color: Theme.of(context).primaryColor),
                )
              ),
              width: ContextVariables.width(context) / 2,
              height: ContextVariables.height(context) / 5.1,
              child: placeholder(context, url),
            ),
            errorWidget: (context, url, error) => Container(
              clipBehavior: Clip.hardEdge,
              width: ContextVariables.width(context) / 2,
              height: ContextVariables.height(context) / 5.1,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Transform.rotate(
                angle: errorIconAngle ?? 90 * math.pi / 180,
                child: Icon(
                  errorIcon,
                  color: const Color(0xFFF1E0D9),
                  size: 210.0,
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              width: ContextVariables.width(context) / 2,
              height: ContextVariables.height(context) / 5.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20.0)),
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
            child: ListTile(
              title: Text(
                musicItem.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(musicItem.authorName),
              trailing: musicItem.isLiked
                  ? Icon(
                      Remix.heart_3_fill,
                      color: Theme.of(context).primaryColor,
                      size: 30.0,
                    )
                  : const Icon(
                      Remix.heart_3_line,
                      size: 30.0,
                    ),
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     musicItem.isLiked
              //         ? Icon(
              //             Remix.heart_3_fill,
              //             color: Theme.of(context).primaryColor,
              //           )
              //         : const Icon(Remix.heart_3_line),
              //     Text(
              //       musicItem.type,
              //       style: TextStyle(
              //         color: Theme.of(context).primaryColor,
              //       ),
              //     )
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
              onPressed: onPressed, icon: const Icon(Remix.arrow_right_s_line))
        ],
      ),
    );
  }
}
