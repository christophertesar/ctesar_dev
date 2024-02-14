import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 40, 75),
        body: PortfolioPage(),
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(50),
      children: const <Widget>[
        TitlePage(),
        // Each child represents a page in the portfolio
        ExperiencePage(),
        // Add more PortfolioItem widgets for additional projects
      ],
    );
  }
}


class TitlePage extends StatelessWidget{
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: 1.0,
            child: RichText(
              text: const TextSpan(
                text: "hi,",
                style: TextStyle(fontFamily: "Aileron", fontWeight: FontWeight.w400, fontSize: 100, color: Color.fromARGB(255, 248, 238, 224)),
                children: <TextSpan>[
                  TextSpan(
                      text: ' nice to meet you. I\'m',
                      style: TextStyle(fontFamily: "Aileron", fontWeight: FontWeight.w200, fontSize: 100, color: Color.fromARGB(255, 248, 238, 224))
                  ),
                ]
              )
            ),
          ),
          const Text(
            textAlign: TextAlign.left,
            style: TextStyle(fontFamily: "Aileron", fontWeight: FontWeight.w800, fontSize: 132, color: Color.fromARGB(255, 248, 238, 224)),
            "Christopher",
          ),
          const Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              color:Color.fromARGB(255, 252, 103, 54), // Pink background
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10), // Adjust margin as needed
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 176, 176), // Orange background
                  // borderRadius: BorderRadius.circular(10), // Optional: rounded corners
                ),
                child: Image.asset(
                  'assets/self.png', // Replace with your image URL
                  width: 800, // Adjust width as needed
                  height: 800, // Adjust height as needed
                  fit: BoxFit.cover, // Adjust image fitting as needed
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: 1200,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  textAlign: TextAlign.left,
                  "I'm a software developer.",
                  style: TextStyle(fontFamily: "Aileron", fontWeight: FontWeight.w200, fontSize: 100, color: Color.fromARGB(255, 248, 238, 224)),
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    "I love to build meaningful projects.",
                    style: TextStyle(fontFamily: "Aileron", fontWeight: FontWeight.w200, fontSize: 100, color: Color.fromARGB(255, 248, 238, 224)),
                  ),
                ],
              )
            ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 300.0),
          ) 
        ],
      )
    );
  }
}

class ExperiencePage extends StatelessWidget{
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            textAlign: TextAlign.left,
            "Experience",
            style: TextStyle(fontFamily: "Aileron", fontWeight: FontWeight.w800, fontSize: 100, color: Color.fromARGB(255, 248, 238, 224)),
          ),
        Padding(
          padding: EdgeInsets.only(top: 50.0),
        ),
        ExperienceItem(
          logoAssetPath: 'assets/LMI_logo.jpg',
          positionName: 'Software Engineer Co-op',
          companyName: 'LMI Technologies',
          bulletPoints: [
            'Developed and maintained features for the company Automated Test Framework API in Python.',
            'Integrated KPIs and logging into the sensor stability test engine which identified a memory leak and enhanced performance monitoring.',
            'Wrote 60+ automated regression and stability tests spanning multiple sensor product lines covering core features.',
            'Developed an interface for Firmware‑level APIs into the ATF using ctypes, enabling team to access lower‑level sensor information.',
            'Implemented a commit visualization tool using Bamboo API to visualize commits from different teams, as well as performance information.',
            'Created a test coverage tracking tool, used by team members to monitor manual and automated tests, and identify areas for enhanced coverage.',
          ],
        ),
        ExperienceItem(
          logoAssetPath: 'assets/SFU_logo.jpg',
          positionName: 'Undergraduate Reasearch Assistant',
          companyName: 'Simon Fraser University Faculty of Applied Science',
          bulletPoints: [
            "Optimized UART transmission via BLE on multiple NRF52840 development boards connected together using Python and CircuitPython",
            "Utilized C to optimize firmware, achieving 5‑10x program speed up and improved data throughput and connection consistency.",
            "Implemented program in C on Raspberry Pi Pico to communicate with AD7768‑1 ADC through SPI.",
            "Created PCB footprints using KiCAD to create a custom external ADC board for antenna data acquisition.",
          ],
        )

      ],
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String logoAssetPath;
  final String positionName;
  final String companyName;
  final List<String> bulletPoints;

  const ExperienceItem({
    Key? key,
    required this.logoAssetPath,
    required this.positionName,
    required this.companyName,
    required this.bulletPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: 1920,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromARGB(255, 252, 103, 54), // Pink background
            padding: EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(10), // Adjust margin as needed
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 176, 176), // Orange background
                // borderRadius: BorderRadius.circular(10), // Optional: rounded corners
              ),
              child: Image.asset(
                logoAssetPath,
                width: 300, // Adjust width as needed
                height: 300, // Adjust height as needed
                fit: BoxFit.cover, // Adjust image fitting as needed
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: positionName,
                    style: const TextStyle(
                      fontFamily: "Aileron",
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                      color: Color.fromARGB(255, 248, 238, 224),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' @ $companyName',
                        style: const TextStyle(
                          fontFamily: "Aileron",
                          fontWeight: FontWeight.w200,
                          fontSize: 36,
                          color: Color.fromARGB(255, 248, 238, 224),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bulletPoints
                      .map(
                        (point) => Text(
                          '• $point',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: "Aileron",
                            fontWeight: FontWeight.w200,
                            fontSize: 24,
                            color: Color.fromARGB(255, 248, 238, 224),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

