import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final int id;
  final String title;
  final String writer;
  final String status;

  const CardItem({
    super.key,
    required this.id,
    required this.title,
    required this.writer,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(70, 27, 26, 26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Text('$id')),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 230, 230, 230),
                        // fontSize: 17,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    "작성자 $writer",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 182, 182, 182),
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: (() {
                          if (status == "none") {
                            return const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 25,
                            );
                          } else if (status == "progress") {
                            return const Icon(
                              Icons.edit,
                              color: Colors.yellow,
                              size: 25,
                            );
                          } else if (status == "done") {
                            return const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 25,
                            );
                          }
                          return null;
                        })(),
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Colors.white,
                        ),
                        onTap: () {
                          debugPrint("Hi");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
