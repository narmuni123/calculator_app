import 'package:calculator_app/main.dart';
import 'package:calculator_app/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Stream<List<CalculatorData>> streamData;

  @override
  void initState() {
    super.initState();

    streamData = objectBox.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                StreamBuilder<List<CalculatorData>>(
                  stream: streamData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final calData = snapshot.data!;

                      return (calData.isEmpty)
                          ? const Center(
                              child: Text(
                                "No History",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  (calData.length >= 10) ? 10 : calData.length,
                              itemBuilder: (context, index) {
                                final data = calData[index];
                                return ListTile(
                                  title: Text(data.data),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () =>
                                        objectBox.deleteData(data.id),
                                  ),
                                );
                              },
                            );
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      objectBox.deleteAll();
                    },
                    child: const Text(
                      "Clear History",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
