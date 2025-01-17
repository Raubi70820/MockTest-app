import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,size: 20,)),
      ),
      backgroundColor: Colors.black45,
      body: GridView.builder(
        
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
          crossAxisCount: 2, // Two buttons per row
          crossAxisSpacing: 16, // Space between buttons horizontally
          mainAxisSpacing: 16, // Space between buttons vertically
          childAspectRatio: 1.5, // Aspect ratio for fixed size
        ),

        itemCount: 10, // Specify the number of items
        itemBuilder: (context, index) {
          return Card(
            elevation: 17,
            child: Container(
              height: 300, // Fixed height
              width: 220, // Fixed width
              decoration: BoxDecoration(
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
              child: TextButton(onPressed: (){}, child: Row(
                children: [
                  Text('Book')
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}

  
