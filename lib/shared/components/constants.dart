
import '../network/local/chache _helper.dart';
import 'components.dart';

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token;

String? uId;

void signOut(
    context,
    {required loginScreen}
    )
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value!) {
      navigateAndReplaceTo(context, loginScreen);}              }
  );

}