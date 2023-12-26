import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar/config/constants/theme_constant.dart';
import 'package:ramrobazar/features/listing/domain/entity/listing_entity.dart';
import 'package:ramrobazar/features/listing/presentation/viewmodel/listing_view_model.dart';

class AdBasicDetailView extends ConsumerStatefulWidget {
  const AdBasicDetailView({super.key});

  @override
  ConsumerState<AdBasicDetailView> createState() => _AdBasicDetailViewState();
}

class _AdBasicDetailViewState extends ConsumerState<AdBasicDetailView> {
  // Controllers for TextFormFields

  List<String> controllerNames = [
    'Ad Title',
    'Ad Price',
    'Category',
    'Condition',
    'Location',
    'Description',
  ];

  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    controllers[0].text = '';
    controllers[1].text = '';
    controllers[2].text = '';
    controllers[3].text = '';
    controllers[4].text = '';
    controllers[5].text = '';
    super.initState();
  }

  @override
  void dispose() {
    controllers[0].dispose();
    controllers[1].dispose();
    controllers[2].dispose();
    controllers[3].dispose();
    controllers[4].dispose();
    controllers[5].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final smallerGap = SizedBox(height: screenSize.height * 0.015);
    final buttonWidth = screenSize.width;
    final textFieldWidth = screenSize.width;
    final gap = SizedBox(height: screenSize.height * 0.03);
    const fontSizee = 15.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConstant.backgroundColor,
      ),
      backgroundColor: ThemeConstant.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Post a new AD\n",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: ThemeConstant.fieldTextColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Earn money by posting a free ad',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 156, 154, 154)),
                            )
                          ]),
                    ),
                  ),
                  gap,
                  gap,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controllers.length,
                    itemBuilder: (context, index) {
                      return Column(mainAxisSize: MainAxisSize.min, children: [
                        gap,
                        Flexible(
                          fit: FlexFit.loose,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                color: ThemeConstant.backgroundColor,
                                height: 20,
                                child: Row(
                                  children: [
                                    Text(
                                      ' ${controllerNames[index]}*',
                                      style: const TextStyle(
                                          color: ThemeConstant.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: ThemeConstant.backgroundColor,
                                ),
                                width: textFieldWidth,
                                child: TextFormField(
                                    style: const TextStyle(
                                        color: ThemeConstant.fieldTextColor),
                                    inputFormatters: [
                                      controllerNames[index] == "Ad Price"
                                          ? FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                          : FilteringTextInputFormatter.allow(
                                              RegExp('[a-z0-9A-Z]'))
                                    ],
                                    controller: controllers[index],
                                    decoration: InputDecoration(
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ThemeConstant.primaryColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ThemeConstant.primaryColor),
                                      ),
                                      focusedErrorBorder:
                                          const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ThemeConstant.accentColor),
                                      ),
                                      errorBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText:
                                          controllerNames[index] == "Category"
                                              ? "Phone/Bike/Car/Land/Others"
                                              : controllerNames[index] ==
                                                      "Condition"
                                                  ? "New/Used"
                                                  : "",
                                      label: const Text(
                                        ' ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: fontSizee),
                                      ),
                                      border: const OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "                                                           ${controllerNames[index]} is empty";
                                      }
                                      if (controllerNames[index] == "Price") {
                                        if (controllers[index].text.trim() ==
                                                "Bike" &&
                                            int.parse(controllers[index]
                                                    .text
                                                    .trim()) <
                                                30000) {
                                          return " Minimum price for bike is Rs.30,000 ";
                                        }
                                        if (controllers[index].text.trim() ==
                                                "Car" &&
                                            int.parse(controllers[index]
                                                    .text
                                                    .trim()) <
                                                60000) {
                                          return " Minimum price for car is Rs.60,000 ";
                                        }
                                        if (controllers[index].text.trim() ==
                                                "Land" &&
                                            int.parse(controllers[index]
                                                    .text
                                                    .trim()) <
                                                100000) {
                                          return " Minimum price for land is Rs.100,000 ";
                                        }
                                        if (controllers[index].text.trim() ==
                                                "Phone" &&
                                            int.parse(controllers[index]
                                                    .text
                                                    .trim()) <
                                                5000) {
                                          return " Minimum price for phone is Rs.5,000 ";
                                        }
                                      }
                                      if (controllerNames[index] ==
                                          "Category") {
                                        if (![
                                          "Phone",
                                          "Bike",
                                          "Car",
                                          "Land",
                                          "Others"
                                        ].contains(value)) {
                                          return "Select an appropriate category";
                                        } else if (controllerNames[index] ==
                                            "Condition") {
                                          if (![
                                            "New",
                                            "Used",
                                          ].contains(value)) {
                                            return "Select an appropriate condition";
                                          }
                                        }
                                      }

                                      return null;
                                    }),
                              ),
                              SizedBox(
                                width: screenSize.width,
                              ),
                            ],
                          ),
                        ),
                      ]);
                    },
                  ),
                  gap,
                  gap,
                  gap,
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: ThemeConstant.primaryColor,
                        ),
                        width: buttonWidth,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ThemeConstant.primaryColor)),
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              ListingEntity obj = ListingEntity(
                                title: controllers[0].text.trim(),
                                price: controllers[1].text.trim(),
                                category: controllers[2].text.trim(),
                                condition: controllers[3].text.trim(),
                                location: controllers[4].text.trim(),
                                description: controllers[5].text.trim(),
                              );
                              await ref
                                  .read(listingViewModelProvider.notifier)
                                  .addListing(context: context, listing: obj);
                            }
                          },
                          child: const Text(
                            'Create an Ad',
                            style: TextStyle(
                                fontSize: 20,
                                color: ThemeConstant.backgroundColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      gap,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
