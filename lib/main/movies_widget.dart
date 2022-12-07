import 'package:flutter/material.dart';
import 'package:themoviedb/theme/user_colors.dart';
import '../resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String premiereDate;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.premiereDate,
  });
}

class MoviesWidget extends StatefulWidget {
  const MoviesWidget({super.key});

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  final _popularMovies = [
    Movie(
      id: 1,
      imageName: Images.poster,
      title: 'Wonder Woman',
      premiereDate: '16 Oct 2021',
    ),
    Movie(
      id: 2,
      imageName: Images.poster,
      title: 'Wonder Woman 2',
      premiereDate: '17 Nov 2022',
    ),
    Movie(
      id: 3,
      imageName: Images.poster,
      title: 'Duna',
      premiereDate: '1 Jun 2021',
    ),
    Movie(
      id: 4,
      imageName: Images.poster,
      title: 'Home Alone',
      premiereDate: '7 Dec 1992',
    ),
  ];

  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    setState(() {
      if (query.isNotEmpty) {
        _filteredMovies = _popularMovies.where((movie) {
          return movie.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      } else {
        _filteredMovies = _popularMovies;
      }
    });
  }

  void _onMovieTap(int index) {
    final id = _filteredMovies[index].id;
    Navigator.of(context).pushNamed(
      '/main/details',
      arguments: id,
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _popularMovies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Movies',
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 303,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = _filteredMovies[index];
                        return SizedBox(
                          width: 175,
                          height: 303,
                          child: GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image(
                                    width: 175,
                                    height: 250,
                                    fit: BoxFit.cover,
                                    image: AssetImage(movie.imageName),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  movie.title,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.premiereDate,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            onTap: () => _onMovieTap(index),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                filled: true,
                fillColor: UserColors.backgroundColor.withAlpha(235),
                hintText: 'Search...'),
          ),
        ),
      ],
    );
  }
}
