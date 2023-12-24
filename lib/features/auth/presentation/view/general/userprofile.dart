import 'package:flutter/material.dart';
import 'package:ramrobazar_mobile_app/config/constants/theme_constant.dart';

class Testtt extends StatefulWidget {
  const Testtt({super.key});

  @override
  State<Testtt> createState() => _TestttState();
}

class _TestttState extends State<Testtt> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
          decoration: BoxDecoration(
              color: ThemeConstant.backgroundColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 114, 110, 110)
                      .withOpacity(0.03),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 25, right: 20, left: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Icon(Icons.bar_chart), Icon(Icons.more_vert)],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: (size.width - 40) * 0.6,
                      child: const Column(
                        children: [
                          Text(
                            "Abbie Wilson",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ThemeConstant.primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Software Developer",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: ThemeConstant.fieldTextColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "\$8900",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeConstant.primaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Income",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              color: ThemeConstant.fieldTextColor),
                        ),
                      ],
                    ),
                    Container(
                      width: 0.5,
                      height: 40,
                      color: ThemeConstant.fieldTextColor.withOpacity(0.3),
                    ),
                    const Column(
                      children: [
                        Text(
                          "\$5500",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeConstant.primaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Expenses",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              color: ThemeConstant.fieldTextColor),
                        ),
                      ],
                    ),
                    Container(
                      width: 0.5,
                      height: 40,
                      color: ThemeConstant.fieldTextColor.withOpacity(0.3),
                    ),
                    const Column(
                      children: [
                        Text(
                          "\$890",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeConstant.primaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Loan",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              color: ThemeConstant.fieldTextColor),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
