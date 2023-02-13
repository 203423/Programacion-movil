import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/register_screen.dart';
import 'package:flutter_application_1/screens/components/on_boarding.dart';

// void main() => runApp(const OnInicio());

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 149, 31, 245),
            gradient: LinearGradient(
              colors: [
                (Color.fromARGB(255, 220, 31, 245)),
                (Color.fromARGB(255, 227, 176, 234))
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/B1.png", height: 300, width: 200),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBoarding()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("Continuar con Google",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: MaterialButton(
                      color: const Color.fromARGB(255, 20, 53, 124),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBoarding()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("Continuar con Facebook",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            width: 1, color: Color.fromARGB(255, 91, 91, 91))),
                    child: const Text("Registrarse con e-mail",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 91, 91, 91))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
