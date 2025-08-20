import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/labubu_doll.dart';

class DollCard extends StatelessWidget {
  final LabubuDoll doll;
  final VoidCallback onTap;

  const DollCard({super.key, required this.doll, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final primaryColor = doll.theme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Hero(
                tag: 'doll_${doll.id}',
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),

                  child:
                      Center(
                            child: Icon(
                              Icons.toys_outlined,
                              size: 120,
                              color: primaryColor,
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .moveY(
                            begin: 50,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOutQuad,
                          ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${doll.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
