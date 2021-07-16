import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'dart:io';

class CameraWithMaskFilterScreen extends StatefulWidget {
  const CameraWithMaskFilterScreen({Key? key}) : super(key: key);

  @override
  _CameraWithMaskFilterScreenState createState() => _CameraWithMaskFilterScreenState();
}

class _CameraWithMaskFilterScreenState extends State<CameraWithMaskFilterScreen> {

  String platformVersion = 'Unknown';
  late CameraDeepArController cameraDeepArController;
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffect = Effects.none;
  Filters currentFilter = Filters.none;
  Masks currentMask = Masks.none;
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [

            CameraDeepAr(

              onCameraReady: (isReady){
                platformVersion = "Camera Status $isReady";
                print(platformVersion);
                setState(() {

                });
              },

              onImageCaptured: (path){
                platformVersion = "Image save at $path";
                print(platformVersion);
                setState(() { });
              },

              androidLicenceKey: "b45611256a06ab51c720b1a768990471cd4dfec1d79e5528f40f393865e8dfa6cb907b63534fd784",

              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {

                });
              },

            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:28, right:28),
                      child: Expanded(
                        child: FlatButton(
                          child: Icon(Icons.camera_enhance),
                          color: Colors.white,
                          padding: EdgeInsets.all(15),
                          onPressed: (){
                            if(null == cameraDeepArController){
                              return;
                            }
                            cameraDeepArController.snapPhoto();
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (page) {
                          bool active = currentPage == page;
                          return Platform.isIOS
                              //for IOS
                              ? GestureDetector(
                                  onTap: (){
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {
                                    });
                                  },
                                  child: AvatarView(
                                      radius: active ? 30:15,
                                      borderColor: Colors.yellow,
                                      isOnlyText: false,
                                      avatarType: AvatarType.CIRCLE,
                                      backgroundColor: Colors.red,
                                      imagePath: "assets/img/ios/${page.toString()}.jpg",
                                      placeHolder: Icon(Icons.person, size:50),
                                      errorWidget: Container(child: Icon(Icons.error, size:50)),
                                  ),
                                )
                              //for Android
                              : GestureDetector(
                                  onTap: (){
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {
                                    });
                                  },
                                  child: AvatarView(
                                    radius: active ? 30:20,
                                    borderColor: Colors.yellow,
                                    isOnlyText: false,
                                    avatarType: AvatarType.CIRCLE,
                                    backgroundColor: Colors.red,
                                    imagePath: "assets/img/android/${page.toString()}.jpg",
                                    placeHolder: Icon(Icons.person, size:50),
                                    errorWidget: Container(child: Icon(Icons.error, size:50)),
                                  )
                                );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
