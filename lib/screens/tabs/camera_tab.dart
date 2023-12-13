import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:herbal_plants/data/plants.dart';
import 'package:herbal_plants/widgets/text_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class CameraTab extends StatefulWidget {
  const CameraTab({super.key});

  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  late String output = '';

  late File pickedImage;

  bool isImageLoaded = false;

  late List result;

  late String accuracy = '';

  late String name = '';

  late String numbers = '';

  final box = GetStorage();

  getImageCamera(String imgsrc) async {
    setState(() {
      hasLoaded = false;
    });
    var tempStore = await ImagePicker().pickImage(
      source: imgsrc == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
      applyModel(File(tempStore.path));
      hasLoaded = true;
    });
  }

  List works = [];

  loadmodel() async {
    try {
      await Tflite.loadModel(
        model: "assets/model/model_unquant.tflite",
        labels: "assets/model/labels.txt",
      );
    } catch (e) {
      print('error $e');
    }

    // works = jsonDecode(await rootBundle.loadString('assets/data/main.json'));

    setState(() {
      hasLoaded = true;
    });
  }

  String str = '';

  applyModel(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true);
    setState(() {
      result = res!;

      str = result[0]['label'].toString().split(' ')[1];
    });

    box.write('plant', str);

    print(str);
    for (int index = 0; index < herbalPlants.length; index++) {
      if (herbalPlants[index].commonName == str) {
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
                        text: 'Guides:  ${herbalPlants[index].plantingGuide}',
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
      } else {}
    }
  }

  bool hasLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadmodel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              getImageCamera('camera');
            },
            child: Card(
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.blue,
                      size: 75,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: 'Scan Plant',
                      fontSize: 32,
                      color: Colors.blue,
                      fontFamily: 'Bold',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
