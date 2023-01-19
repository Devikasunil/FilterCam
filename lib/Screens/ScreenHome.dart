import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../filter/filterList.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

File? imageFile;

class _ScreenHomeState extends State<ScreenHome> {
  final List<List<double>> filterList = [
    SEPIUM,
    SEPIA,
    GREYSCALE,
    VINTAGE,
    FILTER_1,
    FILTER_2,
    FILTER_3,
    FILTER_4,
    FILTER_5,
  ];

  late String fileName;
  final picker = ImagePicker();
  late File imageFile;

  set image(File image) {
    return;
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    items = image.path;
    return File(imagePath).copy(image.path);
  }

  String? items;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'FilterCam',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(
              Icons.exit_to_app_outlined,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              color: Colors.grey,
              child: Expanded(
                child: Column(
                  children: [
                    items == null
                        ? Container(
                            margin: EdgeInsets.only(top: 100),
                            width: size.width,
                            height: size.width,
                            constraints: BoxConstraints(
                              maxWidth: size.width * 2,
                              maxHeight: size.width * 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: AssetImage('lib/images/imagge.jpg'),
                              ),
                            ),
                          )
                        : Container(
                            constraints: BoxConstraints(
                              maxWidth: size.width * 1.8,
                              maxHeight: size.width * 1.8,
                            ),
                            child: PageView.builder(
                                itemCount: filterList.length,
                                itemBuilder: (context, index) {
                                  return ColorFiltered(
                                    colorFilter: ColorFilter.matrix(
                                      filterList[index],
                                    ),
                                    child: Image(
                                      image: FileImage(
                                        File(
                                          items.toString(),
                                        ),
                                      ),
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveGallery(context);
        },
        child: Icon(
          Icons.camera_alt_outlined,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  // <<<<Functions Started>>>>

  void saveGallery(ctx) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    setState(() {
      this.image = imageTemporary;
    });
    GallerySaver.saveImage(image.path);
    final imagePermenant = await saveImagePermanently(image.path);
    setState(() {
      this.image = imagePermenant;
    });
  }

// <<<<Functions Ended>>>>
}
