import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:test1/auth/registtater/model/register_model.dart';
import 'package:test1/auth/registtater/util/register_util.dart';
import 'package:test1/home.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File _image;
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  BuildContext _context;

  final RegisterController registerController = Get.put(RegisterController());

  Future getImage() async {
    print("hello");
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print("hello1");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return new Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: new Builder(builder: (BuildContext context) {
        _context = context;
        return new ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          children: [
            new SizedBox(
              height: 20,
            ),
            new Container(
              alignment: Alignment.center,
              width: size.width,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border:
                            Border.all(color: colorScheme.onSurface, width: 5),
                        color: colorScheme.onSurface),
                    child: new Stack(
                      children: [
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child:_image==null? SizedBox.shrink():Image.file(_image
                            ,height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new Container(
                          height: 120,
                          width: 120,
                          color: Colors.transparent,
                          alignment: Alignment.bottomRight,
                          child: getImagePickerButton(context),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            new SizedBox(
              height: 50,
            ),
            new SizedBox(
              height: 50,
              child: new CupertinoTextField(
                decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                placeholder: "Full Name",
                maxLines: 1,
                keyboardType: TextInputType.name,
                prefix: new Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: new Icon(CupertinoIcons.person_circle),
                ),
                prefixMode: OverlayVisibilityMode.editing,
                controller: nameController,
              ),
            ),
            new SizedBox(
              height: 25,
            ),
            new SizedBox(
              height: 50,
              child: new CupertinoTextField(
                decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                placeholder: "Email Address",
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                prefix: new Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: new Icon(CupertinoIcons.mail),
                ),
                prefixMode: OverlayVisibilityMode.editing,
                controller: emailController,
              ),
            ),
            new SizedBox(
              height: 25,
            ),
            new SizedBox(
              height: 50,
              child: new CupertinoTextField(
                decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                placeholder: "Mobile No.",
                maxLines: 1,
                prefix: new Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: new Icon(CupertinoIcons.phone_circle),
                ),
                prefixMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.phone,
                controller: phoneController,
                maxLength: 10,
              ),
            ),
            new SizedBox(
              height: 25,
            ),
            new SizedBox(
              height: 25,
            ),
            new SizedBox(
              height: 45,
              child: new CupertinoTextField(
                decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                placeholder: "Password",
                maxLines: 1,
                maxLength: 15,
                obscureText: true,
                prefix: new Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: new Icon(CupertinoIcons.lock_shield),
                ),
                prefixMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
              ),
            ),
            new SizedBox(
              height: 25,
            ),
            new SizedBox(
              height: 35,
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: FlatButton(
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w900)),

                  onPressed: onRegisterClick),
            ),
          ],
        );
      }),
    );
  }

  Widget getImagePickerButton(context) {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return new CupertinoButton(
      child: new Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: colorScheme.onSurface,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: colorScheme.onPrimary, width: 2)),
        child: new Icon(
          Icons.edit,
          size: 18,
        ),
      ),
      onPressed: getImage,
      padding: EdgeInsets.all(0),
    );
  }

  onRegisterClick() async {
    String name = nameController.value.text;
    String email = emailController.value.text.replaceAll(" ", "");
    String phone = phoneController.value.text;
    String image = _image.toString();
    String password = passwordController.value.text;

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        phone.isNotEmpty &&
        image.isNotEmpty) {
      RegisterModel registerModelList = await registerController.registrationUser(
          name, email,  password,phone,image, context);
      if(registerModelList.userInfo!=null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }
    } else {
    }
    // it to show a SnackBar.
  }
}
