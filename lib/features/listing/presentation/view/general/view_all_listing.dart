import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/api_endpoint.dart';
import '../../../../../config/constants/theme_constant.dart';
import '../../../../../config/router/app_route.dart';
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

    final lstImages = ['phone', 'car1', 'scooter', 'zoom', 'car2', 'car3', 'car1', 'car2', 'phone', 'scooter'];

    Size screenSize = MediaQuery.of(context).size;
    SizedBox gap;

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
                  gap,
                  gap,
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
                    Row(children: [
                      Container(
                        color: Colors.white,
                        width: screenSize.width * 0.88,
                        height: screenSize.height * 0.7,
                        child: GridView.count(
                          childAspectRatio: 0.5,
                          crossAxisCount: 2,
                          children: List.generate(listingState.listing!.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onDoubleTap: () => {
                                  ref
                                      .read(listingViewModelProvider.notifier)
                                      .getSingleListing(listingState
                                          .listing![index].id
                                          .toString()),
                                  Navigator.pushNamed(
                                      context, AppRoute.listingViewSingle),
                                },
                                child: Center(
                                  child: Container(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    height: 450,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            height: 250,
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                '${ApiEndpoints.imageUrl}/${lstImages[index]}.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    " ${listingState.listing![index].condition}",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            142,
                                                            140,
                                                            139)),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      listingState
                                                          .listing![index]
                                                          .title,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                        "Rs. ${listingState.listing![index].price}",
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                        )),
                                                  ]),

                                                  
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ])
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
