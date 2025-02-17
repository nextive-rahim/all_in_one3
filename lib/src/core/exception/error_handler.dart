import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/logger.dart';

void errorHandler(
  Object e,
  StackTrace stackTrace, {
  String feedback = "Something went wrong",
  bool disableFeedback = false,
}) {
  Log.error(e.toString());
  Log.error(stackTrace.toString());
  SnackBarService.showErrorSnackBar(feedback);
}
