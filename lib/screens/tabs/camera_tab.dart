import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:herbal_plants/data/plants.dart';
import 'package:herbal_plants/data/values.dart';
import 'package:herbal_plants/screens/result_screen.dart';
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

      str = result[0]['label'];
    });

    box.write('plant', str);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ResultScreen(
              index: int.parse(str.split(' ')[0]),
              file: pickedImage,
            )));
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
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () {
                          getImageCamera('camera');
                        },
                        title: const Text('Camera'),
                        trailing: const Icon(Icons.camera),
                      ),
                      ListTile(
                        onTap: () {
                          getImageCamera('gallery');
                        },
                        title: const Text('Gallery'),
                        trailing: const Icon(Icons.photo),
                      ),
                    ],
                  );
                },
              );
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
                      text: 'Scan Crop',
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
