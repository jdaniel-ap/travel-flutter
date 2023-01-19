import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveler/models/destination.dart';
import 'package:traveler/screens/destination_screes.dart';

class DestinationCarrousel extends StatelessWidget {
  const DestinationCarrousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top destinations',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18.0,
                  letterSpacing: 0.5,
                ),
              )
            ],
          ),
        ),
        Container(
            height: 320.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: ((context, index) {
                  Destination destination = destinations[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DestinationScreen(
                            destination: destination,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 15.0,
                      ),
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                          bottom: 10.0,
                          child: Container(
                            height: 120.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Text(
                                        '${destination.activities.length} activities',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      destination.description,
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 0.2),
                                      blurRadius: 0.6),
                                ]),
                            child: Stack(children: [
                              Hero(
                                tag: destination.imageUrl,
                                child: Image(
                                  width: 180.0,
                                  height: 180.0,
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 10.0,
                                left: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destination.city,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.locationArrow,
                                          color: Colors.white,
                                          size: 10.0,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          destination.country,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ]),
                    ),
                  );
                })))
      ],
    );
  }
}
