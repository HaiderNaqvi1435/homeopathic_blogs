import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homeopathic_blogs/Core/Providers/DataProvider.dart';
import 'package:homeopathic_blogs/UI/MainPages.dart/Materiapage.dart';
import 'package:homeopathic_blogs/UI/MainPages.dart/Newsfeed.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  TextEditingController searchcont = TextEditingController();
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  bool searchbar = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, mydata, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: searchbar == true ? Colors.white : null,
          title: searchbar == true
              ? TextFormField(
                  autofocus: true,
                  onChanged: ((value) {
                    if (tabController!.index == 1) {
                      if (value != null || value != "") {
                        setState(() {
                          mydata.doctors = mydata.materia
                              .where((element) => element.name!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      } else {
                        setState(() {
                          mydata.doctors = List.from(mydata.materia);
                        });
                      }
                    } else {
                      if (value != null || value != "") {
                        setState(() {
                          mydata.sortremedy2 = mydata.remedylist
                              .where((element) => element.remedy!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      } else {
                        setState(() {
                          mydata.sortremedy2 = List.from(mydata.remedylist);
                        });
                      }
                    }
                  }),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    hintText: "Search",
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                        onPressed: (() {
                          setState(() {
                            searchbar = !searchbar;
                            mydata.doctors = List.from(mydata.materia);

                            mydata.sortremedy2 = List.from(mydata.remedylist);

                            searchcont.clear();
                          });
                        }),
                        icon: Icon(Icons.close)),
                  ),
                )
              : Text("App Name"),
          actions: [
            if (searchbar == false)
              IconButton(
                  onPressed: () {
                    setState(() {
                      searchbar = !searchbar;
                    });
                  },
                  icon: Icon(Icons.search)),
          ],
          bottom: TabBar(
            labelColor: searchbar ? Colors.green : Colors.white,
            indicatorColor: searchbar ? Colors.green : Colors.white,
            controller: tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.person),
              )
            ],
          ),
        ),
        body: TabBarView(controller: tabController, children: [
          Newsfeed(),
          MateriaPage(),
        ]),
      ),
    );
  }
}
