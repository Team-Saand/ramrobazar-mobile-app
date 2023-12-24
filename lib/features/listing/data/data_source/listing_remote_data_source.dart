import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/listing_entity.dart';
import '../dto/get_all_listing_dto.dart';
import '../dto/get_single_listing_dto.dart';
import '../model/listing_api_model.dart';

final listingRemoteDataSourceProvider = Provider((ref) => AdRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      listingApiModel: ref.read(listingApiModelProvider),
    ));

class AdRemoteDataSource {
  final Dio dio;
  final ListingApiModel listingApiModel;
  final UserSharedPrefs userSharedPrefs;

  AdRemoteDataSource({
    required this.dio,
    required this.userSharedPrefs,
    required this.listingApiModel,
  });

  Future<Either<Failure, bool>> addListing(ListingEntity listing) async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      Map<String, dynamic> data;
      data = {};

      Response response = await dio.post(ApiEndpoints.listing,
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['error']['message'][0],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(
          Failure(
            error: 'No response from server',
            statusCode: '400',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.response!.data['error']['message'][0] ?? 'No response from server',
            statusCode: e.response?.statusCode.toString() ?? '400',
          ),
        );
      }
    }
  }

  Future<Either<Failure, bool>> updateListing(ListingEntity listing) async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      Response response = await dio.put('${ApiEndpoints.listing}/${listing.id}',
          data: {},
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['error']['message'][0],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(
          Failure(
            error: 'No response from server',
            statusCode: '400',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.response!.data['error']['message'][0] ?? 'No response from server',
            statusCode: e.response?.statusCode.toString() ?? '400',
          ),
        );
      }
    }
  }

  Future<Either<Failure, List<ListingEntity>>> getAllListing() async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.get(ApiEndpoints.listing,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        GetListingDTO getAdInfoDTO = GetListingDTO.fromJson(response.data);

        List<ListingEntity>listing= listingApiModel.toEntityList(getAdInfoDTO.data);

        return Right(listing);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(
          Failure(
            error: 'No response from server',
            statusCode: '400',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.response!.data['error']['message'][0] ?? 'No response from server',
            statusCode: e.response?.statusCode.toString() ?? '400',
          ),
        );
      }
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getSingleListing(String id) async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.get('${ApiEndpoints.listing}/$id',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        GetSingleListingDTO getSingleAdInfoDTO =
            GetSingleListingDTO.fromJson(response.data);

        ListingApiModel listingApi = ListingApiModel.fromJson(getSingleAdInfoDTO.data[1]);

        ListingEntity listing = listingApiModel.toListingEntity(listingApi);

        Map<String, dynamic> responseData = {
         "listing": listing,
        };

        return Right(responseData);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(
          Failure(
            error: 'No response from server',
            statusCode: '400',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.response!.data['error']['message'][0] ?? 'No response from server',
            statusCode: e.response?.statusCode.toString() ?? '400',
          ),
        );
      }
    }
  }

  Future<Either<Failure, bool>> deleteListing(String id) async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      Response response = await dio.delete('${ApiEndpoints.listing}/$id',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 204) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['error']['message'][0],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(
          Failure(
            error: 'No response from server',
            statusCode: '400',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.response!.data['error']['message'][0] ?? 'No response from server',
            statusCode: e.response?.statusCode.toString() ?? '400',
          ),
        );
      }
    }
  }
}
