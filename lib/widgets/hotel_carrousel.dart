import 'package:flutter/material.dart';
import 'package:traveler/models/hotel.dart';

class HotelCarrousel extends StatelessWidget {
  const HotelCarrousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hotels',
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
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: ((context, index) {
                Hotel hotel = hotels[index];
                return Container(
                  height: 120.0,
                  width: 200.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 10.0,
                        child: Container(
                          height: 120.0,
                          width: 190.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  hotel.name,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  hotel.address,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  '${hotel.price}\$',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10.0,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 0.2),
                                  blurRadius: 0.6),
                            ], borderRadius: BorderRadius.circular(15.0)),
                            child: Stack(
                              children: [
                                Image(
                                  image: AssetImage(hotel.imageUrl),
                                  width: 180.0,
                                  height: 180.0,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }
}
