import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentroverso/features/profile/bloc/profile_bloc.dart';
import 'features/profile/domain/repositories/user_repository.dart';
import 'features/questionnaire/data/repositories/question_repository_impl.dart';
import 'features/questionnaire/domain/use_cases/get_questions_by_kpi.dart';
import 'features/questionnaire/presentation/bloc/question_bloc.dart';
import 'features/registration/bloc/profile_bloc.dart';
import 'features/registration/data/repositories/auth_repository_impl.dart';
import 'features/registration/domain/use_cases/sign_up_use_case.dart';
import 'features/profile/domain/repositories/user_repository_impl.dart';
import 'core/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  final userRepository = UserRepositoryImpl(FirebaseFirestore.instance);
  final signUpUseCase = SignUpUseCase(AuthRepositoryImpl(FirebaseAuth.instance), userRepository);
  final questionRepository = QuestionRepositoryImpl(FirebaseFirestore.instance);
  final getQuestionsByKPI = GetQuestionsByKPI(questionRepository);

  runApp(MentroVerso(signUpUseCase: signUpUseCase, getQuestionsByKPI: getQuestionsByKPI, userRepository: userRepository,));
}

class MentroVerso extends StatelessWidget {
  final SignUpUseCase signUpUseCase;
  final GetQuestionsByKPI getQuestionsByKPI;
  final UserRepository userRepository;

  const MentroVerso({super.key, required this.signUpUseCase, required this.getQuestionsByKPI, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => QuestionBloc(getQuestionsByKPI),
        ),
        BlocProvider(
          create: (_) => SignUpBloc(signUpUseCase),
        ),
        BlocProvider(
            create: (_) => ProfileBloc(userRepository)
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),

    );
  }
}
