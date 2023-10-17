import 'dart:math';

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
    EdgeInput(outcome: "child1"),
    EdgeInput(outcome: "child2"),
    EdgeInput(outcome: "child3"),
  ]),
  NodeInput(id: "child1", next: []),
  NodeInput(id: "child2", next: []),
  NodeInput(id: "child3", next: []),
];

enum FlowStepType { mainAnimal, child, father, mother }

class FlowStep {
  final FlowStepType type;
  FlowStep({required this.type});
}

Map<String, FlowStep> data = {
  // "father": FlowStep(type: FlowStepType.father),
  // "mother": FlowStep(type: FlowStepType.mother),
  "mainAnimal": FlowStep(type: FlowStepType.mainAnimal),
  "child1": FlowStep(type: FlowStepType.child),
  "child2": FlowStep(type: FlowStepType.child),
  "child3": FlowStep(type: FlowStepType.child),
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
            pathBuilder: (income, node, points, arrowType) {
              final points = [
                [310.0, 200.0], // X and Y coordinates of the starting point
                [310.0, 250.0], // X and Y coordinates of the ending point
              ];
              final path = Path();

              // Calculate the midpoint between the start and end points
              final startPoint = Offset(points[0][0], points[0][1]);
              final endPoint = Offset(points[1][0], points[1][1]);
              final midpoint = startPoint + (endPoint - startPoint) / 2;

              // Calculate the angle of the path with a radius of 8
              const angleRadius = 8.0;
              final angle = atan2(
                  endPoint.dy - startPoint.dy, endPoint.dx - startPoint.dx);
              final controlPoint = Offset(
                midpoint.dx + angleRadius * cos(angle - pi / 2),
                midpoint.dy + angleRadius * sin(angle - pi / 2),
              );

              // Move to the starting point
              path.moveTo(points[0][0], points[0][1]);

              // Add a dot at the starting point (you can customize the size)
              final dotRadius = 3.0;
              path.addArc(
                Rect.fromCircle(center: startPoint, radius: dotRadius),
                0,
                2 * pi,
              );

              // Add the curved line to the arrow
              path.quadraticBezierTo(
                controlPoint.dx,
                controlPoint.dy,
                points[1][0],
                points[1][1],
              );

              return path;

              // // Customize the path for each edge here
              // final path = Path();
              // path.moveTo(points[0][0], points[0][1]);

              // // You can customize the path as needed based on the incoming edge information
              // // and the points provided.

              // // For example, to create a simple curved path, you can use quadratic Bezier curve:
              // // final controlPointX = (points[0][0] + points[1][0]) / 2;
              // // final controlPointY = (points[0][1] + points[1][1]) / 2 - 50;
              // // path.quadraticBezierTo(
              // //     controlPointX, controlPointY, points[1][0], points[1][1]);

              // // Or create straight lines:
              // for (var i = 1; i < points.length; i++) {
              //   path.lineTo(points[i][0], points[i][1]);
              // }

              // return path;
            },
            list: list,
            defaultCellSize:
                Size(100 * widthMediaQuery, 140 * heightMediaQuery),
            cellPadding: EdgeInsets.symmetric(
                vertical: 36 * heightMediaQuery,
                horizontal: 44 * widthMediaQuery),
            contactEdgesDistance: 0,
            orientation: MatrixOrientation.Vertical,
            nodeBuilder: (BuildContext context, NodeInput node) =>
                _buildNode(node),
            centered: true,
            minScale: .1,
            maxScale: 1,
            clipBehavior: Clip.hardEdge,
            tipAngle: 0.5,
            tipLength: 5,
            paintBuilder: (edge) {
              return Paint()
                ..color = AppColors.primary10
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
      child: FamilyTreeItem(
        id: "12345",
        name: name,
        sex: 'Male',
        tag: 'Borrowed',
        selected: true,
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
      child: FamilyTreeItem(
        id: "12345",
        name: name,
        sex: 'Male',
        tag: 'Borrowed',
        selected: false,
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
