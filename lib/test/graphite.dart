import 'package:flutter/material.dart';
import 'package:graphite/graphite.dart';
import '../src/theme/colors/colors.dart';
import '../src/theme/fonts/fonts.dart';
import '../src/widgets/other/family_tree_item.dart';

List<NodeInput> flowChart = [
  // NodeInput(
  //   id: "father",
  //   next: [
  //     EdgeInput(outcome: "mainAnimal", type: EdgeArrowType.both),
  //   ],
  // ),
  // NodeInput(id: "mother", next: [
  //   EdgeInput(outcome: "mainAnimal"),
  // ]),
  NodeInput(id: "mainAnimal", next: [
    EdgeInput(outcome: "startPoint"),
  ]),
  NodeInput(
      id: "startPoint",
      next: [
        EdgeInput(outcome: "child1"),
        EdgeInput(outcome: "child2"),
        EdgeInput(outcome: "child3"),
        EdgeInput(outcome: "child4"),
        EdgeInput(outcome: "child5"),
      ],
      size: const NodeSize(width: 0, height: 0)),
  NodeInput(id: "child1", next: []),
  NodeInput(id: "child2", next: []),
  NodeInput(id: "child3", next: []),
  NodeInput(id: "child4", next: []),
  NodeInput(id: "child5", next: []),
];

enum FlowStepType { mainAnimal, startPoint, child, father, mother }

class FlowStep {
  final FlowStepType type;
  FlowStep({required this.type});
}

Map<String, FlowStep> data = {
  // "father": FlowStep(type: FlowStepType.father),
  // "mother": FlowStep(type: FlowStepType.mother),
  "mainAnimal": FlowStep(type: FlowStepType.mainAnimal),
  "startPoint": FlowStep(type: FlowStepType.startPoint),
  "child1": FlowStep(type: FlowStepType.child),
  "child2": FlowStep(type: FlowStepType.child),
  "child3": FlowStep(type: FlowStepType.child),
  "child4": FlowStep(type: FlowStepType.child),
  "child5": FlowStep(type: FlowStepType.child),
};

class FlowchartPage extends StatefulWidget {
  const FlowchartPage({Key? key}) : super(key: key);
  @override
  FlowchartPageState createState() => FlowchartPageState();
}

class FlowchartPageState extends State<FlowchartPage> {
  _buildNode(NodeInput node) {
    final info = data[node.id]!;
    switch (info.type) {
      case FlowStepType.mainAnimal:
        return MainAnimal(data: info, name: node.id);
      case FlowStepType.child:
        return Child(data: info, name: node.id);
      case FlowStepType.father:
        return Father(data: info);
      case FlowStepType.mother:
        return Mother(data: info);
      case FlowStepType.startPoint:
        return StartPoint(data: info);
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.of(context).size.height / 812;
    double widthMediaQuery = MediaQuery.of(context).size.width / 375;
    final list = flowChart;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              padding: EdgeInsets.all(6 * widthMediaQuery),
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
        body: InteractiveViewer(
          minScale: 0.5,
          maxScale: 10,
          constrained: false,
          child: DirectGraph(
            list: list,
            defaultCellSize:
                Size(100 * widthMediaQuery, 150 * heightMediaQuery),
            cellPadding:
                const EdgeInsets.symmetric(vertical: -10, horizontal: 0),
            contactEdgesDistance: 0,
            orientation: MatrixOrientation.Vertical,
            nodeBuilder: (BuildContext context, NodeInput node) =>
                _buildNode(node),
            centered: true,
            minScale: .1,
            maxScale: 1,
            tipAngle: 0,
            tipLength: 5,
            paintBuilder: (edge) {
              return Paint()
                ..color = AppColors.primary10
                ..strokeJoin = StrokeJoin.round
                ..strokeWidth = 2
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke;
            },
          ),
        ),
      ),
    );
  }
}

class MainAnimal extends StatelessWidget {
  final FlowStep data;
  final String name;

  const MainAnimal({super.key, required this.data, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: () {},
        child: FamilyTreeItem(
          id: "12345",
          name: name,
          sex: 'Male',
          tag: 'Borrowed',
          selected: true,
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  final FlowStep data;
  final String name;

  const Child({super.key, required this.data, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () {},
        child: FamilyTreeItem(
          id: "12345",
          name: name,
          sex: 'Male',
          tag: 'Borrowed',
          selected: false,
        ),
      ),
    );
  }
}

class Father extends StatelessWidget {
  final FlowStep data;

  const Father({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return const FamilyTreeItem(
      id: "12345",
      name: 'Main Animal',
      sex: 'Male',
      tag: 'Borrowed',
      selected: false,
    );
  }
}

class Mother extends StatelessWidget {
  final FlowStep data;

  const Mother({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return const FamilyTreeItem(
      id: "12345",
      name: 'Main Animal',
      sex: 'Male',
      tag: 'Borrowed',
      selected: false,
    );
  }
}

class StartPoint extends StatelessWidget {
  final FlowStep data;

  const StartPoint({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
