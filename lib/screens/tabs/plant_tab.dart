import 'package:flutter/material.dart';
import 'package:herbal_plants/data/plants.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class PlantTab extends StatelessWidget {
  const PlantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: SizedBox(
        child: ListView.separated(
          itemCount: herbalPlants.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              leading: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/${herbalPlants[index].commonName}.jpg'),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  text: herbalPlants[index].commonName,
                                  fontSize: 24,
                                  fontFamily: 'Bold',
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  text:
                                      'Scientific name: ${herbalPlants[index].scientificName}',
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      'Plant description: ${herbalPlants[index].description}',
                                  fontSize: 14,
                                  fontFamily: 'Regular',
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  text:
                                      'Guides:  ${herbalPlants[index].plantingGuide}',
                                  fontSize: 14,
                                  fontFamily: 'Regular',
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/${herbalPlants[index].commonName}.jpg'),
                    ),
                  ),
                ),
              ),
              title: TextWidget(
                text: herbalPlants[index].commonName,
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              subtitle: TextWidget(
                text: herbalPlants[index].description,
                fontSize: 12,
                fontFamily: 'Regular',
              ),
            );
          },
        ),
      ),
    );
  }
}
