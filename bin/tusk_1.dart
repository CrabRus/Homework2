import 'dart:io';

void main() {
  print('• Введіть ліміт: ');
  double limit = double.parse(stdin.readLineSync()!); 
  var allCategory = <String, double>{};
  bool flag = true;
  while (flag) {
    print('''• Що ви хочете зробити:
    1. Додати витрату
    2. Підрахувати загальну суму та середні витрати
    3. Переглянути витрати
    0. Вийти з системи''');
    String? answer = stdin.readLineSync();
    switch (answer) {
      case '1':
        var cost;
        String category;
        print('• Введіть суму: ');
        try{
          cost = double.parse(stdin.readLineSync()!);
        } on Exception catch (e){
          print('Помилка. Введіть число');
          break;
        }
        print('  Введіть категорію: ');
        category = stdin.readLineSync().toString();
        double.parse((cost).toStringAsFixed(2));
        allCategory[category] = cost;
        break;
      case '2':
        double sum = 0;
        double average;
        double remainder;
        if (allCategory.isEmpty) {
          print('• Загальна сума витрат: 0');
          print('  Середні витрати: 0');
        } else {
          allCategory.forEach((category, cost) => sum = sum + cost);
          print('• Загальна сума витрат: $sum');
          average = double.parse((sum / allCategory.length).toStringAsFixed(2));
          print('  Середні витрати: $average');
          if(sum > limit){
            print('  Ліміт перевищено');
          }else{
            remainder = limit - sum;
            print('  Залишок: $remainder');
          }

        }
      case '3':
        print('• Усі витати:');
        if(allCategory.isEmpty){
          print('  Витрат немає');
        }else{
          allCategory.forEach((category, cost) => print('  $category --- $cost'));
        }
        break;
      case '0':
        flag = !flag;
        break;
      default:
        print('• Не знайдено. Спробуйте ще раз');
    }
  }
}
