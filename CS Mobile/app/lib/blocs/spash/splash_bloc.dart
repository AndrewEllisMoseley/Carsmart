import 'package:app/blocs/spash/splash.dart';
import 'package:bloc/bloc.dart';
import '../authentication/authentication.dart';
import '../../services/services.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthenticationBloc _authenticationBloc;
  // final AuthenticationService _authenticationService;

  SplashBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc;
  // _authenticationService = authenticationService;

  @override
  SplashState get initialState => SplashInitial();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is UserSplashToLogin) {
      yield* _mapUserSplashToLoginToState(event);
    }

    if (event is UserSplashToRegister) {
      yield* _mapUserSplashToRegisterToState(event);
    }
  }

  Stream<SplashState> _mapUserSplashToLoginToState(
      UserSplashToLogin event) async* {
    yield SplashToLogin();
    _authenticationBloc.add(UserLogin());
  }

  Stream<SplashState> _mapUserSplashToRegisterToState(
      UserSplashToRegister event) async* {
    yield SplashToRegister();
    _authenticationBloc.add(UserRegister());
  }
}
