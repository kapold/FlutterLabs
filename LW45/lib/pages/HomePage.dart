import 'package:flutter/material.dart';
import 'package:lw45/coffee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _indexOfCoffee = 0;
  bool _latteVis = true;
  late bool _cappVis;
  late bool _amerVis;
  late List<Coffee> coffeeList;

  @override
  void initState() {
    coffeeList = [
      Coffee(
          0, "Latte", "New taste1", "https://coffeeaffection.com/wp-content/uploads/2020/01/how-to-make-a-latte-at-home.jpg", 5
      ),
      Coffee(
          1, "Cappuccino", "New taste2", "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-CAPPUCCINO-BANANA-SESAME-SEEDS.jpg", 5
      ),
      Coffee(
          2, "Americano", "New taste3", "https://mocktail.net/wp-content/uploads/2022/03/homemade-Iced-Americano-recipe_1ig.jpg", 5
      )
    ];
    _cappVis = false;
    _amerVis = false;
    super.initState();
  }

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

  void onCoffeeChange(int index) {
    setState(() {
      _indexOfCoffee = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            // color: Colors.green,
            padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
            height: 200,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child:
                        const Text(
                          'Tonight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.white
                          ),
                        ),
                      ),
                      const Text(
                        'Invigorating coffee every morning.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: NetworkImage('https://media.istockphoto.com/id/1339940680/ru/%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D1%87%D0%B0%D1%88%D0%BA%D0%B0-%D0%B3%D0%BE%D1%80%D1%8F%D1%87%D0%B5%D0%B3%D0%BE-%D0%BA%D0%BE%D1%84%D0%B5-%D0%BD%D0%B0-%D0%BF%D0%BE%D0%B4%D0%BD%D0%BE%D1%81%D0%B5-%D0%B8-%D1%80%D1%83%D0%BA%D0%B0-%D1%81%D0%BF%D0%BB%D0%BE%D1%88%D0%BD%D0%BE%D0%B9-%D0%B8%D0%BA%D0%BE%D0%BD%D0%BA%D0%B8-%D0%BA%D0%BE%D0%BD%D1%86%D0%B5%D0%BF%D1%86%D0%B8%D1%8F-%D0%BA%D0%B5%D0%B9%D1%82%D0%B5%D1%80%D0%B8%D0%BD%D0%B3%D0%B0-%D0%B7%D0%BD%D0%B0%D0%BA-%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%B0.jpg?b=1&s=170667a&w=0&k=20&c=0plQSzxS8GgtQNckAI90HMmtAFRMnlWATq31J38zmRk='),
                  ),
                )
              ],
            ),
          ),
          Container(
            //color: Colors.red,
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.grey)
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        _latteVis = true;
                        _amerVis = false;
                        _cappVis = false;
                      });
                    },
                    child: const Text(
                      "Latte",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.grey)
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent
                    ),
                    onPressed: () {
                      setState(() {
                        _latteVis = false;
                        _amerVis = false;
                        _cappVis = true;
                      });
                    },
                    child: const Text(
                      "Cappuccino",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.grey)
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent
                    ),
                    onPressed: () {
                      setState(() {
                        _latteVis = false;
                        _amerVis = true;
                        _cappVis = false;
                      });
                    },
                    child: const Text(
                      "Americano",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _latteVis,
            child: Container(
              height: 400,
              width: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(coffeeList[0].imageSrc),
                      fit: BoxFit.cover
                  )
              ),
              child: const Center(
                child: Text(
                  'Latte',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _cappVis,
            child: Container(
              height: 400,
              width: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(coffeeList[1].imageSrc),
                      fit: BoxFit.cover
                  )
              ),
              child: const Center(
                child: Text(
                  'Cappuccino',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _amerVis,
            child: Container(
              height: 400,
              width: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(coffeeList[2].imageSrc),
                      fit: BoxFit.cover
                  )
              ),
              child: const Center(
                child: Text(
                  'Americano',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
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