import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: SizedBox(
                height: 120,
                width: 220,
                child: Image.asset('images/logo.png'))
          ),
          ListTile(leading: const Icon(Icons.contact_support,color: Colors.black,),
            title: const Text('Contact us'),
            onTap: () {
            //TODO:NEED TO CREATE Contact us AND Add My Store PAGE LATER
              launchUrl(
                Uri.parse('https://showmydeals.in/contact'),
                mode: LaunchMode.externalApplication,
              );
              // Handle home tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.store_mall_directory,color: Colors.black),
            title: const Text('Add My Store'),
            onTap: () {
              launchUrl(
                Uri.parse('https://showmydeals.in/add'),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
           const Spacer(),
         const Divider(),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.privacy_tip,color: Colors.black,size: 16.0,),
                SizedBox(width: 20,),
                Text('Privacy policy',style: TextStyle(decoration: TextDecoration.underline,fontSize: 12.0),),
              ],
            ),
            onTap: () {
              launchUrl(
                Uri.parse('https://showmydeals.in/privacy'),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.shopping_bag_sharp,color: Colors.black,size: 16.0,),
                SizedBox(width: 20,),
                Text('Terms of service',style: TextStyle(decoration: TextDecoration.underline,fontSize: 12.0),),
              ],
            ),
            onTap: () {
              launchUrl(
                Uri.parse('https://showmydeals.in/terms'),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
      ),
    );
  }
}
