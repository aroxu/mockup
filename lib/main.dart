import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mockup/ui/dialog/smoothDialog.dart';
import 'package:mockup/ui/page/main.dart';
import 'package:mockup/ui/widget/bottomNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      title: 'Foot Print',
      home: MyHomePage(title: 'Foot Print'),
      darkTheme: neumorphicDefaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.alegreya(),
        ),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: avoid_print
        onPressed: () {
          createSmoothDialog(
              context,
              "일기 추가 버튼 눌림",
              const Text("TODO: 작업 추가"),
              TextButton(
                child: const Text("확인"),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              null,
              false);
        },
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 24, 29, 54),
        tooltip: "새 일기 추가",
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: const MainPage(),
    );
  }
}
