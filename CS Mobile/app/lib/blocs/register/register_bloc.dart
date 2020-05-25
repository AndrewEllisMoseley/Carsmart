import 'package:bloc/bloc.dart';
import 'register.dart';
import '../authentication/authentication.dart';
import '../../exceptions/exceptions.dart';
import '../../services/services.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;

  RegisterBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService;

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterContinueFirstButtonPressed) {
      yield* _mapRegisterContinueFirstToState(event);
    }

    if (event is RegisterContinueSecondButtonPressed) {
      yield* _mapRegisterContinueSecondToState(event);
    }

    if (event is RegisterFullDetailsButtonPressed) {
      yield* _mapRegisterCompleteToState(event);
    }

    if (event is UserToLogin) {
      yield* _mapUserRegisterToState(event);
    }
  }

  Stream<RegisterState> _mapRegisterContinueFirstToState(
      RegisterContinueFirstButtonPressed event) async* {
    yield RegisterLoading();
    // await Future.delayed(Duration(seconds: 5));
    yield RegisterPartOneComplete();
  }

  Stream<RegisterState> _mapRegisterContinueSecondToState(
      RegisterContinueSecondButtonPressed event) async* {
    yield RegisterLoading();
    // await Future.delayed(Duration(seconds: 5));
    yield RegisterPartTwoComplete();
  }

  Stream<RegisterState> _mapRegisterCompleteToState(
      RegisterFullDetailsButtonPressed event) async* {
    yield RegisterLoading();
    try {
      final user = await _authenticationService.completeRegistration(
          event.firstName,
          event.lastName,
          event.company,
          event.job,
          event.email,
          event.password);
      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield RegisterSuccess();
        yield RegisterInitial();
      } else {
        yield RegisterFailure(error: 'Something very weird just happened');
      }
    } on AuthenticationException catch (e) {
      yield RegisterFailure(error: e.message);
    } catch (err) {
      print('error $err');
      yield RegisterFailure(error: err ?? 'An unknown error occured');
    }
  }

  Stream<RegisterState> _mapUserRegisterToState(UserToLogin event) async* {
    yield RegisterToLogin();
    _authenticationBloc.add(UserLogin());
  }
}
