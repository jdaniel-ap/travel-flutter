import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveler/models/activity.dart';
import 'package:traveler/models/destination.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  const DestinationScreen({Key? key, required this.destination})
      : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.destination.imageUrl,
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 0.2),
                          blurRadius: 6.0,
                        ),
                      ]),
                  child: Image(
                    image: AssetImage(widget.destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50.0,
                  horizontal: 5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          iconSize: 30.0,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.sort),
                          iconSize: 30.0,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.destination.city,
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.destination.country,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.white70,
                            size: 15.0,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 10.0,
                right: 10.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 20.0,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    activity.name,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '\$${activity.price}',
                                      style: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      'per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              activity.type,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    activity.startTimes[0],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    activity.startTimes[1],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(
                            activity.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
