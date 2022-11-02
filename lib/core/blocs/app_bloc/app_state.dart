part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppStateScreen extends AppState {
  const AppStateScreen(this.screenType);

  int get appScreenIndex => screenType.index;
  final AppScreenType screenType;

  @override
  List<Object> get props => [screenType];
}

class AppStateAuth extends AppState {
  const AppStateAuth();

  @override
  List<Object> get props => [];
}
