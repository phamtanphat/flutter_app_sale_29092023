import 'package:flutter/material.dart';
import 'package:flutter_app_sale_29092023/common/base/base_widget.dart';
import 'package:flutter_app_sale_29092023/data/api/api_service.dart';
import 'package:flutter_app_sale_29092023/data/repository/authentication_repository.dart';
import 'package:flutter_app_sale_29092023/presentation/sign_in/sign_in_bloc.dart';
import 'package:flutter_app_sale_29092023/presentation/sign_in/sign_in_event.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return PageContainer(
        providers: [
          Provider(create: (context) => ApiService()),
          ProxyProvider<ApiService, AuthenticationRepository>(
            create: (context) => AuthenticationRepository(),
            update: (context, apiService, repository) {
              repository?.setApiService(apiService);
              return repository ?? AuthenticationRepository();
            },
          ),
          ProxyProvider<AuthenticationRepository, SignInBloc>(
            create: (context) => SignInBloc(),
            update: (context, repository, bloc) {
              bloc?.setAuthenticationRepo(repository);
              return bloc ?? SignInBloc();
            },
          ),
        ],
        appBar: AppBar(
          title: Text("Login"),
        ),
        child: SignInContainer(),
    );
  }
}

class SignInContainer extends StatefulWidget {
  const SignInContainer({super.key});

  @override
  State<SignInContainer> createState() => _SignInContainerState();
}

class _SignInContainerState extends State<SignInContainer> {

  SignInBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read();
    _bloc?.signIn(SignInEvent("demo2@gmail.com", "12345678"));

    _bloc?.messageStream.listen((event) { print(event); });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
