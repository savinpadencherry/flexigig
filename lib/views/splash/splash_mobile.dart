part of splash_view;

class _SplashMobile extends StatefulWidget {
  const _SplashMobile();

  @override
  State<_SplashMobile> createState() => _SplashMobileState();
}

class _SplashMobileState extends State<_SplashMobile>
    with TickerProviderStateMixin {
  late final AnimationController offsetController;
  late final AnimationController sizeController;
  late final Animation<Offset> offsetAnimation;
  late final Animation<Size> sizeAnimation;
  bool _showSplashImage = false;

  @override
  void initState() {
    offsetController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    sizeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    offsetAnimation =
        Tween<Offset>(begin: const Offset(120, 0), end: const Offset(70, 350))
            .animate(
      CurvedAnimation(parent: offsetController, curve: Curves.easeIn),
    )..addListener(() {
            setState(() {});
          });
    offsetController.forward();
    sizeAnimation = Tween<Size>(
            begin: const Size(250, 20), end: const Size(250, 250))
        .animate(
            CurvedAnimation(parent: sizeController, curve: Curves.bounceInOut))
      ..addListener(() {
        setState(() {});
      });
    offsetAnimation.addStatusListener((status) {
      log('offset listener value ${status.index}', name: 'splash_mobile.dart');
      if (status == AnimationStatus.completed) {
        offsetController.stop();
        sizeController.forward();
      }
    });
    sizeAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        sizeController.stop();
        setState(() {
          _showSplashImage = true;
        });
      }
    });
    goLandingPage();
    super.initState();
  }

  @override
  void dispose() {
    offsetController.dispose();
    sizeController.dispose();
    super.dispose();
  }

  goLandingPage() {
    Future.delayed(const Duration(seconds: 5), () {
      locator<NavigatorService>().buildAndPushReplacement(const HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.bounceOut,
        child: _showSplashImage
            ? Image.asset(
                'images/splash.png',
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              )
            : Stack(
                children: [
                  Positioned(
                    top: offsetAnimation.value.dy,
                    right: offsetAnimation.value.dx,
                    child: Image.asset(
                      'images/lotus.png',
                      height: sizeAnimation.value.height,
                      width: sizeAnimation.value.width,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
