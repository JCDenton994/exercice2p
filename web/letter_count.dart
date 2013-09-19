import 'dart:html';

void main() {
  TextAreaElement zoneTexte = document.query('#Texte');
  TextAreaElement listeLettres = document.query('#Lettres');
  ButtonElement boutonCalculer = document.query('#Calculer');
  ButtonElement boutonEffacer = document.query('#Effacer');

  //Bouton Calculer
  boutonCalculer.onClick.listen((MouseEvent e){
    var text = zoneTexte.value;

    Map<String, int> Calculateur(text) {
      String removespaces =
          text.replaceAll(new RegExp(r'\W+'), '');
      List charList = removespaces.split('');
      charList.sort((m,n) => m.compareTo(n));
      var charMap = {};
      for (var char in charList) {
        charMap[char] = charMap.putIfAbsent(char, () => 0) + 1;
      }
      return charMap;
    }
    //print(letterFrequency(text));
    listeLettres.value = '${Calculateur(text)}';
  });

  //Bouton Effacer
  boutonEffacer.onClick.listen((MouseEvent e) {
    zoneTexte.value = "";
    listeLettres.value = "";
  });
}

