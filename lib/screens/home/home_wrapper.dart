import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_codemagic/blocs/index.dart';
import 'package:test_codemagic/router/index.dart';
import 'package:test_codemagic/services/index.dart';

class HomeWrapperScreen extends StatefulWidget {
  const HomeWrapperScreen({super.key});

  @override
  State<HomeWrapperScreen> createState() => _HomeWrapperScreenState();
}

class _HomeWrapperScreenState extends State<HomeWrapperScreen> {
  @override
  void initState() {
    super.initState();

    getIt.pushNewScope(init: configureUserDependencies);
  }

  @override
  Widget build(BuildContext context) {
    return const HomeStateWrapper(child: AutoRouter());
  }

  @override
  void dispose() {
    getIt.popScope();

    super.dispose();
  }
}

class HomeStateWrapper extends StatelessWidget {
  const HomeStateWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ChatsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PostsBloc>(),
        ),
      ],
      child: child,
    );
  }
}
