part of 'add_product_cubit.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

final class AddProductInitial extends AddProductState {}

final class AddProductLoad extends AddProductState {}

final class AddProductFailure extends AddProductState {
  final String errorMessage;

  AddProductFailure({required this.errorMessage});
}

final class AddProductSuccess extends AddProductState {
  
}
