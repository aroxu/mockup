import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mockup/ui/dialog/smoothDialog.dart';
import 'package:mockup/ui/page/main.dart';

void main() {
  runApp(
    const FootPrint(),
  );
}

class FootPrint extends StatelessWidget {
  const FootPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "Foot Print";
    return const NeumorphicApp(
      title: title,
      home: FootPrintPage(title: title),
      darkTheme: neumorphicDefaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

class FootPrintPage extends StatefulWidget {
  const FootPrintPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FootPrintPage> createState() => _FootPrintPageState();
}

class _FootPrintPageState extends State<FootPrintPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets systemPadding =
        MediaQuery.of(context).viewPadding; // 시스템 기본 padding값 (상태바 및 SafeArea)
    double viewHeight =
        (MediaQuery.of(context).size.height - (systemPadding.top)) * 0.1;

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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: Stack(
        alignment: const FractionalOffset(.5, 1.0),
        children: [
          Container(
            height: viewHeight,
            color: const Color.fromARGB(255, 24, 29, 54),
            child: SafeArea(
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: const <Tab>[
                  Tab(
                    icon: Icon(Icons.person_add, color: Colors.white),
                  ),
                  Tab(
                      icon: Icon(
                    Icons.directions_run,
                    color: Colors.white,
                  )),
                  Tab(
                    icon: Icon(Icons.edit_note, color: Colors.white),
                  ),
                  Tab(
                    icon: Icon(Icons.ac_unit, color: Colors.white),
                  ),
                ],
                controller: controller,
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const MainPage(),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text("Page 2"),
            ),
          ),
          Container(
            color: Colors.grey,
            child: const Center(
              child: Text("Page 3"),
            ),
          ),
          Container(
            color: Colors.red,
            child: const Center(
              child: Text("Page 4"),
            ),
          ),
        ],
      ),
    );
  }
}
