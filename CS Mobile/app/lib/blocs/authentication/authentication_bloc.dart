import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';
import '../../services/services.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authenticationService;

  AuthenticationBloc(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        _authenticationService = authenticationService;

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }

    if (event is UserLogin) {
      yield* _mapUserLoginToState(event);
    }

    if (event is UserRegister) {
      yield* _mapUserRegisterToState(event);
    }

    if (event is UserForgotPassword) {
      yield* _mapUserForgotPasswordToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(seconds: 2)); // a simulated delay
      final currentUser = await _authenticationService.getCurrentUser();
      if (currentUser != null) {
        yield AuthenticationAuthenticated(user: currentUser);
      } else {
        yield AuthenticationNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(
      UserLoggedIn event) async* {
    yield AuthenticationAuthenticated(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(
      UserLoggedOut event) async* {
    await _authenticationService.signOut();
    yield AuthenticationNotAuthenticated();
  }

  Stream<AuthenticationState> _mapUserLoginToState(UserLogin event) async* {
    await _authenticationService.signOut();
    yield AuthenticationLogin();
  }

  Stream<AuthenticationState> _mapUserRegisterToState(
      UserRegister event) async* {
    yield AuthenticationRegister();
  }

  Stream<AuthenticationState> _mapUserForgotPasswordToState(
      UserForgotPassword event) async* {
    yield AuthenticationForgotPassword();
  }
}
