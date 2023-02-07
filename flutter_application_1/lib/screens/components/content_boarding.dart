import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.text, this.image, this.descripcion});
  final String? text;
  final String? image;
  final String? descripcion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Image.asset(
            image!,
            height: 220,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            text!,
            style: const TextStyle(fontSize: 25, color: Colors.purple),
          ),
        ),
        Text(
          descripcion!,
          style: const TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 155, 159, 161)),
        )
      ],
    );
  }
}
