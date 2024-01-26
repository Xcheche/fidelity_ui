import 'package:flutter/material.dart';

import 'forgot_password.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show dialog to confirm exit
        bool exitConfirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Exit'),
              content: const Text('Are you sure you want to exit?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );

        // Return the confirmation status
        return exitConfirmed ?? false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/fidelity-coverpic.png',
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/fidelity-logo.png',
                    height: 120.0,
                    width: 120.0,
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: SingleChildScrollView(
                        child: Container(
                          height: 300,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Fidelity Bank',
                                strutStyle: StrutStyle(
                                  height: 1.0,
                                  forceStrutHeight: true,
                                  leading: 0.0,
                                ),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                autocorrect: false,
                                autofocus: false,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Username',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: const EdgeInsets.all(15.0),
                                ),
                              ),
                              TextField(
                                autocorrect: false,
                                autofocus: false,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: const EdgeInsets.all(15.0),
                                ),
                                obscureText: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPassword(),
                                            ));
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Tooltip(
                                        message: 'Login',
                                        child: MaterialButton(
                                          minWidth: 150.0,
                                          color: Colors.green,
                                          onPressed: () {},
                                          shape: const StadiumBorder(
                                            side: BorderSide(
                                              color: Colors.green,
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                            ),
                                          ),
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
