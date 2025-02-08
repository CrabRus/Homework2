import 'dart:html_common';
import 'dart:math';

void main(){
    int students = 30;
    List<int> marks = [];
    double average;
    int max = 0;
    int min = 0;
    Map<int, int> journal = {}; 
    Set<int> best_students = {};
    for(int i = 0; i < students; i++){
      var random = Random();
      marks.add(random.nextInt(13));
      // if (marks[i]== 0){
      //   marks[i] = null;
      // }
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

      if(element>10){
        best_students.add(element);
      }
    },);

    for (int i = 0; i < marks.length; i++){
      journal[i] = marks[i];
    }


    
    average = double.parse((sum/marks.length).toStringAsFixed(1));
    
    print(marks);
    print(sum);
    print(average);
    print(max);
    print(min);
    print(best_students);
    journal.forEach((key, value) => print('$key --- $value'));

}