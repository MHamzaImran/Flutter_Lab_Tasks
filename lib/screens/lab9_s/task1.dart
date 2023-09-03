// import 'dart:async';
//
//
// // Task 1
//
// Future<String> fetchRole() async {
//   // Simulate an async operation
//   return Future.delayed(const Duration(seconds: 1), () => 'tester');
// }
//
// Future<int> fetchLoginAmount() async {
//   // Simulate an async operation
//   return Future.delayed(const Duration(seconds: 1), () => 57);
// }
//
// Future<String> reportUserRole() async {
//   String role = await fetchRole();
//   return "User role: $role";
// }
//
// Future<String> reportLogins() async {
//   int logins = await fetchLoginAmount();
//   return "Total number of logins: $logins";
// }
//
//
//
// // Task 2
//
// Future<String> changeUsername() async {
//   try {
//     final newUsername = await fetchNewUsername();
//     return newUsername;
//   } catch (error) {
//     return error.toString();
//   }
// }
//
//
// // Task 3
//
//
// Future<String> fetchUsername() async {
//   // simulate fetching username asynchronously
//   await Future.delayed(const Duration(seconds: 1));
//   return 'Jenny';
// }
//
// Future<String> logoutUser() async {
//   // simulate logging out user asynchronously
//   await Future.delayed(const Duration(seconds: 1));
//   return 'Jenny';
// }
//
// // Part 1
// String addHello(String user) {
//   return 'Hello $user';
// }
//
// // Part 2
// Future<String> greetUser() async {
//   try {
//     final username = await fetchUsername();
//     return addHello(username);
//   } catch (error) {
//     rethrow;
//   }
// }
//
// // Part 3
// Future<String> sayGoodbye() async {
//   try {
//     final result = await logoutUser();
//     return '$result Thanks, see you next time';
//   } catch (error) {
//     return 'Logout failed: ${error.toString()}';
//   }
// }
