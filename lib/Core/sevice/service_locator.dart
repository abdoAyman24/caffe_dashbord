
import 'package:caffee_dashbord/Core/sevice/data_base_service.dart';
import 'package:caffee_dashbord/Core/sevice/fire_base_service.dart';
import 'package:caffee_dashbord/Core/sevice/store_service.dart';
import 'package:caffee_dashbord/Core/sevice/supabase_service.dart';
import 'package:caffee_dashbord/Feature/Add_Data/data/repo_impl/add_repo_imple.dart';
import 'package:caffee_dashbord/Feature/Add_Data/data/repo_impl/upload_image_repo_impl.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/add_repo.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/upload_image_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpGetIt() {
  getIt.registerSingleton<DataBaseService>(FireBaseService());
  getIt.registerSingleton<StoreService>(SupabaseService());
  getIt.registerSingleton<AddRepo>(AddRepoImple(getIt.get<DataBaseService>()));
  getIt.registerSingleton<UploadImageRepo>(UploadImageRepoImpl(storeService: getIt.get<StoreService>()));




  
  
}
