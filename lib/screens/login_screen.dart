import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_on_way_app/screens/register_screen.dart';

import 'home_screen.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({
    required this.label,
    this.controller,
    this.valueLogin,
    this.valuePassword,
    this.onChanged,
    this.error,
    this.icon,
    this.allowDecimal = false,
  });

  final TextEditingController? controller;
  final String? valueLogin;
  final String? valuePassword;
  final String label;
  final Function? onChanged;
  final String? error;
  final Widget? icon;
  final bool allowDecimal;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 250.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40.0),
                child: TextFormField(
                  controller: widget.controller,
                  initialValue: widget.valueLogin,
                  onChanged: widget.onChanged as void Function(String)?,
                  readOnly: false,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(_getRegexLoginString())),
                  ],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 25,
                  decoration: InputDecoration(
                    label: Text("Enter login"),
                    errorText: widget.error,
                    icon: widget.icon,
                    counterText: "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40.0),
                child: TextFormField(
                  controller: widget.controller,
                  initialValue: widget.valuePassword,
                  onChanged: widget.onChanged as void Function(String)?,
                  readOnly: false,
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(_getRegexPasswordString())),
                  ],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 30,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    label: Text("Enter password"),
                    errorText: widget.error,
                    icon: widget.icon,
                    counterText: "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40.0),
                child: Container(
                  height: 60.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty
                            .resolveWith<Color?>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Colors.blue.withOpacity(0.05);
                              }
                              if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed)) {
                                return Colors.blue.withOpacity(0.06);
                              }
                              return null; // Defer to the widget's default.
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.blue)
                              )
                        )
                      ),
                      onPressed: () {Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => MyHomePage(label: "Home page")));},
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Center(
                              child: Text(
                                "CONFIRM",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Montserrat',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0, left: 50.0, right: 50.0),
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty
                          .resolveWith<Color?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue.withOpacity(0.05);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.06);
                        }
                        return null; // Defer to the widget's default.
                      },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                          )
                      )
                  ),
                  onPressed: () {Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyRegisterPage(label: "")));
                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Center(
                        child: Text(
                          "Register new account!",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Montserrat',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  String _getRegexLoginString() => r'[A-Za-z0-9.]*';
  String _getRegexPasswordString() => r'[A-Za-z0-9.?/]';
  String _getRegexNumbersString() =>
      widget.allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}