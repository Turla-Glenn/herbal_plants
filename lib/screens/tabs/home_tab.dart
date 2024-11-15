import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:herbal_plants/data/newdata.dart';
import 'package:herbal_plants/data/plants.dart';
import 'package:herbal_plants/screens/crop_details_page.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

import '../../data/values.dart';

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
                text: 'Crops Available',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 600,
                child: GridView.builder(
                  itemCount: crops.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CropDetailsPage(
                                    data: crops[index],
                                  )));
                        },
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
                                      'assets/images/${crops[index]['name'].toString().toLowerCase()}.PNG'),
                                ),
                              ),
                            ),
                            TextWidget(
                              text: crops[index]['name'],
                              fontSize: 18,
                              fontFamily: 'Bold',
                            ),
                          ],
                        ),
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
