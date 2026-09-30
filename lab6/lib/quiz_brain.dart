import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Bò có thể đi xuống cầu thang nhưng không thể đi lên.', false),
    Question('Khoảng một phần tư xương trong cơ thể người nằm ở bàn chân.', true),
    Question('Máu của con sên có màu xanh lá.', true),
    Question('Tên thời con gái của mẹ Buzz Aldrin là Moon (Mặt Trăng).', true),
    Question('Ở Bồ Đào Nha, đi tiểu xuống đại dương là hành vi bất hợp pháp.', true),
    Question('Không có tờ giấy vuông khô nào có thể gấp đôi nhiều hơn 7 lần.', false),
    Question('Ở London, nếu bạn chết trong Tòa nhà Quốc hội, bạn có quyền được tổ chức quốc tang.', true),
    Question('Âm thanh lớn nhất do động vật tạo ra là 188 decibel, đó là voi châu Phi.', false),
    Question('Tổng diện tích bề mặt của hai lá phổi người khoảng 70 mét vuông.', true),
    Question('Google ban đầu có tên là Backrub.', true),
    Question('Sô-cô-la ảnh hưởng đến tim và hệ thần kinh của chó; chỉ vài ounce có thể giết một con chó nhỏ.', true),
    Question('Ở Tây Virginia, Mỹ, nếu bạn vô tình đâm vào động vật bằng xe hơi, bạn được phép mang về nhà để ăn.', true),
    Question('Barack Obama đã giành giải Grammy cho Album Spoken Word hay nhất.', true),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}