import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/services/model.dart';
import 'package:flutter_application_2/services/services.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool sign = false;
  int _counter = 0;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  DbConnection dbConnection = DbConnection();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 40)),
                    const Text("Clown mobile  ",
                        style: TextStyle(color: Colors.red, fontSize: 30)),
                    Image.asset("assets/clown.png"),
                  ],
                ),
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        label: const Text("Email"),
                        labelStyle: const TextStyle(color: Colors.red),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.yellow),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.red))),
                    cursorColor: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text("Password"),
                        labelStyle: const TextStyle(color: Colors.red),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.yellow),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.red))),
                    cursorColor: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber),
                    ),
                    onPressed: () async {
                      if (sign == false) {
                        UserModel? user = await dbConnection.signIn(
                            email.text, password.text);
                        if (user != null) {
                          // Navigator.popAndPushNamed(context, '/home');
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        } else {}
                      } else {
                        UserModel? user = await dbConnection.signUp(email.text, password.text);
                        if (user!=null) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        } else {
                          
                        }
                      }
                    },
                    child: sign == false
                        ? const Text("Sign In")
                        : const Text("Sign Up"),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  child: sign == false
                      ? const Text(
                          "Sign Up?",
                          style: TextStyle(color: Colors.black54),
                        )
                      : const Text("Sign In"),
                  onTap: () {
                    setState(() {
                      sign = !sign;
                    });
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                InkWell(
                  onTap: () {
                    setState(() {
                      sign = !sign;
                    });
                  },
                  child: Text(
                    "Sign In?",
                    style: TextStyle(
                        color: Color.fromARGB(170, 255, 255, 255),
                        fontFamily: "IMFellGreatPrimerSC-Regular",
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
