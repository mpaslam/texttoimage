import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texttoimage/bloc/image_ai_bloc.dart';
import 'package:texttoimage/bloc/image_ai_event.dart';
import 'package:texttoimage/bloc/image_ai_state.dart';
import 'package:texttoimage/repositary/model/model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

late Model data;
TextEditingController message = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: Icon(
        //   Icons.menu_outlined,
        //   color: Colors.white,
        // ),
        centerTitle: true,
        title: Text(
          'Image Generator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 320.0,
                  width: 320.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white,
                      border: Border.all(width: 3, color: Colors.black)),
                  child: BlocBuilder<AnimeBloc, AnimeState>(
                      builder: (context, state) {
                    if (state is AnimeblocLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is AnimeblocError) {
                      return Center(
                        child: Text("ERROR"),
                      );
                    }
                    if (state is AnimeblocLoaded) {
                      data = BlocProvider.of<AnimeBloc>(context).animeModel;
                      return Center(
                          child: Image.network(
                        data.imageUrl.toString(),
                        fit: BoxFit.fill,
                      ));
                    } else {
                      return SizedBox();
                    }
                  }),
                ),
                Container(
                    margin: EdgeInsets.all(30),
                    child: TextField(
                      controller: message,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter your Text"),
                    )),
                ElevatedButton(
                  child: Text(
                    'Generate',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                  onPressed: () {
                    BlocProvider.of<AnimeBloc>(context)
                        .add(FetchAnimeEvent(message: message.text));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
