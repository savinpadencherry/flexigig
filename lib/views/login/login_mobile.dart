// ignore_for_file: prefer_const_constructors_in_immutables

part of login_view;

class _LoginMobile extends StatefulWidget {
  _LoginMobile();

  @override
  State<_LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<_LoginMobile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('LoginMobile')),
    );
  }
}
