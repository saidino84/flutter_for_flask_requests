import 'package:flask_reqsts/app/pages/home/home_bindings.dart';
import 'package:flask_reqsts/shared.dart';
import 'app/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      showSemanticsDebugger: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:'/',getPages:[GetPage(name: '/',page:()=>HomePage(),binding:HomeBindings(),),],
    );
  }
}
