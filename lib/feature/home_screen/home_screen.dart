import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:property_management_system/core/Drawer/bloc/home_drawer_cubit/cubit/home_drawer_cubit.dart';
import 'package:property_management_system/core/Drawer/drawer.dart';
import 'package:property_management_system/core/componets/text_form_field.dart';
import 'package:property_management_system/core/constant/colors.dart';
import 'package:property_management_system/feature/add_screen/add_screen.dart';
import 'package:property_management_system/feature/home_screen/bloc/cubit/home_cubit.dart';
import 'package:property_management_system/feature/reigster/reigster_screen.dart';
import 'package:property_management_system/injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sl<HomeCubit>().initState();
  }

  @override
  void dispose() {
    sl<HomeCubit>().identity = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          listener: (ctx, state) {
            if (state is HomeDrawerLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
              if (state is HomeDrawerLoaded) {
                Navigator.popUntil(context, (route) => false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReigsterScreen(),
                    ));
              }
            }
          },
          bloc: sl<HomeDrawerCubit>(),
        )
      ],
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddScreen()));
          }),
          //drawer: AppDrawer(),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/home4.jpg',
                        ),
                      ),
                      color: Colors.grey.shade900,
                      boxShadow: [BoxShadow(blurRadius: 25)],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    child: Text(
                      'Let find your property, my friend ?',
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 25,
                    child: Container(
                      height: 50,
                      width: 280,
                      child: TextFormField(
                        cursorColor: white,
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w700,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: white.withOpacity(0.3), width: 1.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: white.withOpacity(0.3), width: 1.0),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(blurRadius: 25)],
                        color: white.withOpacity(0.9),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 25,
                    child: CircleAvatar(
                      backgroundColor: white.withOpacity(0.9),
                      radius: 24,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_list_alt),
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'More Property',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View all',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  realEstateItem(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget realEstateItem() {
  return GestureDetector(
    onTap: () {
      print('object');
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  boxShadow: [
                    BoxShadow(blurRadius: 20),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/home4.jpg'),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 25,
                child: Row(
                  children: [
                    Text(
                      'Name Property',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      '${160} ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 22,
                child: Text(
                  'loaction Property',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 22,
                child: Text(
                  '80 views',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
