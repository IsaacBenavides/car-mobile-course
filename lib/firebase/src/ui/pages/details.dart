import 'package:car_mobile_course/colors.dart';
import 'package:car_mobile_course/firebase/src/controllers/details_controller.dart';
import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:car_mobile_course/firebase/src/provider.dart';
import 'package:car_mobile_course/firebase/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsController _controller;
  @override
  void initState() {
    super.initState();
    _controller = DetailsController()..init(Provider.of(context).repository);
  }

  @override
  Widget build(BuildContext context) {
    final Register _register =
        ModalRoute.of(context)!.settings.arguments as Register;

    _controller.callRegisterByUser(_register.id!);
    final Responsive _responsive = Responsive.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: StreamBuilder<Register>(
            stream: _controller.registerStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Hubo un error"),
                );
              }
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _UserInfoContainer(
                        responsive: _responsive, register: snapshot.data!),
                    SizedBox(height: _responsive.hp(1.5)),
                    _DataUserContainer(register: snapshot.data!),
                  ],
                );
              }
              return const Center(
                child: Text("No hay datos"),
              );
            },
          ),
        )),
      ),
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    Key? key,
    required Responsive responsive,
    required Register register,
  })  : _responsive = responsive,
        _register = register,
        super(key: key);

  final Responsive _responsive;
  final Register _register;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _responsive.width,
      child: Column(
        children: [
          _TopInfoContainer(responsive: _responsive, register: _register),
          _BottomInfoContainer(responsive: _responsive, register: _register)
        ],
      ),
    );
  }
}

class _TopInfoContainer extends StatelessWidget {
  const _TopInfoContainer({
    Key? key,
    required Responsive responsive,
    required Register register,
  })  : _responsive = responsive,
        _register = register,
        super(key: key);

  final Responsive _responsive;
  final Register _register;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _responsive.wp(7)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Hero(
                tag: _register.image!,
                child: Container(
                    width: _responsive.wp(35),
                    height: _responsive.wp(35),
                    margin: EdgeInsets.symmetric(vertical: _responsive.hp(2)),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.network(_register.image!).image,
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: _responsive.hp(2)),
              child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close)),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomInfoContainer extends StatelessWidget {
  const _BottomInfoContainer({
    Key? key,
    required Responsive responsive,
    required Register register,
  })  : _responsive = responsive,
        _register = register,
        super(key: key);

  final Responsive _responsive;
  final Register _register;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _responsive.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _responsive.wp(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _register.name! + " " + _register.lastName!,
              style: TextStyle(
                  fontSize: _responsive.dp(4.5), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: _responsive.hp(2)),
            Text(
              _register.phone!.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: _responsive.dp(2),
                color: Colors.grey[400],
              ),
            ),
            Text(
              _register.license!.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: _responsive.dp(2),
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataUserContainer extends StatefulWidget {
  final Register register;

  const _DataUserContainer({Key? key, required this.register})
      : super(key: key);
  @override
  State<_DataUserContainer> createState() => _DataUserContainerState();
}

class _DataUserContainerState extends State<_DataUserContainer> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive.of(context);
    return SizedBox(
      width: _responsive.width,
      child: LayoutBuilder(builder: (context, c) {
        return Column(
          children: [
            SizedBox(
              width: c.maxWidth * 0.9,
              child: CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: Colors.grey[400]!,
                  thumbColor: AppColors.primary,
                  groupValue: _currentIndex,
                  children: {
                    0: Text(
                      "Carro",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.7,
                          fontSize: _responsive.dp(2)),
                    ),
                    1: Text(
                      "Servicio",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.7,
                          fontSize: _responsive.dp(2)),
                    ),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _currentIndex = value!;
                    });
                    _pageController.animateToPage(value!,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut);
                  }),
            ),
            SizedBox(
              height: _responsive.hp(55),
              width: _responsive.width,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _CarInfoContainer(
                      responsive: _responsive, register: widget.register),
                  _ServiceInfoContainer(
                      responsive: _responsive, register: widget.register),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class _CarInfoContainer extends StatelessWidget {
  const _CarInfoContainer({
    Key? key,
    required Responsive responsive,
    required this.register,
  })  : _responsive = responsive,
        super(key: key);

  final Responsive _responsive;
  final Register register;

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w600,
        fontSize: _responsive.dp(3));
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _responsive.wp(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Color: ${register.car!.color!}", style: _textStyle),
            SizedBox(height: _responsive.hp(3)),
            Text("Marca: ${register.car!.brand!}", style: _textStyle),
            SizedBox(height: _responsive.hp(3)),
            Text("Modelo: ${register.car!.model!}", style: _textStyle),
            SizedBox(height: _responsive.hp(3)),
            Text("Placa: ${register.car!.plate!}", style: _textStyle),
          ],
        ),
      ),
    );
  }
}

class _ServiceInfoContainer extends StatelessWidget {
  const _ServiceInfoContainer({
    Key? key,
    required Responsive responsive,
    required this.register,
  })  : _responsive = responsive,
        super(key: key);

  final Responsive _responsive;
  final Register register;
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: _responsive.dp(4));
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _responsive.wp(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Lavado: ${register.service!.wash}", style: _textStyle),
            SizedBox(height: _responsive.hp(3)),
            Text("Polish: ${register.service!.polish}", style: _textStyle),
            SizedBox(height: _responsive.hp(3)),
            Text("Tapiceria: ${register.service!.upholstery}",
                style: _textStyle),
          ],
        ),
      ),
    );
  }
}
