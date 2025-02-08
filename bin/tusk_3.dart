import 'dart:math';

void main(){
    int students = 30;
    List<int> marks = [];
    double average;
    int max = 0;
    int min = 12;
    Map<int, int?> journal = {};
    Map<int, int?> high = {};
    Map<int, int?> middle = {};
    Map<int, int?> low = {};

    Set<int> best_marks = {};

    for(int i = 0; i < students; i++){
      var random = Random();
      marks.add(random.nextInt(13));
    }
    
    var sum = 0;
    marks.forEach((element) {
      if(max <= element){
        max = element;
      }
      if(min >= element){
        min = element;
      }
      sum += element;

      if(element>=10){
        best_marks.add(element);
      }
    },);

    for (int i = 0; i < marks.length; i++){
      if (marks[i] == 0){
        journal[i+1] = null;
      }else{
        journal[i+1] = marks[i];
      }
    }

    journal.forEach((key, value) =>{
      if(value != null){
        if (value >= 10){
          high[key] = value
      } else if(value <= 9  && value >= 7){
          middle[key] = value
      } else{
          low[key] = value
      }
      }

    });

    
    average = double.parse((sum/marks.length).toStringAsFixed(1));


    
    print('• Середня оцінка: $average');
    print('• Найвища оцінка: $max');
    print('• Найнижча оцінка: $min');
    print('• Кращі оцінки: $best_marks');
    print('• Журнал оцінок: ');
    journal.forEach((key, value) => print('$key --- $value'));
    print('• Журнал відмінників: ');
    high.forEach((key, value) => print('$key --- $value'));
    print('• Журнал хорошистів: ');
    middle.forEach((key, value) => print('$key --- $value'));
    print('• Журнал неуспішних: ');
    low.forEach((key, value) => print('$key --- $value'));

}