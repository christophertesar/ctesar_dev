import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:card_swiper/card_swiper.dart';

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
      padding: EdgeInsets.all(
        context.responsive<double>(
          20, // default
          sm: 10, // small 
          md: 20, // medium
          lg: 30, // large 
          xl: 50, // extra large screen
        ),
      ),
      children: <Widget>[
        TitlePage(),
        // Each child represents a page in the portfolio
        ExperiencePage(),

        SwiperPage(
          images: const [
            "assets/RescueReady.png",
            "assets/Eznote.png",
            "assets/osrs_vr.png",
            "assets/motor_torque.png"
          ],
          text: const [
            "SFU EC 1st Place: RescueReady",
            "WEC 2024 1st Place: EzNote",
            "Old School Runescape in VR",
            "Embedded Motor Speed/Torque Sensor"
          ],
          link: [
            Uri.parse("https://github.com/amot-dev/RescueReady"),
            Uri.parse("https://github.com/christophertesar/wec_2024"),
            Uri.parse("https://github.com/christophertesar/osrs"),
            Uri.parse("https://github.com/christophertesar/Motor-Speed-and-Torque-Sensing")
          ]
        ),

        ContactsPage(),
        // Add more PortfolioItem widgets for additional projects
      ],
    );
  }
}

class SwiperPage extends StatelessWidget{
  final List<String> images;
  final List<String> text;
  final List<Uri> link;

  const SwiperPage(
    {
      Key? key,
      required this.images,
      required this.text,
      required this.link
    }
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
      Text(
        textAlign: TextAlign.left,
        "Projects",
        style: TextStyle(
          fontFamily: "Aileron", 
          fontWeight: FontWeight.w800, 
          fontSize: context.responsive<double>(
            72, // default
            sm: 50, // small 
            md: 72, // medium
            lg: 86, // large 
            xl: 100, // extra large screen
          ), 
          color: Color.fromARGB(255, 248, 238, 224)),
      ),
      Padding(
        padding: EdgeInsets.only(top: context.responsive<double>(
            30, // default
            sm: 20, // small 
            md: 30, // medium
            lg: 40, // large 
            xl: 50, // extra large screen
        )),
      ),
      Swiper(
        onTap: (index) => launchUrl(link[index]),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              DoublePhotoFrame(
                innerBorder: Color.fromARGB(255, 255, 176, 176), 
                outerBorder: Color.fromARGB(255, 252, 103, 54),
                logoAssetPath: images[index],
                borderRadius: 40,
                borderSpace: 20,
                imageSizeSm: 200,
                imageSizeMd: 250,
                imageSizeLg: 300,
                imageSizeXl: 350,
              ),
              Padding(
                padding: EdgeInsets.only(top: context.responsive<double>(
                    5, // default
                    sm: 5, // small 
                    md: 5, // medium
                    lg: 5, // large 
                    xl: 5, // extra large screen
                )),
              ),
              Text(
                text[index],
                style: TextStyle(
                  fontFamily: "Aileron",
                  fontWeight: FontWeight.w200,
                  fontSize: context.responsive<double>(
                    14, // default
                    sm: 14, // small 
                    md: 14, // medium
                    lg: 16, // large 
                    xl: 16, // extra large screen
                  ),
                  color: Color.fromARGB(255, 248, 238, 224),
                )
              ),
            ]
          );
        },
        itemCount: images.length,
        itemWidth: 600.0,
        itemHeight: 600.0,
        layout: SwiperLayout.STACK,
        autoplay: true,
      )
      ]
    );
  }
}

class TitlePage extends StatelessWidget{
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.topLeft,
      child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                RichText(
                  text: TextSpan(
                    text: "Hi,",
                    style: TextStyle(
                      fontFamily: "Aileron", 
                      fontWeight: FontWeight.w400, 
                      fontSize: context.responsive<double>(
                        72, // default
                        sm: 50, // small 
                        md: 72, // medium
                        lg: 86, // large 
                        xl: 100, // extra large screen
                      ),
                      color: Color.fromARGB(255, 248, 238, 224)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' nice to meet you.',
                          style: TextStyle(
                            fontFamily: "Aileron",
                            fontWeight: FontWeight.w200,
                            fontSize: context.responsive<double>(
                              72, // default
                              sm: 50, // small 
                              md: 72, // medium
                              lg: 86, // large 
                              xl: 100, // extra large screen
                            ), 
                            color: Color.fromARGB(255, 248, 238, 224))
                      ),
                    ]
                  )
                ),
                RichText(
                  text: TextSpan(
                    text: 'I\'m',
                    style: TextStyle(fontFamily: "Aileron", 
                    fontWeight: FontWeight.w200, 
                    fontSize: context.responsive<double>(
                      86, // default
                      sm: 72, // small 
                      md: 86, // medium
                      lg: 100, // large 
                      xl: 132, // extra large screen, 
                    ),
                    color: Color.fromARGB(255, 248, 238, 224)),
                    children: <TextSpan> [
                      TextSpan(
                        text: ' Christopher.',
                        style: TextStyle(
                          fontFamily: "Aileron", 
                          fontWeight: FontWeight.w800, 
                          fontSize: context.responsive<double>(
                            86, // default
                            sm: 72, // small 
                            md: 86, // medium
                            lg: 100, // large 
                            xl: 132, // extra large screen, 
                          ),
                        )
                       )
                    ]
                  )
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
            ),
            const SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  DoublePhotoFrame(
                    innerBorder: Color.fromARGB(255, 255, 176, 176), 
                    outerBorder: Color.fromARGB(255, 252, 103, 54), 
                    logoAssetPath: 'assets/self.png',
                    imageSizeSm: 200,
                    imageSizeMd: 400,
                    imageSizeLg: 600,
                    imageSizeXl: 800,
                    borderRadius: 80,
                    borderSpace: 40,
                  ),
                ]
              ),
            )
            ],
          ),
      );
  }
}

