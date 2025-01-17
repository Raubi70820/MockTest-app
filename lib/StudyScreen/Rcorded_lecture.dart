
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class RecordedLecture extends StatefulWidget {
  const RecordedLecture({super.key});

  @override
  _RecordedLectureState createState() => _RecordedLectureState();
}

class _RecordedLectureState extends State<RecordedLecture> {
   final List<Map<String, String>> videoLinks = [
     {"title": "flutter Lecture", "link": "https://youtu.be/ELFORM9fmss?si=a9vmWslb9_PKTfGy", "image": "assets/fflutter logo.png"},
    {"title": "javaScript FullCourse", "link": "https://youtu.be/cpoXLj24BDY?si=63AiWDbtB8wtv912", "image": "assets/javaScript.png"},
    {"title": "Complete Reasoning ", "link": "https://youtu.be/K5yPCgdLrCk?si=tV_GkVXWF-pnLqdB", "image": "assets/reasoning.png"},
    {"title": "Profit And Loss ", "link": "https://youtu.be/vgZr0lRBEGg?si=aOx3FpRchGreSrFA", "image": "assets/profit and Loss.png"}, 
    {"title": "ANCIENT HISTORY", "link": "https://www.youtube.com/live/SWLTEbTNc9Y?si=yTJtGvvXtdvdwz4o", "image": "assets/ancient history.png"},    
    {"title": "MIDDLE  HISTORY", "link": "https://www.youtube.com/live/ymuAPWkW5p4?si=PepcPJtWcyET26ua", "image": "assets/ancient history.png"},
    {"title": "LCM AND HCF", "link": "https://www.youtube.com/live/EUbeYcBNbfo?si=DcocFWpdhEr5Zwov", "image": "assets/lcm and Hcf.png"},
    {"title": "INDIAN Constitution", "link": "https://youtu.be/uIZik791zRA?si=u6GIk6zrtU8maZS0", "image": "assets/Constitution.png"},
    {"title": "INDIAN Constitution 2", "link": "https://www.youtube.com/live/a8IQPZHwdKU?si=MVSKHp8bqPyCO9L5", "image": "assets/Constitution.png"},
     {"title": "English", "link": "https://www.youtube.com/live/-YQwic1CW80?si=28CQy-NRrVPbvulA", "image": "assets/english.png"},
    
  ];

 Future <void> _openVideoInBrowser(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recorded Lectures"),
        backgroundColor: Colors.purple,
      ),
      body:

      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two buttons per row
          crossAxisSpacing: 16, // Space between buttons horizontally
          mainAxisSpacing: 16, // Space between buttons vertically
          childAspectRatio: 1.5, // Aspect ratio for fixed size
        ),

        itemCount: videoLinks.length, // Specify the number of items
        itemBuilder: (context, index) {
          final video = videoLinks[index];
          return Card(
            elevation: 17,
            child: Container(
              height: 300, // Fixed height
              width: 220, // Fixed width
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(video["image"]! ),fit: BoxFit.contain),
                color: Colors.black87, // Container background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: TextButton(onPressed: () {
                _openVideoInBrowser(video["link"]!);
                
              },
              child: Row(children: [
               
                Icon(Icons.play_circle_fill, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      video["title"]!,
                      style: TextStyle(color: Colors.white),)

              ],),),
            ),
          );
        },
      ),
    );
  }
}

