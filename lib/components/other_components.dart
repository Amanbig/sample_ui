import 'package:flutter/material.dart';
import 'package:hello/components/page_component.dart';

class MyComponents extends StatefulWidget {
  const MyComponents({super.key});

  @override
  State<MyComponents> createState() => _MyComponentsState();
}

class _MyComponentsState extends State<MyComponents> {
  bool isAddNew = false;
  List<String> pages = ['Clip 1', 'Clip 2', 'Clip 3']; // List of page data

  @override
  Widget build(BuildContext context) {
    // Get the screen height to dynamically adjust padding
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust the gap as a percentage of the screen height
    double itemGap = screenHeight * 0.02; // 2% of screen height
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.4; // 40% of screen width for button width
    double buttonHeight = screenWidth * 0.12; // 12% of screen width for button height
    double fontSize = screenWidth * 0.04;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[350]!),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First button (Rearrange)
                    TextButton(
                      onPressed: () => setState(() => isAddNew = false),
                      style: ButtonStyle(
                        backgroundColor: !isAddNew
                            ? MaterialStateProperty.all(Colors.deepPurpleAccent)
                            : MaterialStateProperty.all(Colors.white),
                        fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
                      ),
                      child: Text(
                        'Rearrange',
                        style: TextStyle(
                          color: !isAddNew ? Colors.white : Colors.black,
                          fontSize: fontSize, // Dynamic font size
                        ),
                      ),
                    ),
                    // Second button (Add New Page)
                    TextButton(
                      onPressed: () => setState(() => isAddNew = true),
                      style: ButtonStyle(
                        backgroundColor: isAddNew
                            ? MaterialStateProperty.all(Colors.deepPurpleAccent)
                            : MaterialStateProperty.all(Colors.white),
                        fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
                      ),
                      child: Text(
                        'Add New Page',
                        style: TextStyle(
                          color: isAddNew ? Colors.white : Colors.black,
                          fontSize: fontSize, // Dynamic font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              'Click & Hold to rearrange the clips',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 18),
            ReorderableListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex -= 1;
                  final item = pages.removeAt(oldIndex);
                  pages.insert(newIndex, item);
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  key: ValueKey(pages[index]),
                  padding: EdgeInsets.symmetric(vertical: 6.0), // Dynamic vertical gap
                  child: Material(
                    color: Colors.transparent, // Ensure there's no unwanted background color
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[350]!, // Border color
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        // No background color unless specified
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PageComponent(
                          isAddNew: isAddNew,
                          clipLabel: pages[index], // Pass the label for dynamic display
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[350]!),
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
