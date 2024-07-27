import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_utils/get_utils.dart';
class InternetException extends StatefulWidget {
  final VoidCallback onPress;
  InternetException({required this.onPress, super.key});

  @override
  State<InternetException> createState() => _InternetExceptionState();
}

class _InternetExceptionState extends State<InternetException> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Icon(Icons.cloud_off, size: 15,),
        Text('Internet_exception'.tr),
        SizedBox(height: height * 0.15,),
        InkWell(
          onTap: widget.onPress,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text('Retry', style: TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }
}
