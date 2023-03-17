import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ButtonAddField extends StatelessWidget {
  const ButtonAddField({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('places')
              .get()
              // ignore: avoid_function_literals_in_foreach_calls
              .then((value) => value.docs.forEach((element) {
                    var docRef = FirebaseFirestore.instance
                        .collection('places')
                        .doc(element.id);

                    docRef.update(
                      {
                        "openingHours": [
                          {
                            "id": 1,
                            "day": "Monday",
                            "starthours": 7,
                            "closehours": 21,
                          },
                          {
                            "id": 2,
                            "day": "Tuesday",
                            "starthours": 7,
                            "closehours": 21,
                          },
                          {
                            "id": 3,
                            "day": "Wednesday",
                            "starthours": 7,
                            "closehours": 21,
                          },
                          {
                            "id": 4,
                            "day": "Thursday",
                            "starthours": 7,
                            "closehours": 21,
                          },
                          {
                            "id": 5,
                            "day": "Friday",
                            "starthours": 7,
                            "closehours": 21,
                          },
                          {
                            "id": 6,
                            "day": "Saturday",
                            "starthours": 7,
                            "closehours": 21,
                          },
                          {
                            "id": 7,
                            "day": "Sunday",
                            "starthours": 7,
                            "closehours": 21,
                          }
                        ],
                      },
                    );
                    // docRef.set(
                    //     {'likes': FieldValue.delete()},
                    //     SetOptions(
                    //       merge: true,
                    //     )).whenComplete(
                    //   () => print('Field Deleted'),
                    // );
                    // docRef.set(
                    //     {'facility': FieldValue.delete()},
                    //     SetOptions(
                    //       merge: true,
                    //     )).whenComplete(() => print('Field Deleted'));
                  }));
        },
        icon: const Icon(
          Icons.add,
          size: 30,
        ));
  }
}
