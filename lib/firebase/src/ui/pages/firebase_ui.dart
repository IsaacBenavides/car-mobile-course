import 'package:car_mobile_course/firebase/src/controllers/firebase_ui_controller.dart';
import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:car_mobile_course/firebase/src/provider.dart';
import 'package:car_mobile_course/firebase/src/ui/widgets/user_card.dart';
import 'package:car_mobile_course/firebase/utils/responsive.dart';
import 'package:car_mobile_course/list_buttons.dart';
import 'package:flutter/material.dart';

class FirebaseUi extends StatefulWidget {
  const FirebaseUi({Key? key}) : super(key: key);

  @override
  State<FirebaseUi> createState() => _FirebaseUiState();
}

class _FirebaseUiState extends State<FirebaseUi> {
  late FirebaseUiController _controller;
  @override
  void initState() {
    super.initState();
    _controller = FirebaseUiController()..init(Provider.of(context).repository);
    _controller.callRegister();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const ListButtons()),
          (_) => false,
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Users',
            style: TextStyle(color: Colors.white),
          ),
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const ListButtons()),
              (_) => false,
            ),
          ),
        ),
        body: Center(
          child: StreamBuilder<Registers>(
              stream: _controller.registersStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Hubo un error"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return SizedBox(
                      width: responsive.wp(100),
                      height: responsive.hp(100),
                      child: GridView.builder(
                          itemCount: snapshot.data!.registers!.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: responsive.wp(5),
                              vertical: responsive.hp(2)),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: responsive.hp(27),
                                  mainAxisSpacing: responsive.hp(2),
                                  crossAxisSpacing: responsive.wp(7)),
                          itemBuilder: (context, index) => UserCard(
                                register: snapshot.data!.registers![index],
                              )));
                }
                return const Text("No hay datos");
              }),
        ),
      ),
    );
  }
}
