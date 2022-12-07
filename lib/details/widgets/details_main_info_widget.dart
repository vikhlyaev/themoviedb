import 'package:flutter/material.dart';
import 'package:themoviedb/details/widgets/radial_percent_widget.dart';
import 'package:themoviedb/theme/user_colors.dart';
import '../../resources/resources.dart';

class DetailsMainInfoWidget extends StatelessWidget {
  const DetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPostersWidget(),
        _MovieNameWidget(),
        _SummaryWidget(
          rating: 'PG-13',
          premiereDate: '06/02/2017 (US)',
          genres: 'Action, Adventure, Fantasy',
          duration: '2h 21m',
        ),
        _ScoreAndButtonWidget(),
        _OverviewWidget(),
        _CastWidget(),
      ],
    );
  }
}

class _TopPostersWidget extends StatelessWidget {
  const _TopPostersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage(Images.backdrop),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      UserColors.backgroundColor.withAlpha(0),
                      UserColors.backgroundColor,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(top: 100, bottom: 32),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 4),
                  spreadRadius: 2,
                  blurRadius: 16,
                  color: Color.fromRGBO(0, 0, 0, 0.45),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(Images.poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      child: Text(
        'Wonder Woman 2',
        style: Theme.of(context).textTheme.displayMedium,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  final String rating;
  final String premiereDate;
  final String genres;
  final String duration;

  const _SummaryWidget({
    super.key,
    required this.rating,
    required this.premiereDate,
    required this.genres,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
      child: Text(
        '$rating • $premiereDate •\n $genres • $duration',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _ScoreAndButtonWidget extends StatelessWidget {
  const _ScoreAndButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: RadialPercentWidget(
                    percent: 0.72,
                    backgroundColor: UserColors.backgroundColor,
                    filledColor: UserColors.accentColor,
                    lineColor: UserColors.lightAccentColor,
                    lineWidth: 4,
                    lineMargin: 0,
                    child: Text('72%'),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('User score'),
                ),
              ],
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow),
                  Text(' Watch Trailer'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 8),
          Text(
              'An Amazon princess comes to the world of Man in the grips of the First World War to confront the forces of evil and bring an end to human conflict.'),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              _CreatorCardWidget(
                name: 'Allan Heinberg',
                role: 'Screenplay, Story',
              ),
              _CreatorCardWidget(
                name: 'Zack Snyder',
                role: 'Story',
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              _CreatorCardWidget(
                name: 'Patty Jenkins',
                role: 'Director',
              ),
              _CreatorCardWidget(
                name: 'Geoff Johns',
                role: 'Screenplay',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CastWidget extends StatelessWidget {
  const _CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(Images.actor),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Gal Gadot',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Wonder Woman',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: 16,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CreatorCardWidget extends StatelessWidget {
  final String name;
  final String role;

  const _CreatorCardWidget({
    Key? key,
    required this.name,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            role,
            style: TextStyle(color: Colors.white30),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
