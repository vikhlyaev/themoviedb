import 'package:flutter/material.dart';
import '../resources/resources.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MoviesSectionWidget(titleText: 'Popular Movies'),
        MoviesSectionWidget(titleText: 'New Movies'),
      ],
    );
  }
}

class MoviesSectionWidget extends StatelessWidget {
  final String titleText;
  const MoviesSectionWidget({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 303,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => MovieCardWidget(),
              separatorBuilder: (context, index) => SizedBox(width: 20),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Image(
            width: 175,
            height: 250,
            fit: BoxFit.cover,
            image: AssetImage(Images.poster),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Wonder Woman',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 5),
        Text(
          '16 Oct 2022',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
