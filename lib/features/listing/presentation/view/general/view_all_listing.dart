import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/theme_constant.dart';
import '../../viewmodel/listing_view_model.dart';

class AllListingView extends ConsumerStatefulWidget {
  const AllListingView({super.key});

  @override
  ConsumerState<AllListingView> createState() => _AllListingViewState();
}

class _AllListingViewState extends ConsumerState<AllListingView> {
  final _searchListingController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final listingState = ref.watch(listingViewModelProvider);

    Size screenSize = MediaQuery.of(context).size;
    SizedBox gap;
    double buttonWidth;
    double textFieldWidth;

    buttonWidth = screenSize.width;
    textFieldWidth = screenSize.width;
    gap = SizedBox(height: screenSize.height * 0.03);

    return Scaffold(
      backgroundColor: ThemeConstant.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                              color: ThemeConstant.fieldTextColor),
                          controller: _searchListingController,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ThemeConstant.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 212, 210, 210),
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            label: Text(
                              ' Search',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17),
                            ),
                            hintText: 'Laptop',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: ThemeConstant.primaryColor,
                        ),
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            ref
                                .read(listingViewModelProvider.notifier)
                                .getSingleListing(
                                    _searchListingController.text.trim());
                          }
                        },
                      ),
                    ],
                  ),
                  if (listingState.isLoading) ...{
                    SizedBox(
                      height: screenSize.height * 0.8,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  } else if (listingState.error != null) ...{
                    SizedBox(
                      height: screenSize.height * 0.6,
                      child: Center(
                        child: Text(
                          listingState.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  } else if (listingState.listing == null) ...{
                    SizedBox(
                      height: screenSize.height * 0.6,
                      child: const Center(
                        child: Text(
                          'No Listings',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  } else ...{
                    const Center(
                      child: Text("Listings"),
                    )
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
