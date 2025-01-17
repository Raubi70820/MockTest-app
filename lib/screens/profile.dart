import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Map<String, dynamic>> videoLinks = [
    {
      'title':'My Courses','icon':Icons.book,
    },
    
    {
      'title':'Videos','icon':Icons.video_library,
    },
    {
      'title':'Profile','icon':Icons.person,
    },
    {
      'title':'Settings','icon':Icons.settings,
    },
    {
      'title':'Account','icon':Icons.account_circle,
    },
    {
      'title':'Subscription','icon':Icons.subscriptions,
    },
    {
      'title':'My Orders','icon':Icons.shopping_cart,
    },
    {
      'title':'My Wishlist','icon':Icons.favorite,
    },
    {
      'title':'Downloads','icon':Icons.download,
    },
    {
      'title':'My Notifications','icon':Icons.notifications,
    },
    {
      'title':'Wallet','icon':Icons.account_balance_wallet,
    },
    {
      'title':'help','icon':Icons.support,
    },
    {
      'title':'About','icon':Icons.info,
    },
    {
      'title':' Logout','icon':Icons.logout,
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: CircleAvatar(
          backgroundImage: AssetImage('assets/studying.png'),)),
      body: ListView.builder(
        itemCount: videoLinks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(videoLinks[index]['icon']),
            title: Text(videoLinks[index]['title']),
            onTap: () {
              // Navigate to the respective screen
            },
          );
        },
      ),
    );
  }
}
