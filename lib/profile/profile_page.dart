import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:calculator/profile/profile_bloc/profile_bloc.dart';
import 'package:calculator/profile/profile_repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileRepository())..add(LoadPostsEvent()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (BuildContext context, ProfileState state) {  
          if (state is ProfileError) {
            print('---------------------');
            print(state.error);
            print('---------------------');
            var snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'О нет!',
                message: 'Что то пошло не так! Ошибка: ${state.error}',
                contentType: ContentType.failure
              )
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is ProfileSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile Page'),
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return OutlinedCard(title: state.posts[index].title, body: state.posts[index].body,);
                },
              ),
            );
          }
          if (state is ProfileLoading) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profile page'),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              body: const Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class OutlinedCard extends StatelessWidget {
  final String title;
  final String body;

  const OutlinedCard({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = TextStyle(fontWeight: FontWeight.w700);

    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          child: Column(
            children: [
              Text(
                title,
                style: titleTextStyle,
              ),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}