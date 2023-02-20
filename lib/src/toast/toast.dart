import 'package:bot_toast/bot_toast.dart';

typedef CancelFunc = void Function();

showToast({required String text}) => BotToast.showText(text: text);

CancelFunc showLoading() {
  return BotToast.showLoading();
}
