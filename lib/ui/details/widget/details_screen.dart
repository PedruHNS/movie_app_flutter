import 'package:flutter/material.dart';
import 'package:movie_db/ui/details/view_model/details_vm.dart';
import 'package:signals/signals_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  final DetailsVm _controller;

  const DetailsScreen(
      {super.key, required this.id, required DetailsVm controller})
      : _controller = controller;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget._controller.getMovieById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Watch((context) {
        return Container(
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
          child: widget._controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Watch((context) {
                  return widget._controller.movie != null
                      ? CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.5),
                                          BlendMode.dstATop,
                                        ),
                                        image: NetworkImage(widget
                                            ._controller.movie!
                                            .imageBackdrop()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        )
                      : Center(child: Text(widget._controller.message.value));
                }),
        );
      }),
    );
  }
}
