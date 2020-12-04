import 'package:flutter/material.dart';

class TestePage extends StatefulWidget {
  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> containerSizeAnim;
  Animation<double> textAnim;
  var open = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    );

    containerSizeAnim = Tween(
      begin: MediaQuery.of(context).size.width * .20,
      end: MediaQuery.of(context).size.width * .65,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 1),
      ),
    );

    textAnim = Tween(
      begin: 1.0,
      end: 20.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(.9, 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 70),
            color: Color(0xFFF8F8F8),
            // color: Colors.teal,
          ),
//  !open ? controller.forward() : controller.reverse();
//                             open = !open;
          Material(
            elevation: 8,
            shadowColor: Color(0xFF000000),
            color: Colors.transparent,
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, snapshot) {
                  return Container(
                    width: containerSizeAnim.value,
                    color: Color(0xFFFFFFFF),
                    // duration: Duration(milliseconds: 300),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            !open ? controller.forward() : controller.reverse();
                            open = !open;
                          },
                          leading: Icon(
                            Icons.person,
                            size: 36,
                          ),
                          title: Text(
                            'Dados pessoais',
                            style: TextStyle(fontSize: textAnim.value),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 5,
                          endIndent: 5,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.list,
                            size: 36,
                          ),
                          title: Text(
                            'Aulas disponíveis',
                            style: TextStyle(fontSize: textAnim.value),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 5,
                          endIndent: 5,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.calendar_today,
                            size: 36,
                          ),
                          title: Text(
                            'Aulas agendadas',
                            style: TextStyle(fontSize: textAnim.value),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          // Material(
          //   elevation: 8,
          //   shadowColor: Color(0xFF000000),
          //   child: AnimatedContainer(
          //     width: !open ? 80 : 250,
          //     color: Color(0xFFFFFFFF),
          //     duration: Duration(milliseconds: 300),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               open = !open;
          //             });
          //           },
          //           child: Padding(
          //             padding: const EdgeInsets.only(
          //               top: 15,
          //               bottom: 15,
          //               left: 20,
          //             ),
          //             child: Icon(
          //               Icons.person,
          //               size: 36,
          //             ),
          //           ),
          //         ),
          //         Divider(
          //           color: Colors.black,
          //           indent: 5,
          //           endIndent: 5,
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(
          //             top: 15,
          //             bottom: 15,
          //             left: 20,
          //           ),
          //           child: Icon(
          //             Icons.list,
          //             size: 36,
          //           ),
          //         ),
          //         Divider(
          //           color: Colors.black,
          //           indent: 5,
          //           endIndent: 5,
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(
          //             top: 15,
          //             bottom: 15,
          //             left: 20,
          //           ),
          //           child: Icon(
          //             Icons.calendar_today,
          //             size: 36,
          //           ),
          //         ),
          //         Divider(
          //           color: Colors.black,
          //           indent: 5,
          //           endIndent: 5,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
