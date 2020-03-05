import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/home': (context) => CustomPageViewScreen(),
    },
  ));
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
////      decoration: BoxDecoration(color: Colors.blueAccent[100]),
//      home: Scaffold(
//        backgroundColor: Colors.blueAccent[100],
//        body: MyCustomForm(),
//      ),
//    );
//  }
//}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginCustomFormState createState() {
    return LoginCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginCustomFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool passwordInvisible;

  @override
  void initState() {
    passwordInvisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextFormField(
                style: new TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    enabledBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey[200])),
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    labelText: 'Email / Nomor Handphone',
                    labelStyle: TextStyle(color: Colors.grey[200])),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email atau nomor handphone harus diisi';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
              child: TextFormField(
                style: new TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                obscureText: passwordInvisible,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        passwordInvisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[200],
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          passwordInvisible = !passwordInvisible;
                        });
                      },
                    ),
                    enabledBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey[200])),
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey[200])),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password harus diisi';
                  } else if (value.length < 6) {
                    return 'Password terlalu pendek';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, right: 40.0, left: 40.0),
              child: RaisedButton(
                color: Colors.white,
                textColor: Colors.blueAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
//                    side: BorderSide(color: Colors.white)
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Mohon tunggu...')));
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: Text('MASUK'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
              child: Center(
                child: Text(
                  'Belum Punya Akun?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0),
              child: RaisedButton(
                color: Colors.blueAccent[100],
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('DAFTAR'),
              ),
            ),
          ],
        ));
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterCustomFormState createState() {
    return RegisterCustomFormState();
  }
}

class RegisterCustomFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool passwordInvisible;

  @override
  void initState() {
    passwordInvisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                      child: Text(
                        'DAFTAR',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                      child: TextFormField(
                        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z A-Z]"))],
                        style: new TextStyle(color: Colors.white),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            enabledBorder: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey[200])),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)),
                            labelText: 'Nama Lengkap',
                            labelStyle: TextStyle(color: Colors.grey[200])),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nama harus diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
                      child: TextFormField(
                        style: new TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey[200])),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.grey[200])),
                        validator: (value) {
                          bool validateEmail(String value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            return (!regex.hasMatch(value)) ? false : true;
                          }

                          if (value.isEmpty) {
                            return 'Email harus diisi';
                          } else if (!validateEmail(value)) {
                            return 'Email harus valid';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
                      child: TextFormField(
                        style: new TextStyle(color: Colors.white),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            enabledBorder: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey[200])),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)),
                            labelText: 'Nomor Handphone',
                            labelStyle: TextStyle(color: Colors.grey[200])),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nomor handphone harus diisi';
                          } else if (value.length < 9 && value.length > 14) {
                            return 'Nomor handphone minimal panjang 9 karakter dan maksimal 14 karakter';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
                      child: TextFormField(
                        style: new TextStyle(color: Colors.white),
                        keyboardType: TextInputType.text,
                        obscureText: passwordInvisible,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordInvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[200],
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  passwordInvisible = !passwordInvisible;
                                });
                              },
                            ),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey[200])),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey[200])),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password harus diisi';
                          } else if (value.length < 6) {
                            return 'Password minimal panjang 6 karakter';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0, right: 20.0, left: 20.0),
                      child: Text(
                        'Dengan mendaftarkan akun baru, Anda dianggap telah menyetujui Kebijakan Privasi',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.blueAccent[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          //                    side: BorderSide(color: Colors.white)
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
//                            Scaffold.of(context).showSnackBar(
//                                SnackBar(content: Text('Mohon tunggu...')));
                            Navigator.pop(context);
                          }
                        },
                        child: Text('DAFTAR'),
                      ),
                    ),
                  ],
                )
            )));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = new Image.network("http://www.gstatic.com/webp/gallery/1.jpg");
    var container = new Container(
      child: image,
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      width: 200.0,
      height: 200.0,
    );

    return MaterialApp(
      title: "Scroller",
      home: Scaffold(
        body: Center(
            child: new ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0) { //first row is horizontal scroll
                  var singleChildScrollView = SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          container,
                          container,
                          container,
                        ],
                      ),
                      scrollDirection: Axis.horizontal);
                  return singleChildScrollView;
                } else {
                  return new Row(
                    children: <Widget>[container, container],
                  );
                }
              },
              itemCount: 10, // 9 rows of AllGenresAndMoods + 1 row of PopularGenresAndMoods
            )),
      ),
    );
  }
}

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200, // card height
          child: PageView.builder(
            itemCount: 4,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(
                      children: <Widget>[
//                        container,
//                        container,
//                        container,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomPageViewScreen extends StatefulWidget {
  @override
  _CustomPageViewScreenState createState() => new _CustomPageViewScreenState();
}

class _CustomPageViewScreenState extends State<CustomPageViewScreen> {
  List interests = [
    InterestsModel('Test1', 'assets/btn_angka_500.png'),
    InterestsModel('Test2', 'assets/btn_halyu_500.png'),
    InterestsModel('Test3', 'assets/btn_kalimat_500.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(36, 43, 47, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              _buildInterestsContent(),
              _buildCheckIcon(),
              _buildNextButton()
            ],
          )),
    );
  }

  Text _buildTitle() {
    return Text(
      "Choose your interests".toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color.fromRGBO(243, 243, 243, 1),
          fontSize: 19),
    );
  }

  Stack _buildInterestsContent() {
    return Stack(
      children: <Widget>[
        _buildInterestsPageView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('assets/bg_gradient_left.png'),
            Image.asset('assets/bg_gradient_right.png'),
          ],
        ),
      ],
    );
  }

  List selectedInterests = [];
  PageController pageController =
  PageController(viewportFraction: 0.45, initialPage: 4240);

  Container _buildInterestsPageView() {
    return Container(
      height: 210,
      child: PageView.builder(
        itemBuilder: (context, int currentIdx) {
          int crt = currentIdx;
          if (crt > 2) {
            if (crt % 3 == 0) {
              crt = 0;
            } else if ((crt + 1) % 3 == 0) {
              crt = 2;
            } else if ((crt - 1) % 3 == 0) {
              crt = 1;
            }
          }
          return Container(
            margin: const EdgeInsets.only(top: 31.0),
            child: _buildPageViewItem(interests[crt], crt),
          );
        },
        controller: pageController,
      ),
    );
  }

  GestureDetector _buildPageViewItem(InterestsModel data, int crt) {
    bool active = selectedInterests.contains(crt);
    final String backgroundAsset = active
        ? 'assets/ic_order_success.png'
        : 'assets/ic_order_failed.png';
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedInterests.contains(crt))
            selectedInterests.remove(crt);
          else {
            selectedInterests.add(crt);
          }
        });
      },
      child: Column(
        children: <Widget>[
          Text(data.title.toUpperCase(),
              style: TextStyle(
                color: Color.fromRGBO(243, 243, 243, 1),
                fontSize: 11.0,
              )),
          SizedBox(
              height: 129,
              width: 129,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(backgroundAsset))),
                child: Image.asset(data.imageAsset),
              )),
        ],
      ),
    );
  }

  Container _buildCheckIcon() {
    String buttonAsset = selectedInterests.isEmpty
        ? 'assets/ic_splash_five_w.png'
        : 'assets/ic_splash_five.png';
    return Container(
      child: Image.asset(buttonAsset),
    );
  }

  Container _buildNextButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 71, right: 71, top: 21),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: RaisedButton(
          child: Text(
            "Next".toUpperCase(),
            style: TextStyle(
                color: Color.fromRGBO(40, 48, 52, 1),
                fontSize: 19),
          ),
          color: Colors.white,
          elevation: 4.0,
          onPressed: () {},
        ),
      ),
    );
  }
}

class InterestsModel {
  String imageAsset;
  String title;

  InterestsModel(this.title, this.imageAsset);
}