import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int _currentIndex = 1;

  void onItemPressed(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 1) {
        Navigator.pushNamedAndRemoveUntil(context, '/info', (route) => false);
      }
      else {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          children: const [
            Text(
              'Cozy Cafe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 64
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Text(
              """Welcome to our Cozy Cafe! We are committed to providing our customers with a warm and inviting atmosphere, delicious food and beverages, and excellent customer service. Here's some information about our cafe:
              \n\nLocation: We are located in the heart of downtown, just a few blocks from the main shopping area and public transportation.
              \n\nMenu: Our menu features a variety of freshly made sandwiches, salads, soups, and baked goods, all made with high-quality ingredients. We also offer a selection of hot and cold beverages, including coffee, tea, and specialty drinks.
              \n\nAtmosphere: Our cafe has a comfortable and inviting atmosphere, with plenty of seating for both individuals and groups. We have free Wi-Fi and plenty of power outlets for those who need to work or study.
              \n\nHours: We are open seven days a week, from 7am to 7pm. We also offer catering services for events and meetings.
              \n\nCustomer service: We pride ourselves on providing excellent customer service. Our friendly and knowledgeable staff is always available to answer any questions and make recommendations.
              \n\nEvents: We occasionally host live music and other events in the evenings. Follow us on social media to stay up to date on our upcoming events.
              \n\nWe hope to see you soon at our cafe!""",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info",
            )
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: onItemPressed,
          backgroundColor: Colors.grey,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}