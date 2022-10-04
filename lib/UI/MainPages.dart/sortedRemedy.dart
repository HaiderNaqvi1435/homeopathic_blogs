import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:homeopathic_blogs/Core/Models/MateriaData.dart';
import 'package:homeopathic_blogs/Core/Providers/DataProvider.dart';
import 'package:homeopathic_blogs/UI/MainPages.dart/Remedydetails.dart';
import 'package:provider/provider.dart';

class Remedypage extends StatefulWidget {
  Remedypage({Key? key, this.materiaData}) : super(key: key);
  MateriaData? materiaData;
  @override
  State<Remedypage> createState() => _RemedypageState();
}

class _RemedypageState extends State<Remedypage>
    with SingleTickerProviderStateMixin {
  bool visible = true;
  ScrollController listController = ScrollController();
  ScrollController columnController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataaa, child) {
        dataaa.sortedremedy = dataaa.remedylist
            .where((element) => element.materia == widget.materiaData!.name)
            .toList();

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            controller: columnController,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16, right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          // width: 150,
                          child: Image.asset(
                            widget.materiaData!.image!,
                          ),
                        ),
                        Text(
                          widget.materiaData!.name ?? "",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          widget.materiaData!.era ?? "",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.materiaData!.details ?? "",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollUpdateNotification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          print('Reached the bottom');
                          columnController.animateTo(
                              columnController.position.maxScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn);
                        } else if (notification.metrics.pixels ==
                            notification.metrics.minScrollExtent) {
                          print('Reached the top');
                          columnController.animateTo(
                              columnController.position.minScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn);
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                      controller: listController,
                      itemCount: dataaa.sortedremedy.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.black38,
                                  width: 0),
                              borderRadius: BorderRadius.zero),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Remedydetails(
                                      remedyData: dataaa.sortedremedy[index]),
                                ));
                          },
                          dense: true,
                          leading: Text("${index + 1}"),
                          title: Text(
                            dataaa.sortedremedy[index].remedy!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black54),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
   // onNotification: (notification) {
        
        //   ScrollDirection direction = notification.direction;
        //   setState(() {
        //     if (direction == ScrollDirection.reverse) {
        //       // Future.delayed(Duration(seconds: 3), () {
        //       visible = false;
        //       // });
        //     } else if (direction == ScrollDirection.forward) {
        //       Future.delayed(Duration(seconds: 3), () {
        //         visible = true;
        //       });
        //     }
        //   });
        //   return true;
        // },