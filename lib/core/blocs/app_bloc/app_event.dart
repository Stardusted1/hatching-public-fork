part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppSwitchToScreen extends AppEvent {
  final AppScreenType type;

  const AppSwitchToScreen(this.type);

  @override
  List<Object?> get props => [type];
}
