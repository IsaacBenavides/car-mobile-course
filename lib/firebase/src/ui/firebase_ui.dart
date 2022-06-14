import 'package:car_mobile_course/firebase/src/controllers/firebase_ui_contoller.dart';
import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:car_mobile_course/firebase/src/provider.dart';
import 'package:car_mobile_course/firebase/src/ui/routes/names.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase UI'),
        leading: const BackButton(),
      ),
      body: Center(
        child: StreamBuilder<Registers>(
            stream: _controller.registersStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Hubo un error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return SizedBox(
                  child: ListView.builder(
                      itemCount: snapshot.data!.registers!.length,
                      itemBuilder: (_, i) => ListTile(
                            leading: Hero(
                              tag: snapshot.data!.registers![i].image!,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data!.registers![i].image!),
                              ),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            title: Text(snapshot.data!.registers![i].name!),
                            subtitle:
                                Text(snapshot.data!.registers![i].lastName!),
                            onTap: () => Navigator.of(context).pushNamed(
                                Names.details,
                                arguments: snapshot.data!.registers![i]),
                          )),
                );
              }
              return const Text("No hay datos");
            }),
      ),
    );
  }
}