class ExperiencePage extends StatelessWidget{
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          "Experience",
          style: TextStyle(
            fontFamily: "Aileron", 
            fontWeight: FontWeight.w800, 
            fontSize: context.responsive<double>(
              72, // default
              sm: 50, // small 
              md: 72, // medium
              lg: 86, // large 
              xl: 100, // extra large screen
            ), 
            color: Color.fromARGB(255, 248, 238, 224)),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.responsive<double>(
              30, // default
              sm: 20, // small 
              md: 30, // medium
              lg: 40, // large 
              xl: 50, // extra large screen
          )),
        ),
        const ExperienceItem(
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
        const ExperienceItem(
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
      height: context.responsive<double>(
        475, // default
        sm: 425, // small 
        md: 475, // medium
        lg: 550, // large 
        xl: 600, // extra large screen
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DoublePhotoFrame(
            innerBorder: const Color.fromARGB(255, 255, 176, 176), 
            outerBorder: const Color.fromARGB(255, 252, 103, 54), 
            logoAssetPath: logoAssetPath
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.responsive<double>(
                30, // default
                sm: 20, // small 
                md: 30, // medium
                lg: 40, // large 
                xl: 50, // extra large screen
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: positionName,
                    style: TextStyle(
                      fontFamily: "Aileron",
                      fontWeight: FontWeight.w600,
                      fontSize: context.responsive<double>(
                        28, // default
                        sm: 24, // small 
                        md: 28, // medium
                        lg: 32, // large 
                        xl: 36, // extra large screen
                      ),
                      color: Color.fromARGB(255, 248, 238, 224),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' @ $companyName',
                        style: TextStyle(
                          fontFamily: "Aileron",
                          fontWeight: FontWeight.w200,
                          fontSize: context.responsive<double>(
                            28, // default
                            sm: 24, // small 
                            md: 28, // medium
                            lg: 32, // large 
                            xl: 36, // extra large screen
                          ),
                          color: Color.fromARGB(255, 248, 238, 224),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: context.responsive<double>(
                      30, // default
                      sm: 20, // small 
                      md: 30, // medium
                      lg: 40, // large 
                      xl: 50, // extra large screen
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bulletPoints
                      .map(
                        (point) => Text(
                          '• $point',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Aileron",
                            fontWeight: FontWeight.w200,
                            fontSize: context.responsive<double>(
                              20, // default
                              sm: 18, // small 
                              md: 20, // medium
                              lg: 22, // large 
                              xl: 24, // extra large screen
                            ),
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

class ContactsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SocialItem(
            logoAssetPath: "assets/linkedin_icon.svg", 
            text: "Christopher Tesar",
            uri: Uri.parse('https://www.linkedin.com/in/christopher-tesar-9853a113b/'),
          ),
          SocialItem(
            logoAssetPath: "assets/github_icon.svg", 
            text: "christophertesar",
            uri: Uri.parse('https://github.com/christophertesar')
          ),
          SocialItem(
           logoAssetPath: "assets/email_icon.svg",
           text: "ctesar@sfu.ca",
           uri: Uri(
            scheme: 'mailto',
            path: "ctesar@sfu.ca"
            )  
          ),
        ],
      )
    );
  }
}

class MailToItem extends SocialItem{
  const MailToItem({
    Key? key,
    required String logoAssetPath,
    required String text,
    String? uri,
  }) : super(key: key, logoAssetPath: logoAssetPath, text: text);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          logoAssetPath, // Replace with your image URL
          width: 25, // Adjust width as needed
          height: 25, // Adjust height as needed
          fit: BoxFit.cover, // Adjust image fitting as needed
          
          color: Color.fromARGB(255, 248, 238, 224)
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 5
          )
        ),
        if(uri != null)
          HoverColorChangeWidget(
            uri: uri,
            text: text,
          )
        else
          Text(
            textAlign: TextAlign.left,
            text,
            style: TextStyle(
              fontFamily: "Aileron", 
              fontWeight: FontWeight.w200, 
              fontSize: context.responsive<double>(
                12, // default
                sm: 10, // small 
                md: 12, // medium
                lg: 14, // large 
                xl: 16, // extra large screen
              ), 
              color: Color.fromARGB(255, 248, 238, 224)),
          ),
      ],
    );
  }
}

