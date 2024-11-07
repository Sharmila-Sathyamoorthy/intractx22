import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    double availableHeight =
        screenHeight - appBarHeight - MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple, // Purple theme for the app bar
        elevation: 4,
        title: Row(
          children: [
            Text(
              "Vignesh's Report",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/s.png'), // Avatar image
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Weekly Progress Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "Weekly Progress",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple, // Purple for consistency
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CircularProgressIndicator(
                              value: 0.5, // Example dynamic value
                              color: Colors.purple,
                              backgroundColor: Colors.grey[200],
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total time spent: 3-4 hrs"),
                                Text("No of modules finished: 5"),
                                Text("Last activity date: Sept 22"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Emotional Status Over the Week
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emotional Status Over the Week",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                Colors.purple, // Purple theme for consistency
                          ),
                        ),
                        SizedBox(height: 10),
                        SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <CartesianSeries>[
                            ColumnSeries<EmotionData, String>(
                              dataSource: [
                                EmotionData('Mon', 60, Colors.green),
                                EmotionData('Tue', 50, Colors.blue),
                                EmotionData('Wed', 40, Colors.orange),
                                EmotionData('Thu', 70, Colors.purple),
                                EmotionData('Fri', 80, Colors.red),
                                EmotionData('Sat', 60, Colors.yellow),
                                EmotionData('Sun', 90, Colors.green),
                              ],
                              xValueMapper: (EmotionData data, _) => data.day,
                              yValueMapper: (EmotionData data, _) => data.value,
                              pointColorMapper: (EmotionData data, _) =>
                                  data.color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Overall Progress Chart (Only Classroom, Playground, and City)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overall Progress",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                Colors.purple, // Purple theme for consistency
                          ),
                        ),
                        SizedBox(height: 10),
                        SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <CartesianSeries>[
                            ColumnSeries<ProgressData, String>(
                              dataSource: [
                                ProgressData('Classroom', 60, Colors.purple),
                                ProgressData('Playground', 50, Colors.blue),
                                ProgressData('City', 70, Colors.green),
                              ],
                              xValueMapper: (ProgressData data, _) =>
                                  data.activity,
                              yValueMapper: (ProgressData data, _) =>
                                  data.progress,
                              pointColorMapper: (ProgressData data, _) =>
                                  data.color,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProgressLegend(
                                color: Colors.purple, label: 'Classroom'),
                            ProgressLegend(
                                color: Colors.blue, label: 'Playground'),
                            ProgressLegend(color: Colors.green, label: 'City'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Overall Improvement
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overall Improvement",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Classroom: 20% improvement"),
                        Text("Playground: 15% improvement"),
                        Text("City: 10% improvement"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressData {
  final String activity;
  final double progress;
  final Color color;

  ProgressData(this.activity, this.progress, this.color);
}

class EmotionData {
  final String day;
  final double value;
  final Color color;

  EmotionData(this.day, this.value, this.color);
}

class ProgressLegend extends StatelessWidget {
  final Color color;
  final String label;

  ProgressLegend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
