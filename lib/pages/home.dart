import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';
import 'package:optimum/pages/side_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildTabItem({
    required String asset,
    required String text,
    required bool isSelected,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(asset,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.darkNeutrals100),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.darkNeutrals100,
            ),
          ),
          if (isSelected)
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.light50,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            sizeConstraints: BoxConstraints.tight(const Size(76, 76)),
          )),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.light50,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 16.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  icon: Image.asset("assets/icons/menu.png"),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  }),
            ),
          ),
          actions: [
            Container(
                padding: const EdgeInsets.only(right: 24.0, top: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: const Border.fromBorderSide(BorderSide(
                        color: Colors.white,
                        width: 5.0,
                      )),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.05),
                            blurRadius: 15.0,
                            offset: const Offset(0, 5.0))
                      ]),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://source.unsplash.com/random/?person",
                    ),
                  ),
                )),
          ],
        ),
        backgroundColor: AppColors.light50,
        drawer: const SideDrawer(),
        body: const Text("Home"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 3.0,
          backgroundColor: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 8.0),
            borderRadius: BorderRadius.all(Radius.circular(76.0)),
          ),
          child: Image.asset("assets/icons/camera.png",
              color: Colors.white, height: 76, width: 76),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem(
                    asset: currentIndex == 0
                        ? "assets/icons/home_fill.png"
                        : "assets/icons/home.png",
                    text: 'Home',
                    isSelected: currentIndex == 0,
                    index: 0),
                _buildTabItem(
                    asset: currentIndex == 1
                        ? "assets/icons/dumble_fill.png"
                        : "assets/icons/dumble.png",
                    text: 'Trainings',
                    isSelected: currentIndex == 1,
                    index: 1),
                const SizedBox(width: 76),
                _buildTabItem(
                    asset: currentIndex == 2
                        ? "assets/icons/chat_fill.png"
                        : "assets/icons/chat.png",
                    text: 'Chat',
                    isSelected: currentIndex == 2,
                    index: 2),
                _buildTabItem(
                    asset: currentIndex == 3
                        ? "assets/icons/calendar_fill.png"
                        : "assets/icons/calendar.png",
                    text: 'Bookings',
                    isSelected: currentIndex == 3,
                    index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
