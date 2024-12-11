import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziconews/view/Login/LogIn.dart';
import '../../Core/Conest.dart';
import '../../controller/Logic_SInIn.dart';
import '../Widgets/Widget.dart';
import 'View_body.dart';

class Sinin extends StatelessWidget {
  const Sinin({super.key});

  @override
  Widget build(BuildContext context) {
    final LogicSinin Logic = Get.put(LogicSinin());
    // final LogicSinin Logic = Get.put(LogicSinin());

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: primary1,
      ),
      child: Form(
        key: Logic.logic1.formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 200),
            child: Column(
              children: [
                customTextFormField1(
                  hintText: "name",
                  validator: Logic.Validatoremail,
                  controller: Logic.logic1.USername
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFormField1(
                    hintText: "email",
                    validator: Logic.Validatoremail,
                    controller: Logic.logic1.EmailControler,
                    icon: Icons.email),
                SizedBox(
                  height: 20,
                ),
                customPasswordFormField(
                  isPasswordVisible: Logic.logic1.isPasswordVisible,
                  validator: Logic.Validatorpassowrd,
                  togglePasswordVisibility: Logic.togglePasswordVisibility,
                  controller: Logic.logic1.pass,
                  fillColor: primary3,
                ),
                SizedBox(
                  height: 20,
                ),
                customButton(
                    child: Text(
                      "LogIN",
                      style: TextStyle(color: primary3),
                    ),
                    onPressed: () {
                      Logic.Verificatoin();
                    }),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20, left: 50),
                  child: TextButton(
                      onPressed: () {
                        Get.to(LogInPage1());
                      },
                      child: Text(
                        "I have an acont",
                        style: TextStyle(
                            color: primary4,
                            letterSpacing: 1,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.blue),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Roww(),
                SizedBox(
                  height: 10,
                ),
                Fcebook(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
