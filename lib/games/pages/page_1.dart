import 'package:car_mobile_course/games/models/games.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late Games? _currentGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Video Juegos"),
        ),
        body: ListView.builder(
            itemCount: games.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return ListTile(
                leading: Container(
                  width: 45,
                  height: 45,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Hero(
                    tag: games[index].image! + index.toString(),
                    child: Image.network(
                      games[index].image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(games[index].name!),
                onTap: () {
                  _currentGame = games[index];
                  Navigator.of(context).push(TransparentRoute(
                      builder: (_) => WidgetInsideModal(
                            game: _currentGame!,
                            index: index,
                          ),
                      settings: const RouteSettings()));
                },
              );
            }));
  }
}

class WidgetInsideModal extends StatelessWidget {
  const WidgetInsideModal({Key? key, required this.game, required this.index})
      : super(key: key);

  final Games game;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      backgroundColor: const Color.fromARGB(147, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: game.image! + index.toString(),
                child: Image.network(game.image!)),
            const SizedBox(height: 20),
            Text(
              game.name!,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    required RouteSettings settings,
  }) : super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => "";

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}
