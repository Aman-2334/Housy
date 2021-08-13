import 'package:flutter/material.dart';
import 'package:housy/cubit/registration_cubit.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var name;
  var password;
  bool progress = false;
  bool loading = false;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
      // _secureText2 = !_secureText2;
    });
  }

  void saveForm() {
    final form = _key.currentState;
    if (form != null && form.validate()) {
      form.save();
      login();
    } else {
      setState(() {
        progress = false;
      });
    }
  }

  void login() {
    final savedData = RegistrationCubit().getLocaldata();
    if (name == savedData[0] && password == savedData[1]) {
      RegistrationCubit().updateLoginStatus(true);
      Navigator.of(context).pushReplacementNamed('/homepage');
    } else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid Credentials',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Housy',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 30,
        ),
        loading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.amber)))
            : Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Material(
                        color: Colors.black,
                        elevation: 0.0,
                        child: TextFormField(
                          validator: (e) {
                            if (e != null && e.isEmpty) {
                              Text txt = Text("Please Enter Full Name",
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.ltr);
                              var fullname = txt.data;
                              return fullname;
                            }
                          },
                          onSaved: (e) => name = e,
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 20, right: 15),
                                child: Icon(Icons.person, color: Colors.amber),
                              ),
                              //contentPadding: EdgeInsets.all(15),
                              labelText: "Fullname",
                              labelStyle: TextStyle(color: Colors.amber)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Material(
                        color: Colors.black,
                        elevation: 0.0,
                        child: TextFormField(
                          obscureText: _secureText,
                          validator: (e) {
                            if (e != null && e.isEmpty) {
                              return "Please Enter Password";
                            }
                          },
                          onSaved: (e) => password = e,
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              suffixIcon: IconButton(
                                onPressed: showHide,
                                icon: Icon(
                                    _secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.amber),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 20, right: 15),
                                child: Icon(Icons.phonelink_lock,
                                    color: Colors.amber),
                              ),
                              // contentPadding: EdgeInsets.all(18),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.amber)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    progress
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.amber),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Colors.amber),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      progress = true;
                                    });
                                    saveForm();
                                    setState(() {
                                      progress = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an Account ? ",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/Registration');
                          },
                          child: Text("JOIN NOW",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ],
    ));
  }
}
