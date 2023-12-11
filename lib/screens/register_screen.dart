import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_on_way_app/screens/login_screen.dart';

import 'home_screen.dart';

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({
    required this.label,
    this.controller,
    this.valueName,
    this.valueLogin,
    this.valuePhoneNumber,
    this.valueEmail,
    this.valuePassword,
    this.valueRepeatPassword,
    this.onChanged,
    this.error,
    this.icon,
    this.allowDecimal = false,
  });

  final TextEditingController? controller;
  final String? valueName;
  final String? valueLogin;
  final String? valuePhoneNumber;
  final String? valueEmail;
  final String? valuePassword;
  final String? valueRepeatPassword;
  final String label;
  final Function? onChanged;
  final String? error;
  final Widget? icon;
  final bool allowDecimal;

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyLoginPage(label: "")));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 140.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
                child: TextFormField(
                  controller: widget.controller,
                  initialValue: widget.valueName,
                  onChanged: widget.onChanged as void Function(String)?,
                  readOnly: false,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(_getRegexNameString())),
                  ],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 25,
                  decoration: InputDecoration(
                    label: const Text("Your name"),
                    errorText: widget.error,
                    icon: widget.icon,
                    counterText: "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
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
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 25,
                  decoration: InputDecoration(
                    label: const Text("Account login"),
                    errorText: widget.error,
                    icon: widget.icon,
                    counterText: "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
                child: TextFormField(
                  controller: widget.controller,
                  initialValue: widget.valuePhoneNumber,
                  onChanged: widget.onChanged as void Function(String)?,
                  readOnly: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(_getRegexNumbersString())),
                    TextInputFormatter.withFunction(
                          (oldValue, newValue) => newValue.copyWith(text: newValue.text.replaceAll('[.,]' , ''),),
                    ),
                  ],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 20,
                  decoration: InputDecoration(
                    label: const Text("Phone number"),
                    errorText: widget.error,
                    icon: widget.icon,
                    counterText: "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
                child: TextFormField(
                  controller: widget.controller,
                  initialValue: widget.valueEmail,
                  onChanged: widget.onChanged as void Function(String)?,
                  readOnly: false,
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(_getRegexEmailString())),
                  ],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 255,
                  decoration: InputDecoration(
                    label: const Text("Email"),
                    errorText: widget.error,
                    icon: widget.icon,
                    counterText: "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
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
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 30,
                  obscureText: true,
                  obscuringCharacter: '•',
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    errorText: widget.error,
                    counterText: "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
                child: TextFormField(
                  controller: widget.controller,
                  initialValue: widget.valueRepeatPassword,
                  onChanged: widget.onChanged as void Function(String)?,
                  readOnly: false,
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(_getRegexPasswordString())),
                  ],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxLength: 30,
                  obscureText: true,
                  obscuringCharacter: '•',
                  decoration: InputDecoration(
                    label: const Text("Repeat password"),
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
                              .resolveWith<Color?>((Set<MaterialState> states) {if (states.contains(MaterialState.hovered)) {return Colors.blue.withOpacity(0.05);}
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
                                  side: const BorderSide(color: Colors.blue)
                              )
                          )
                      ),
                      onPressed: () {Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => MyLoginPage(label: "Login page")));},
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Center(
                              child: Text(
                                "REGISTER",
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
            ],
          ),
        ),
      ),
    );
  }
  String _getRegexNameString() => r'[A-Za-z ]*';
  String _getRegexLoginString() => r'[A-Za-z0-9.]*';
  String _getRegexEmailString() => r'[A-Za-z0-9._@]*';
  String _getRegexPasswordString() => r'[A-Za-z0-9.?/]';
  String _getRegexNumbersString() =>
      widget.allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}