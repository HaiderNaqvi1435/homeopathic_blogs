import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:homeopathic_blogs/Core/Providers/DataProvider.dart';
import 'package:homeopathic_blogs/UI/MainPages.dart/Remedydetails.dart';
import 'package:provider/provider.dart';

class Newsfeed extends StatefulWidget {
  Newsfeed({Key? key}) : super(key: key);

  @override
  State<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataa, child) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dataa.sortremedy2.length,
                itemBuilder: (context, index) {
                  // quillController = QuillController(
                  //     document:
                  //         Document.fromJson(dataa.remedylist[index].discrp),
                  //     selection: TextSelection.collapsed(offset: 0));
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Remedydetails(
                                remedyData: dataa.sortremedy2[index]),
                          ));
                    },

                    shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.black38,
                            width: 0),
                        borderRadius: BorderRadius.zero),
                    dense: true,
                    leading: Icon(
                      Icons.healing_outlined,
                    ),

                    //  Text("${index + 1}"),
                    title: Text(
                      dataa.sortremedy2[index].remedy!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                    subtitle: Text(
                      dataa.sortremedy2[index].materia!,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  );
                  // return Padding(
                  //   padding: EdgeInsets.only(left: 16, right: 16),
                  //   child: InkWell(
                  //     onTap: (() {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => Remedydetails(
                  //                 remedyData: dataa.remedylist[index]),
                  //           ));
                  //     }),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20)),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           SizedBox(height: 10),
                  //           Text(
                  //             dataa.remedylist[index].materia ?? "",
                  //             style: TextStyle(
                  //                 color: Colors.black54, fontSize: 12),
                  //           ),
                  //           Text(
                  //             dataa.remedylist[index].remedy ?? "",
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold, fontSize: 16),
                  //           ),
                  //           SizedBox(height: 10),
                  //           // Text(
                  //           //   Document.fromJson(jsonDecode(
                  //           //           dataa.remedylist[index].discrp))
                  //           //       .toPlainText(),
                  //           //   style:
                  //           //       TextStyle(fontSize: 12, color: Colors.black),
                  //           //   maxLines: 5,
                  //           // ),
                  //           SizedBox(height: 10),
                  //           Divider(
                  //             thickness: 1,
                  //             color: Colors.grey,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
