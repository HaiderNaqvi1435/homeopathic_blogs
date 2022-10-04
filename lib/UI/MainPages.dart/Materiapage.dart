import 'package:flutter/material.dart';
import 'package:homeopathic_blogs/Core/Models/MateriaData.dart';
import 'package:homeopathic_blogs/Core/Providers/DataProvider.dart';
import 'package:homeopathic_blogs/UI/MainPages.dart/sortedRemedy.dart';
import 'package:provider/provider.dart';

class MateriaPage extends StatefulWidget {
  MateriaPage({Key? key}) : super(key: key);

  @override
  State<MateriaPage> createState() => _MateriaPageState();
}

class _MateriaPageState extends State<MateriaPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, data, child) => Scaffold(
        body: ListView.builder(
          itemCount: data.doctors.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Remedypage(materiaData: data.doctors[index]),
                  ));
            },
            leading: ClipRRect(
                child: Image.asset(
              data.doctors[index].image!,
              fit: BoxFit.fill,
            )),
            title: Text(data.doctors[index].name!),
            subtitle: Text(
              data.doctors[index].era!,
            ),
          ),
        ),
      ),
    );
  }
}
