// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// //import 'package:image_picker/image_picker.dart';
//
// import '../../../../../core/const.dart';
//
// class ProfilePic extends StatefulWidget {
//   const ProfilePic({Key? key}) : super(key: key);
//
//   @override
//   _ProfilePicState createState() => _ProfilePicState();
// }
//
// class _ProfilePicState extends State<ProfilePic> {
//   File? image;
//
//   /* Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState(() => this.image = imageTemporary);
//     } on PlatformException catch (e) {
//       print('Faild to pick image: $e');
//     }
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Material(
//         color: Colors.white,
//         elevation: 10,
//         borderRadius: BorderRadius.circular(50.0),
//         shadowColor: Color(0x802196F3),
//         child: Stack(
//           //fit: StackFit.expand,
//           // ignore: deprecated_member_use
//           children: [
//             Spacer(),
//             CircleAvatar(
//               radius: 50.0,
//               backgroundColor: Colors.black12,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
//               ),
//             ),
//             Positioned(
//                 right: 90,
//                 bottom: -10,
//                 child: SizedBox(
//                   height: 46,
//                   width: 46,
//                   // ignore: deprecated_member_use
//                   child: TextButton(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     onPressed: () {},
//                     //=> pickImage(ImageSource.gallery),
//                     child: Icon(
//                       Icons.camera_alt,
//                       color: Primarycolor,
//                     ),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
