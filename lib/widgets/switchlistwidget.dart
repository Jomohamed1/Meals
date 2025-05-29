import 'package:flutter/material.dart';


class SwitchListWidget extends StatefulWidget {
  const SwitchListWidget({super.key, required this.title, required this.subtitle, required this.icon});

final String title ;
  final String subtitle;
  final IconData icon;

  @override
  State<SwitchListWidget> createState() => _SwitchListWidgetState();
}

class _SwitchListWidgetState extends State<SwitchListWidget> {

  bool filterSwitch = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
       
      
        contentPadding: EdgeInsets.only(left: 20 , right:28),
        activeColor: Theme.of(context).colorScheme.onSecondary,
        value: filterSwitch,
        onChanged: (value) {
          setState(() {
             filterSwitch = value;
          });
        },
        title: Row(
          children: [
            Icon(widget.icon),
            SizedBox(width:20),
            Text(widget.title ,
              style: Theme.of(context).textTheme.titleLarge!,
            ),
            
          ],
        ),
        subtitle:Text(widget.subtitle,
          style:Theme.of(context).textTheme.labelMedium,
        )
    );
  }
}

