import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:voting_system_flutter/models/model.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart'as http;

class PartyDataProvider{
  final http.Client httpClient;

  PartyDataProvider({@required this.httpClient}):assert(httpClient != null);


  Future<List<Party>>GetParties()async{

    final url = "http://192.168.56.1:8080/v1/parties";
    List<Party>parties;


    try{

       final response = await httpClient.get(url);
       if(response.statusCode == 200){

         final extractedData = json.decode(response.body)as List<dynamic>;
         
         if(extractedData == null){
           return null;
         }else {
           
           parties = extractedData.map<Party>((json) => Party.fromJson(json)).toList();
         }


       }
       else{
         throw HttpException("error occurred");
       }

     }catch(e){
       throw e;
    }

    return parties;

  }

  Future<Party>GetParty(String id) async{
    final url = "http://192.168.56.1:8080/v1/party";
    Party party;

    try{
         final response = await httpClient.get(url);
         if(response.statusCode == 500){
            throw HttpException("error occured");
         }
         else if(response.statusCode == 404){
           throw HttpException("error occured");
         }
         else{
           final extractedData = json.decode(response.body) as Map<String,dynamic>;

           party = Party.fromJson(extractedData);

         }


    }catch(e){
      throw e;
    }

    return party;
  }

  Future<Party>PostParty(Party party)async{
    final url = "http://192.168.56.1:8080/v1/party";
    Party pt;

    try{

       final response = await httpClient.post(
         url,
         body: json.encode({
           "id": party.id,
           "name": party.name,
         }),
       );
       if (response.statusCode == 201){
          final extractedData = json.decode(response.body)as Map<String,dynamic>;
          pt = Party.fromJson(extractedData);
       }
       else{
         throw HttpException("error occured");
       }
    }
    catch(e){
      throw e;
    }
    return pt;
  }

  Future<Party>PutParty(Party party)async{

    final url = "http://192.168.56.2:8080/v1/party/${party.id}";
    Party pt;

    try{

       final response = await httpClient.put(
           url,
           body: json.encode({
             "id":party.id,
             "name":party.name,
           }),
       );

       if(response.statusCode == 200){
         final extractedData = json.decode(response.body)as Map<String,dynamic>;
         pt = Party.fromJson(extractedData);
       }
       else{
         throw HttpException("error occured");
       }
    }catch(e){
      throw e;
    }
    return pt;

  }

  Future<void>DeleteParty(String id)async{

    final url = "http://198.168.56.1:8080/v1/party/$id";

    try{

      final response = await httpClient.delete(url);
       if(response.statusCode != 200){
         throw HttpException("error occured");
       }
    }catch(e){
      throw e;
    }

  }

}