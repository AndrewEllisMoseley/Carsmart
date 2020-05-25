import 'package:app/blocs/forgot_password/forgot_password.dart';
import 'package:bloc/bloc.dart';
import '../authentication/authentication.dart';
import '../../services/services.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthenticationBloc _authenticationBloc;
  // final AuthenticationService _authenticationService;

  ForgotPasswordBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc;
  // _authenticationService = authenticationService;

  @override
  ForgotPasswordState get initialState => ForgotPasswordInitial();

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is ForgotPasswordEventButtonPressed) {
      yield* _mapForgotPasswordWithEmailToState(event);
    }

    if (event is UserBackToLogin) {
      yield* _mapUserLoginToState(event);
    }
  }

  Stream<ForgotPasswordState> _mapForgotPasswordWithEmailToState(
      ForgotPasswordEventButtonPressed event) async* {
    yield ForgotPasswordLoading();
    // try {
    //   final user = await _authenticationService.signInWithEmailAndPassword(
    //       event.email);
    //   if (user != null) {
    //     _authenticationBloc.add(UserLoggedIn(user: user));
    //     yield ForgotPasswordSuccess();
    //     yield ForgotPasswordInitial();
    //   } else {
    //     yield ForgotPasswordFailure(error: 'Something very weird just happened');
    //   }
    // } on AuthenticationException catch (e) {
    //   yield ForgotPasswordFailure(error: e.message);
    // } catch (err) {
    //   print('error $err');
    //   yield ForgotPasswordFailure(error: err.message ?? 'An unknown error occured');
    // }
  }

  Stream<ForgotPasswordState> _mapUserLoginToState(
      UserBackToLogin event) async* {
    yield ForgotPasswordToLogin();
    _authenticationBloc.add(UserLogin());
  }
}