class SocialItem extends StatelessWidget{
  final String logoAssetPath;
  final String text;
  final Uri? uri;

  const SocialItem({
    Key? key,
    required this.logoAssetPath,
    required this.text,
    this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          logoAssetPath, // Replace with your image URL
          width: 25, // Adjust width as needed
          height: 25, // Adjust height as needed
          fit: BoxFit.cover, // Adjust image fitting as needed
          
          color: Color.fromARGB(255, 248, 238, 224)
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 5
          )
        ),
        if(uri != null)
          HoverColorChangeWidget(
            uri: uri,
            text: text,
          )
        else
          Text(
            textAlign: TextAlign.left,
            text,
            style: TextStyle(
              fontFamily: "Aileron", 
              fontWeight: FontWeight.w200, 
              fontSize: context.responsive<double>(
                12, // default
                sm: 10, // small 
                md: 12, // medium
                lg: 14, // large 
                xl: 16, // extra large screen
              ), 
              color: Color.fromARGB(255, 248, 238, 224)),
          ),
      ],
    );
  }
}

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1440
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= 1281
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= 1024
                ? (md ?? sm ?? defaultVal)
                : wd >= 768
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}

class HoverColorChangeWidget extends StatefulWidget {
  final Uri? uri;
  final String text;

  HoverColorChangeWidget({Key? key, this.uri, required this.text}) : super(key: key);

  @override
  _HoverColorChangeWidgetState createState() => _HoverColorChangeWidgetState();
}

class _HoverColorChangeWidgetState extends State<HoverColorChangeWidget> {
  Color textColor = Color.fromARGB(255, 248, 238, 224);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          textColor = Colors.blue; // Change this to the color you want when hovering
        });
      },
      onExit: (event) {
        setState(() {
          textColor = Color.fromARGB(255, 248, 238, 224); // Or whatever your normal color is
        });
      },
      child: InkWell(
        onTap: () => launchUrl(widget.uri!),
        child: Text(
          widget.text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: "Aileron",
            fontWeight: FontWeight.w200,
            fontSize: context.responsive<double>(
              12, // default
              sm: 10, // small
              md: 12, // medium
              lg: 14, // large
              xl: 16, // extra large screen
            ),
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class DoublePhotoFrame extends StatelessWidget{
  final Color outerBorder;
  final Color innerBorder;
  final String logoAssetPath;
  final double imageSizeSm;
  final double imageSizeMd;
  final double imageSizeLg;
  final double imageSizeXl;
  final double borderRadius;
  final double borderSpace;

  const DoublePhotoFrame({
    Key? key,
    required this.innerBorder,
    required this.outerBorder,
    required this.logoAssetPath,
    this.imageSizeSm = 100,
    this.imageSizeMd = 200,
    this.imageSizeLg = 250,
    this.imageSizeXl = 300,
    this.borderRadius = 40,
    this.borderSpace = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: outerBorder, // Pink background
        padding: EdgeInsets.all(borderSpace),
        child: Container(
          padding: EdgeInsets.all(borderSpace), // Adjust margin as needed
          decoration: BoxDecoration(
            color: innerBorder, // Orange background
            borderRadius: BorderRadius.circular(borderRadius), // Optional: rounded corners
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              logoAssetPath,
              width: context.responsive<double>(
                imageSizeMd, // default
                sm: imageSizeSm, // small 
                md: imageSizeMd, // medium
                lg: imageSizeLg, // large 
                xl: imageSizeXl, // extra large screen
              ), // Adjust width as needed
              height: context.responsive<double>(
                imageSizeMd, // default
                sm: imageSizeSm, // small 
                md: imageSizeMd, // medium
                lg: imageSizeLg, // large 
                xl: imageSizeXl, // extra large screen
              ), // Adjust height as needed
              fit: BoxFit.cover, // Adjust image fitting as needed
            ),
          ),
        ),
      )
    );
  }
}

class FadeInText extends StatefulWidget{
  @override
  _FadeInTextState createState() => _FadeInTextState();
}

class _FadeInTextState extends State<FadeInText>{
  bool _isVisible = false;
  
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context){
    return Row();
  }
}