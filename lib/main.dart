import 'package:e_commerce/core/const/appconst.dart';
import 'package:e_commerce/data_layer/remote_services/user_remoteservices/user_remote.dart';
import 'package:e_commerce/data_layer/repositery/userdatarepo.dart';
import 'package:e_commerce/domain_layer/repositery/user_repo/user_repo.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/login_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/profile_usecase.dart';
import 'package:flutter/material.dart';

import 'core/cachehelper/cachehelper.dart';
import 'core/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void getData() async {
    final result =
        await ProFileUseCase(gitIt()).excute(CacheHelper.getData(key: 'token'));

    print(result);

    print(CacheHelper.getData(key: 'token'));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
