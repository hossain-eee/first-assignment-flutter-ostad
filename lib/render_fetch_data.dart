import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RenderingFetchData extends StatelessWidget {
  const RenderingFetchData({super.key, required this.location, required this.description, required this.icon, required this.size, required this.temp, required this.temp_max, required this.temp_min, required this.unixToTimeConvert});

final String location, description, icon;
final double size, temp, temp_max, temp_min;
final String Function() unixToTimeConvert;

  @override
  Widget build(BuildContext context) {
    return   Column(
                          children: [
                            SizedBox(
                              height: size * 0.15,
                            ),
                            Text(
                              location,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 254, 248, 254),
                              ),
                            ),
                            Text(
                              // "Updated: $dateTimeConvert",
                              "Updated: ${unixToTimeConvert()}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 190, 178, 178)),
                            ),
                            SizedBox(
                              height: size * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(
                                  "https://openweathermap.org/img/wn/$icon.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) {
                                    return const Icon(Icons.image);
                                  },
                                ),

                                //present Temperature
                                Text(
                                  "${temp.toStringAsFixed(0)}°",
                                  style: GoogleFonts.dancingScript(
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 32),
                                      fontWeight: FontWeight.bold),
                                ),
                                //max and min temp
                                Column(
                                  children: [
                                    Text(
                                      "max:  ${temp_max.toStringAsFixed(0)}°",
                                      style: GoogleFonts.acme(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 190, 178, 178)),
                                      ),
                                    ),
                                    Text(
                                      "min:  ${temp_min.toStringAsFixed(0)}°",
                                      style: GoogleFonts.acme(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 190, 178, 178)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: size * 0.01,
                            ),
                            Text(
                              description,
                              style: GoogleFonts.teko(
                                textStyle: const TextStyle(
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 190, 178, 178),
                                ),
                              ),
                            ),
                          ],
                        );
  }
}