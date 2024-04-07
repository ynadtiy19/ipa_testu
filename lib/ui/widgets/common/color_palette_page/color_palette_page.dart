import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_effects/hyper_effects.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//颜色调色板页面

class ColorPalettePage extends StatefulWidget {
  const ColorPalettePage({super.key});

  @override
  State<ColorPalettePage> createState() => _ColorPalettePageState();
}

class _ColorPalettePageState extends State<ColorPalettePage> {
  final Map<String, List<Color>> palettes = const {
    'Cappuccino': [
      Color(0xFF4b3832),
      Color(0xFF854442),
      Color(0xFFfff4e6),
      Color(0xFF3c2f2f),
      Color(0xFFbe9b7b),
    ],
    'Beach': [
      Color(0xFF96ceb4),
      Color(0xFFffeead),
      Color(0xFFff6f69),
      Color(0xFFffcc5c),
      Color(0xFF88d8b0),
    ],
    'Kirkjufell': [
      Color(0xFF455982),
      Color(0xFF2c2521),
      Color(0xFF6078c6),
      Color(0xFFd7b98f),
      Color(0xFFcae3f0),
    ],
    'Volcarona': [
      Color(0xFF626262),
      Color(0xFFe6e6e6),
      Color(0xFFc54a41),
      Color(0xFFee7318),
      Color(0xFF94cdd5),
    ],
    'Ariana Grande': [
      Color(0xFFf4c5cb),
      Color(0xFF010101),
      Color(0xFFfdfefe),
      Color(0xFFbcbbbb),
      Color(0xFFeae4fd),
    ],
    'Grand Manan Sunset': [
      Color(0xFFd04b2f),
      Color(0xFFff6f61),
      Color(0xFFffb9ad),
      Color(0xFFfbeee6),
      Color(0xFFc8506f),
    ],
    'Nature Goddess': [
      Color(0xFF00909e),
      Color(0xFF6fb653),
      Color(0xFFffb9ad),
      Color(0xFFff6f61),
      Color(0xFFd04b2f),
    ],
    'Warm Steel': [
      Color(0xFFebb463),
      Color(0xFFdebe90),
      Color(0xFFc1ae90),
      Color(0xFF797062),
      Color(0xFF312e28),
    ],
    'Valorant Faux': [
      Color(0xFF8e8b82),
      Color(0xFFfdf3e3),
      Color(0xFFff0096),
      Color(0xFF3d3939),
      Color(0xFFb76e79),
    ],
    'Maliz Duskryr': [
      Color(0xFFdfd8ce),
      Color(0xFF56625d),
      Color(0xFF45434b),
      Color(0xFF633c39),
      Color(0xFF281214),
    ],
    'Eilith Shadownhorn': [
      Color(0xFF7a555c),
      Color(0xFF89644a),
      Color(0xFF54383e),
      Color(0xFF311011),
      Color(0xFF1d0407),
    ],
    'Reymoira Vidromis': [
      Color(0xFFb19f83),
      Color(0xFFbbd3d8),
      Color(0xFFe8d487),
      Color(0xFF5c3924),
      Color(0xFF235162),
    ],
    'Warm Sugar Cookies': [
      Color(0xFFfff8e5),
      Color(0xFFf8e4b2),
      Color(0xFFf2d9a4),
      Color(0xFFd1aa73),
      Color(0xFFbd9660),
    ]
  };

  int lastPage = 0;
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
        // textTheme: GoogleFonts.robotoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 64),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Look And Feel',
                style: GoogleFonts.notoSerif().copyWith(fontSize: 28),
              ),
              titleSpacing: 0,
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Accent Colour',
                      style: GoogleFonts.inter()
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ShaderMask(
                      shaderCallback: (rect) => LinearGradient(
                        colors: palettes.values.elementAt(currentPage),
                      ).createShader(rect),
                      child: Text(
                        palettes.keys.elementAt(lastPage).toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      )
                          .roll(
                            palettes.keys.elementAt(currentPage).toUpperCase(),
                            staggerSoftness: 6,
                            reverseStaggerDirection: false,
                            tapeSlideDirection: TapeSlideDirection.down,
                            tapeCurve: Curves.easeOutBack,
                            widthCurve: Curves.easeOutQuart,
                            widthDuration: const Duration(milliseconds: 500),
                          )
                          .animate(
                            trigger: currentPage,
                            curve: Curves.linear,
                            duration: const Duration(milliseconds: 800),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 128,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: palettes.keys.length,
                        onPageChanged: (int page) {
                          setState(() {
                            lastPage = currentPage;
                            currentPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                          final paletteName = palettes.keys.elementAt(index);
                          final paletteColors = palettes[paletteName]!;

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (final color in paletteColors)
                                Expanded(
                                  child: ColoredBox(color: color),
                                )
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: palettes.keys.length,
                        effect: WormEffect(
                          offset: 8,
                          dotWidth: 10,
                          dotHeight: 10,
                          spacing: 6,
                          radius: 12,
                          activeDotColor: Colors.white,
                          dotColor: Colors.white.withOpacity(0.25),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        }),
      ),
    );
  }
}
