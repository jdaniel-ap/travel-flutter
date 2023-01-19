import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveler/widgets/build_icon_button.dart';
import 'package:traveler/widgets/destination_carrousel.dart';
import 'package:traveler/widgets/hotel_carrousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  final List<IconData> _iconList = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.bicycle
  ];

  void setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 90.0, top: 20.0, left: 15.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _iconList
                    .asMap()
                    .entries
                    .map((e) => BuildIconButton(
                          index: e.key,
                          selectedIndex: _selectedIndex,
                          setIndex: setIndex,
                          icon: _iconList[e.key],
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const DestinationCarrousel(),
            const HotelCarrousel()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.frec26-2.fna.fbcdn.net/v/t1.18169-9/296929_2350169484375_5127816_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFmiKdBOyKHkHsydht4Q_Y61xGRsZ9NlNPXEZGxn02U0zUAy-vpxllsq3c_ebKC890&_nc_ohc=eEsqKm-MnnIAX_TvYjb&_nc_ht=scontent.frec26-2.fna&oh=00_AfDXy6S8RCTCso5d395RzyON0qOewtUWgtXnczKP5GYWyw&oe=63F00F68')),
          ),
        ],
      ),
    );
  }
}
