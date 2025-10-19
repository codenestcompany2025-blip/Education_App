import 'package:bloc/bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial(0));

  final int totalPages = 3;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onboarding/firstscreeen.svg",
      "title": "اختر معلمك",
      "desc": "كل مادة يشرحها أكثر من معلم، وأنت تختار!",
    },
    {
      "image": "assets/images/onboarding/seondscreen.svg",
      "title": "تعلّم بتسلسل",
      "desc": "لا فيديو جديد قبل فهم السابق باختبار بسيط.",
    },
    {
      "image": "assets/images/onboarding/thirdscreen.svg",
      "title": "تواصل مباشر",
      "desc": "شات واجتماعات مع المعلم + دعم فني دائم.",
    },
  ];

  void nextPage() {
    if (state.currentPage < totalPages - 1) {
      emit(OnboardingUpdated(state.currentPage + 1));
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      emit(OnboardingUpdated(state.currentPage - 1));
    }
  }

  void goToPage(int page) {
    if (page >= 0 && page < totalPages) {
      emit(OnboardingUpdated(page));
    }
  }

  void completeOnboarding() {
    emit(OnboardingCompleted());
  }
}
