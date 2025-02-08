import 'dart:convert';
import 'dart:io';

void main(){
  print('• Введіть текст: ');
  String text = stdin.readLineSync(encoding: utf8)!;
  Set<String> words_list = {};
  int words = 0;
  int sentences = 0;
  var wordFrequency = <String, int>{};
  var endWords = [' '];
  var endSentences = [',', '.', '!', '?'];
  String longest_word = '';

  for(int i = 0; i < text.length; i++){
    if (endWords.contains(text[i]) && !endSentences.contains(text[i-1])){
      words++;
    }

    if (endSentences.contains(text[i]) && !endSentences.contains(text[i-1])){
      words++;
      sentences++;
    }

    if (i + 1 == text.length && !endSentences.contains(text[i])){
      words++;
      sentences++;
    }
  }


String currentWord = '';

for (int i = 0; i < text.length; i++) {
  if (!endWords.contains(text[i]) && !endSentences.contains(text[i])) {
    currentWord += text[i];
  } else if (currentWord.isNotEmpty) {
    words_list.add(currentWord);
    currentWord = '';
  }
  }
  if (currentWord.isNotEmpty) {
    words_list.add(currentWord);
  }
  
  for(String word in words_list){
    wordFrequency[word] = (wordFrequency[word] ?? 0) + 1;
  }

  for (var word in words_list){
    if (longest_word.length <= word.length){
      longest_word = word;
    }
  }

  print("Кількість слів: $words");
  print("Кількість речень: $sentences");
  print("Найдовше слово: $longest_word");
  print(words_list);
  print(wordFrequency);

}