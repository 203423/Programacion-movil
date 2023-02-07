import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/screens/components/content_boarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  late PageController varController;
  @override
  void initState() {
    super.initState();
    varController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    varController.dispose();
  }

  List<Map<String, String>> listBoarding = [
    {
      "titulo": "ESPARCIMIENTO",
      "imagen": "assets/images/B1.png",
      "descripcion": "brindamos todos los servicios para consentir a tu mascota"
    },
    {
      "titulo": "ADOPCION",
      "imagen": "assets/images/B2.png",
      "descripcion":
          "nulla faucibus tellus ut odio scelerisque, vitae molestie lectus feugiat"
    },
    {
      "titulo": "HOSPITALIDAD",
      "imagen": "assets/images/B3.png",
      "descripcion":
          "nulla faucibus tellus ut odio scelerisque, vitae molestie lectus feugiat"
    },
    {
      "titulo": "VETERINARIA",
      "imagen": "assets/images/B4.png",
      "descripcion":
          "nulla faucibus tellus ut odio scelerisque, vitae molestie lectus feugiat"
    },
    {
      "titulo": "TIENDA",
      "imagen": "assets/images/B5.png",
      "descripcion":
          "Compra todas las necesidades de tu mascota sin salir de casa"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 700,
            child: PageView.builder(
              controller: varController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) => ContentBoarding(
                text: listBoarding[index]['titulo'],
                image: listBoarding[index]['imagen'],
                descripcion: listBoarding[index]['descripcion'],
              ),
              itemCount: listBoarding.length,
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(listBoarding.length,
                      (index) => pages(index: index, currentPage: currentPage)),
                ),
                MaterialButton(
                  color: currentPage == listBoarding.length - 1
                      ? Colors.green
                      : Colors.white,
                  onPressed: () async {
                    currentPage == listBoarding.length - 1
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Login()))
                        : varController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                  },
                  textColor: currentPage == listBoarding.length - 1
                      ? Colors.white
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                      currentPage == listBoarding.length - 1
                          ? 'Continuar'
                          : "Siguiente",
                      style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AnimatedContainer pages({required int index, required int currentPage}) {
  return AnimatedContainer(
    margin: const EdgeInsets.only(right: 5),
    width: currentPage == index ? 50 : 20,
    height: 5,
    duration: kThemeAnimationDuration,
    decoration: BoxDecoration(
        color: currentPage == index
            ? Colors.pink
            : const Color.fromARGB(255, 175, 171, 171)),
  );
}
