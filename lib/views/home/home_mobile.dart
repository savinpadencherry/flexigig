part of home_view;

class _HomeMobile extends StatefulWidget {
  const _HomeMobile();

  @override
  State<_HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<_HomeMobile> {
  String? username;
  final int _numPages = 5;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                firstpage(),
                secondpage(),
                thirdpage(),
                fourthpage(),
                fifthpage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 740.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildPageIndicator(),
            ),
          )
        ],
      ),
    );
  }

  firstpage() {
    return Image.asset(
      'images/first.png',
      fit: BoxFit.fill,
    );
  }

  secondpage() {
    return Image.asset(
      'images/second.png',
      fit: BoxFit.fill,
    );
  }

  thirdpage() {
    return Image.asset(
      'images/third.png',
      fit: BoxFit.fill,
    );
  }

  fourthpage() {
    return Image.asset(
      'images/fourth.png',
      fit: BoxFit.fill,
    );
  }

  fifthpage() {
    return Stack(
      children: [
        Image.asset(
          'images/fifth.png',
          fit: BoxFit.fill,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.608,
          left: MediaQuery.of(context).size.width * 0.57,
          child: SizedBox(
            height: 90,
            width: 168,
            child: MaterialButton(
              onPressed: () {
                locator<NavigatorService>().buildAndPush(
                  const LoginView(),
                );
              },
              elevation: 0.0,
              highlightElevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              color: const Color.fromARGB(255, 112, 148, 211),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            ),
          ),
        )
      ],
    );
  }
}
