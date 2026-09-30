import 'story.dart';

class StoryBrain {
  int _storyIndex = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle: 'Xe của bạn bị hỏng giữa khu rừng. Bạn sẽ làm gì?',
      choice1: 'Cố gắng sửa xe',
      choice2: 'Đi bộ vào rừng',
      choice1StoryIndex: 1,
      choice2StoryIndex: 2,
    ),
    Story(
      storyTitle: 'Bạn đã sửa được xe! Đi thêm một lúc, bạn thấy một người đang xin đi nhờ. Bạn có cho họ đi nhờ không?',
      choice1: 'Cho người đó đi nhờ',
      choice2: 'Lái xe đi qua',
      choice1StoryIndex: 3,
      choice2StoryIndex: 4,
    ),
    Story(
      storyTitle: 'Bạn đi vào rừng và tìm thấy một căn nhà gỗ. Bạn có gõ cửa không?',
      choice1: 'Gõ cửa',
      choice2: 'Tiếp tục đi',
      choice1StoryIndex: 5,
      choice2StoryIndex: 6,
    ),
    Story(
      storyTitle: 'Người xin đi nhờ hóa ra là một phù thủy! Ông ấy đưa bạn một lọ thuốc phép. Bạn uống nó và cảm thấy thật tuyệt! KẾT THÚC.',
      choice1: 'Chơi lại',
      choice2: 'Chơi lại',
      choice1StoryIndex: 0,
      choice2StoryIndex: 0,
    ),
    Story(
      storyTitle: 'Bạn lái xe lướt qua người xin đi nhờ. Xe của bạn hết nhiên liệu và bạn bị mắc kẹt. KẾT THÚC.',
      choice1: 'Chơi lại',
      choice2: 'Chơi lại',
      choice1StoryIndex: 0,
      choice2StoryIndex: 0,
    ),
    Story(
      storyTitle: 'Một bác tiều phu thân thiện mở cửa, cho bạn thức ăn và chỗ trú. Bạn sống hạnh phúc mãi mãi. KẾT THÚC.',
      choice1: 'Chơi lại',
      choice2: 'Chơi lại',
      choice1StoryIndex: 0,
      choice2StoryIndex: 0,
    ),
    Story(
      storyTitle: 'Bạn tiếp tục đi và lạc trong khu rừng mãi mãi. KẾT THÚC.',
      choice1: 'Chơi lại',
      choice2: 'Chơi lại',
      choice1StoryIndex: 0,
      choice2StoryIndex: 0,
    ),
  ];

  String getStory() => _storyData[_storyIndex].storyTitle;
  String getChoice1() => _storyData[_storyIndex].choice1;
  String getChoice2() => _storyData[_storyIndex].choice2;

  bool isEnding() {
    return _storyData[_storyIndex].choice1StoryIndex == 0 &&
        _storyIndex != 0;
  }

  void makeChoice(int choiceNumber) {
    if (choiceNumber == 1) {
      _storyIndex = _storyData[_storyIndex].choice1StoryIndex;
    } else {
      _storyIndex = _storyData[_storyIndex].choice2StoryIndex;
    }
  }

  void restart() {
    _storyIndex = 0;
  }
}
