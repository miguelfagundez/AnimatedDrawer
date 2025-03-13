import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Drawer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _animatedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _animatedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1.0)],
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 120,
                width: 120,
                margin: EdgeInsets.only(top: 20, bottom: 60),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: FlutterLogo(),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.account_box),
                title: Text('Account'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.favorite),
                title: Text('Favorite'),
              ),
              Spacer(),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animated Drawer'),
          leading: IconButton(
            onPressed: () {
              _animatedDrawerController.showDrawer();
            },
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _animatedDrawerController,
              builder: (_, value, _) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  key: ValueKey<bool>(value.visible),
                  child: Icon(value.visible ? Icons.clear : Icons.menu),
                );
              },
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
