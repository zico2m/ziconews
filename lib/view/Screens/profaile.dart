import 'package:flutter/material.dart';

import '../../Core/Conest.dart';
import '../../controller/controller_profail.dart';

class Profaile extends StatelessWidget {

  final ControllerProfail cobtrol  = ControllerProfail();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, primary1.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ), // استبدل `primary` باللون الذي تريده
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              width: 450,
              height: 300,

              child: Stack(

                  children: [

                    Positioned(
                      top: 200,
                      left: 160,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:  cobtrol.image != null
                            ? FileImage(cobtrol.image!)
                            : AssetImage('images/z.jpg') as ImageProvider,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt,

                              color: Colors.white,
                            ),
                            onPressed: cobtrol.pickImage,
                          ),

                        ),
                      ),
                    ),
                  ]
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text("Edit Your Information",style: TextStyle(fontSize: 30),),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 270,
                    child: TextFormField(
                      maxLines: 1,

                      decoration: InputDecoration(
                          hintText: "Edit name.. ",
                          hintStyle: TextStyle(
                            overflow: TextOverflow.ellipsis,

                          ),
                          suffixIcon: Icon(Icons.edit),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))
                          )

                      ),
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.only(top: 20),
                    width: 270,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Edit email..",
                          suffixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))
                          )

                      ),
                    ),
                  ),

                  Align(

                      alignment: Alignment.bottomLeft,
                      child: TextButton(onPressed: (){},
                          child: Text("Edit Password",
                            style: TextStyle(fontSize: 20),
                          )
                      )
                  ),



                ],
              ),
            ),




          ],
        ),
      ),
    );
    ;
  }
}
