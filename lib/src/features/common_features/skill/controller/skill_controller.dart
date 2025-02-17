import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/logger.dart';
import 'package:all_in_one3/src/features/common_features/skill/model/skills_model.dart';
import 'package:all_in_one3/src/features/common_features/skill/repository/skill_repository.dart';
import 'package:get/get.dart';

class SkillViewController extends GetxController {
  final SkillRepository _repository = SkillRepository();

  /// Page State
  final Rx<PageState> _pageStateController = Rx(PageState.initial);
  get pageState => _pageStateController.value;

  RxList<SkillsModel> skillsList = <SkillsModel>[].obs;
  @override
  void onInit() {
    getSkills();
    super.onInit();
  }

  Future<void> getSkills() async {
    _pageStateController(PageState.loading);

    try {
      final res = await _repository.skills();
      SkillResponseModel response = SkillResponseModel.fromJson(res);

      skillsList.value = response.data ?? [];

      _pageStateController(PageState.success);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());
      _pageStateController(PageState.error);
    }
  }
}
