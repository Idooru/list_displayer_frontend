import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_displayer/data/payload.dart';
import 'package:list_displayer/widget/card.dart';
import 'package:list_displayer/widget/write_project.dart';

class ListDisplayer extends StatefulWidget {
  const ListDisplayer({super.key});

  @override
  State<ListDisplayer> createState() => _ListDisplayerState();
}

class _ListDisplayerState extends State<ListDisplayer> {
  Future<List<CardResponse>> fetchList() async {
    try {
      Dio dio = Dio();
      String path = "http://192.168.45.33:8000/data";

      Response result = await dio.get(path).timeout(const Duration(seconds: 10));

      return List<Map<String, dynamic>>.from(result.data)
          .map((data) => CardResponse.fromJson(data))
          .toList();
    } on DioException catch (dioErr) {
      debugPrint("dio err: $dioErr");
      throw DioException(requestOptions: dioErr.requestOptions);
    } on TimeoutException catch (timeoutErr) {
      debugPrint("timeout err: $timeoutErr");
      throw TimeoutException(timeoutErr.message);
    } catch (err) {
      debugPrint("unknown err: $err");
      throw Exception(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Displayer",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        leading: IconButton(
            onPressed: () {
              debugPrint("Hi");
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        color: const Color.fromARGB(255, 65, 65, 65),
        padding: const EdgeInsets.only(top: 10),
        child: FutureBuilder(
          future: fetchList(),
          builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
          ) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  CardResponse data = snapshot.data[index];

                  return CardItem(
                    id: data.id,
                    title: data.title,
                    writer: data.writer,
                    status: data.status,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  (() {
                    if (snapshot.error.runtimeType == DioException) {
                      return "네트워크 요청이 도달하지 않습니다.";
                    } else if (snapshot.error.runtimeType == TimeoutException) {
                      return "요청 시간이 만료되었습니다.";
                    } else {
                      return "원인 모를 에러 발생";
                    }
                  })(),
                  style: const TextStyle(
                    color: Colors.white30,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WriteProjectWidget()),
          );
        },
        tooltip: 'Test tooltip',
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
