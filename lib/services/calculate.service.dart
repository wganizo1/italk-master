class CalculateService {
  Future<String> calculateTwoNumbers(String firstNumber, String secondNumber) async {
    int answer = int.parse(firstNumber) + int.parse(secondNumber);
    print("$firstNumber + $secondNumber = $answer");
    return "$firstNumber + $secondNumber = $answer";
  }
}
