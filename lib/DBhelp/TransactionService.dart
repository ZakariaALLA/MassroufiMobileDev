import 'package:http/http.dart' as http;
import 'dart:convert';

String host = "http://localhost:8080/";
class TransactionService {
  static List<Transaction> getTransactions(String prenom) {
    http.get(Uri.parse(host+"transactions/byUtilisateur/")).then((response){
        print(json.decode(response.body));
    }).catchError((err){
      print(err);
    });
  }
}

class Transaction{
  double id;
  //Categorie categorie ;
  String libelle ;
  double montant;
  //Date date;
  //Utilisateur utilisateur;

}