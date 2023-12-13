import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:herbal_plants/data/plants.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecentPlant();
  }

  final box = GetStorage();

  String name = '';

  getRecentPlant() {
    for (int index = 0; index < herbalPlants.length; index++) {
      if (herbalPlants[index].commonName == box.read('plant')) {
        setState(() {
          name = herbalPlants[index].commonName;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Recently Scanned Plant:',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: name == ''
                      ? null
                      : DecorationImage(
                          opacity: 125,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/$name.jpg'),
                        ),
                ),
                child: Center(
                  child: TextWidget(
                    text: name == '' ? 'No recent plant' : name,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Recommended',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 500,
                child: GridView.builder(
                  itemCount: herbalPlants.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 500,
                            height: 125,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/${herbalPlants[index].commonName}.jpg'),
                              ),
                            ),
                          ),
                          TextWidget(
                            text: herbalPlants[index].commonName,
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
