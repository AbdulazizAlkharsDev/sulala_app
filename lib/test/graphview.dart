import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';

class TreeViewPage extends StatefulWidget {
  const TreeViewPage({super.key});

  @override
  State<TreeViewPage> createState() => _TreeViewPageState();
}

const String name = "Harry Potter";
const String sex = 'Male';
const String id = "12345";
const String tag = 'Borrowed';
const bool selected = false;

ImageProvider<Object>? getImage() {
  return const AssetImage("assets/avatars/120px/Horse.png");
}

class _TreeViewPageState extends State<TreeViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: Container(
                padding: EdgeInsets.all(
                    (6 * MediaQuery.of(context).size.width) / 375),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grayscale10,
                ),
                child: const Icon(Icons.arrow_back_rounded,
                    color: AppColors.grayscale90),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Harry’s Family Tree',
              style: AppFonts.headline3(color: AppColors.grayscale90),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InteractiveViewer(
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(100),
                    minScale: 0.01,
                    maxScale: 5.6,
                    child: GraphView(
                      graph: graph,
                      algorithm: BuchheimWalkerAlgorithm(
                          builder, TreeEdgeRenderer(builder)),
                      paint: Paint()
                        ..color = AppColors.primary10
                        ..strokeWidth = 5
                        ..style = PaintingStyle.stroke,
                      builder: (Node node) {
                        // I can decide what widget should be shown here based on the id
                        var a = node.key?.value as int;
                        return animalCard(a);
                      },
                    )),
              ),
            ],
          )),
    );
  }

  Widget animalCard(int a) {
    return InkWell(
      onTap: () {
        // print('clicked');
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            (selected)
                ? Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 255, 237, 74), // Shadow color
                          blurRadius: 10, // Spread of the shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: getImage(),
                      radius: MediaQuery.of(context).size.width * 0.0875,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: getImage(),
                    radius: MediaQuery.of(context).size.width * 0.0875,
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.009),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$a',
                  style: AppFonts.body1(
                    color: AppColors.grayscale90,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                sex.toLowerCase() != "male"
                    ? Image.asset(
                        "assets/icons/frame/24px/16_Gender_female.png")
                    : Image.asset("assets/icons/frame/24px/16_Gender_male.png"),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.004),
            Text(
              'ID #$id',
              style: AppFonts.caption2(
                color: AppColors.grayscale80,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.004),
            Text(
              tag,
              style: AppFonts.caption3(
                color: AppColors.grayscale80,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node.Id(10);
    final node11 = Node.Id(11);
    final node12 = Node.Id(12);

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);
    graph.addEdge(node1, node4, paint: Paint()..strokeJoin = StrokeJoin.round);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    graph.addEdge(node11, node12);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (100)
      ..subtreeSeparation = (100)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
