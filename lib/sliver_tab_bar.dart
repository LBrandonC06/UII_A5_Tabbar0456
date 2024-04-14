import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act12NavBar_FlutterFlow/banner-comex-app.jpg";

  List<String> miImages = [
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act12NavBar_FlutterFlow/banner-comex-app.jpg",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act13GridView_FluttewFlow_Cano/Amor.jpg",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act12NavBar_FlutterFlow/Carrito.png",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act12NavBar_FlutterFlow/Ubicación.jpg",
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "Comex",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff100b2b),
                      backgroundColor: Color(0x000b0a1f)),
                ),
                background: Image.network(
                  image,
                  fit: BoxFit.cover,
                ))),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: const Color(0xff48a3ed),
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: "Inicio",
                ),
                Tab(
                  text: "Colores",
                ),
                Tab(
                  text: "Carrito",
                ),
                Tab(
                  text: "Nosotros",
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 800,
            child: Padding(
                padding: EdgeInsets.all(50.0),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Text(
                        "Jesús Rafael Cano Flores\nBienvenido a Comex\n21308051280440"),
                    Text(
                        "Jesús Rafael Cano Flores\nColores de Comex\n21308051280440"),
                    Text(
                        "Jesús Rafael Cano Flores\nNo tienes artículos en tu carrito\n21308051280440"),
                    Text(
                        "Jesús Rafael Cano Flores\nNosotros somos Comex\n21308051280440"),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
