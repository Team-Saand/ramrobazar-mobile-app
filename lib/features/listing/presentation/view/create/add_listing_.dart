import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar_mobile_app/config/constants/theme_constant.dart';
import 'package:ramrobazar_mobile_app/core/common/snackbar/snackbar_message.dart';
import 'package:ramrobazar_mobile_app/features/listing/domain/entity/listing_entity.dart';
import 'package:ramrobazar_mobile_app/features/listing/presentation/viewmodel/listing_view_model.dart';

class AdBasicDetailView extends ConsumerStatefulWidget {
  const AdBasicDetailView({super.key});

  @override
  ConsumerState<AdBasicDetailView> createState() => _AdBasicDetailViewState();
}

class _AdBasicDetailViewState extends ConsumerState<AdBasicDetailView> {
  // Controllers for TextFormFields
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _conditionController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    _conditionController.text = '';
    _descriptionController.text = '';
    _locationController.text = '';
    _titleController.text = '';
    _categoryController.text = '';
    _priceController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _conditionController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final smallerGap = SizedBox(height: screenSize.height * 0.015);
    final buttonWidth = screenSize.width;
    final textFieldWidth = screenSize.width;
    final gap = SizedBox(height: screenSize.height * 0.03);
    final iconHeight = screenSize.height * 0.03;
    final fieldHeight = screenSize.height * 0.06;
    const fontSizee = 15.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ThemeConstant.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                gap,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Post a new Ad\n",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: ThemeConstant.fieldTextColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Earn money by posting a free ad',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ]),
                  ),
                ),
                // gap,
                gap,
                // gap,
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
        
                      Container(
                        height: fieldHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z0-9]'))
                          ],
                          controller: _titleController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            label: Text(
                              ' Title',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: 'Ryzen laptop',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Title is empty",
                                  color: Colors.red);
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      smallerGap,
                        smallerGap,
                      SizedBox(
                        width: screenSize.width,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        height: fieldHeight,
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          controller: _categoryController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            label: Text(
                              ' Category',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: "Land",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Category is empty",
                                  color: Colors.red);
        
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      smallerGap,
                      Container(
                        height: fieldHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z" "]'))
                          ],
                          controller: _priceController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            label: Text(
                              ' Price',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: 'Rs. 2,000',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Price is empty",
                                  color: Colors.red);
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),                        
                    
                      smallerGap,
                      Container(
                        height: fieldHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z" "]'))
                          ],
                          controller: _locationController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            label: Text(
                              ' Location',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: 'Dillibazar, Kathmandu',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Location is empty",
                                  color: Colors.red);
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      smallerGap,
                      Container(
                        height: fieldHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z0-9]'))
                          ],
                          controller: _conditionController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            label: Text(
                              ' How is the condition?',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            hintText: 'Used',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Condition is empty",
                                  color: Colors.red);
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      smallerGap,
                      SizedBox(
                        width: screenSize.width,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.backgroundColor,
                        ),
                        height: fieldHeight,
                        width: textFieldWidth,
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            label: Text(
                              ' Description',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSizee),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              showMessageToUser(
                                  context: context,
                                  message: "Description is empty",
                                  color: Colors.red);
        
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                smallerGap,
                smallerGap,
                smallerGap,
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ThemeConstant.accentColor,
                        ),
                        width: buttonWidth,
                        height: fieldHeight,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      ThemeConstant.accentColor)),
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              ListingEntity obj = ListingEntity(
                                  title: _titleController.text.trim(),
                                  price: _priceController.text.trim(),
                                  location: _locationController.text.trim(),
                                  description:
                                      _descriptionController.text.trim(),
                                  condition: _conditionController.text.trim(),
                                  category: _categoryController.text.trim());
                              await ref
                                  .read(listingViewModelProvider.notifier)
                                  .addListing(context: context, listing: obj);
                            }
                          },
                          child: const Text(
                            'Create an add',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
