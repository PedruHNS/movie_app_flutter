import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/core/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:movie_db/ui/core/widgets/card_movie_widget.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreen extends StatefulWidget {
  final HomeVm controller;
  const HomeScreen({super.key, required this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.controller.fetchPopularMovies();
    });
    widget.controller.disableBottomBar();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color(0xFF7100cd),
              ],
            ),
          ),
          child: Watch((_) {
            return Stack(
              children: [
                Ink(
                  child: Column(
                    children: [
                      Text(widget.controller.getTitlePage,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      Expanded(
                        child: widget.controller.getIsLoadingMovies
                            ? Center(child: CircularProgressIndicator())
                            : CustomScrollView(
                                controller: widget.controller.scrollController,
                                slivers: [
                                  SliverList.builder(
                                    itemCount:
                                        widget.controller.moviesList.length,
                                    itemBuilder: (context, index) {
                                      final movies =
                                          widget.controller.moviesList[index];

                                      return CardMovieWidget(
                                          imageUrl: movies.imagePoster(),
                                          title: movies.title,
                                          releaseDate: movies.releaseDate,
                                          onTap: () {
                                            context.push(Routes.details,
                                                extra: movies.id.toString());
                                          });
                                    },
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.controller.showBottomNav,
                  child: BottomNav(controller: widget.controller),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
