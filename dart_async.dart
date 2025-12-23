import 'dart:async';
Future<void> main() async {

  print("This is dart async file, Task 1.4");
  print("Fetching user data...");
  String data= await fetchUserData();
  print(data);
  
  try{
    String result=await fetchUserWithError();
  } catch (e){
    print("Error fetching user data: $e");
  }

  print("\nFetching multiple resources...");

  List results = await Future.wait([
    fetchUserProfile(),
    fetchUserdetails(),
    fetchUserData(),
  ]);

  results.forEach((r) => print(r));

  print("\nListening to CountStream");
  await for (int value in countStream(5)){
    print("Stream value: $value");
  }

  print("\nListening to error stream:");
  try {
    await for (int value in errorStream()) {
      print(value);
    }
  } catch (e) {
    print("Stream error caught: $e");
  }

  print("Stream Controller Demo\n");
  streamControllerDemo();

  print("Stream Transformation Demo\n");
  streamTransformationDemo();

}

Future<String>fetchUserData() async{

    await Future.delayed(Duration(seconds:2));
    return Future.value("User data fetched successfully!!!");
}

Future<String>fetchUserWithError() async{
  await Future.delayed(Duration(seconds: 1));
  throw Exception("Failed to fetch user data");
}

Future<String>fetchUserProfile() async{
  await Future.delayed(Duration(seconds: 2));
  return Future.value("User profile data");
}

Future<String>fetchUserdetails() async{
  await Future.delayed(Duration(seconds: 1));
  return Future.value("User detailed data");
}

Stream<int>countStream(int to) async* {
  for (int i = 1; i <=5 ; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Stream<int>errorStream()async*{
  yield 1;
  yield 2;
  throw Exception("Stream error occurred");
}

void streamControllerDemo() {
  StreamController<int> controller = StreamController<int>();

  controller.stream.listen(
    (data) => print("StreamController data: $data"),
    onError: (e) => print("StreamController error: $e"),
    onDone: () => print("StreamController closed"),
  );

  controller.add(10);
  controller.add(20);
  controller.add(30);

  controller.close();
}

void streamTransformationDemo() async {
  Stream<int> numbers =
      Stream.fromIterable([1, 2, 3, 4, 5]);

  Stream<int> squared =
      numbers.map((n) => n * n);

  await for (int value in squared) {
    print("Squared value: $value");
  }
}

