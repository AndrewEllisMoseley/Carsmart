import 'package:bloc/bloc.dart';
import '../authentication/authentication.dart';
import '../../exceptions/exceptions.dart';
import '../../services/services.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;

  LoginBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }

    if (event is UserToRegister) {
      yield* _mapUserLoginToState(event);
    }

    if (event is UserToForgotPassword) {
      yield* _mapUserForgotPasswordToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      final user = await _authenticationService.signInWithEmailAndPassword(
          event.email, event.password);
      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(error: 'Something very weird just happened');
      }
    } on AuthenticationException catch (e) {
      yield LoginFailure(error: e.message);
    } catch (err) {
      print('error $err');
      yield LoginFailure(error: err);
    }
  }

  Stream<LoginState> _mapUserLoginToState(UserToRegister event) async* {
    yield LoginToRegister();
    _authenticationBloc.add(UserRegister());
  }

  Stream<LoginState> _mapUserForgotPasswordToState(
      UserToForgotPassword event) async* {
    yield LoginToForgotPassword();
    _authenticationBloc.add(UserForgotPassword());
  }
}
