import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/util/util.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart'as http;

class ResultDataProvider{
  final http.Client httpClient;

  ResultDataProvider({@required this.httpClient}):assert(httpClient != null);


  Future<List<Result>>getResults()async{

    final url = "http://192.168.56.1:8080/v1/results";
    List<Result>results;


    try{

      final response = await httpClient.get(url);
      if(response.statusCode == 200){

        final extractedData = json.decode(response.body)as List<dynamic>;

        if(extractedData == null){
          return null;
        }else {

          results = extractedData.map<Result>((json) => Result.fromJson(json)).toList();
        }


      }
      else{
        throw HttpException("error occurred");
      }

    }catch(e){
      throw e;
    }

    return results;

  }

  Future<Result>getResult(String id) async{
    final url = "http://192.168.56.1:8080/v1/result";
    Result result;

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

        result = Result.fromJson(extractedData);

      }


    }catch(e){
      throw e;
    }

    return result;
  }

  Future<Result>postResult(Result result)async{
    final url = "http://192.168.56.1:8080/v1/result";
    Result rslt;
    Util util = new Util();
    String token = await util.getUserToken();

    try{

      final response = await httpClient.post(
        url,
        body: json.encode({
          "id": result.id,
          "ballot": result.ballot,
          "partyID":result.partyID,
        }),
        headers: {

               HttpHeaders.contentTypeHeader:"application/json",
               HttpHeaders.authorizationHeader:"Bearer $token",
        },
      );
      if (response.statusCode == 201){
        final extractedData = json.decode(response.body)as Map<String,dynamic>;
        rslt = Result.fromJson(extractedData);
      }
      else{
        throw HttpException("error occured");
      }
    }
    catch(e){
      throw e;
    }
    return rslt;
  }

  Future<Result>putResult(Result result)async{

    final url = "http://192.168.56.2:8080/v1/bloc.party/${result.id}";
    Result rslt;
    Util util = new Util();
    String token = await util.getUserToken();

    try{

      final response = await httpClient.put(
        url,
        body: json.encode({
          "id": result.id,
          "ballot": result.ballot + 1,
          "partyID":result.partyID,
        }),
        headers: {

          HttpHeaders.contentTypeHeader:"application/json",
          HttpHeaders.authorizationHeader:"Bearer $token",
        },
      );

      if(response.statusCode == 200){
        final extractedData = json.decode(response.body)as Map<String,dynamic>;
        rslt = Result.fromJson(extractedData);
      }
      else{
        throw HttpException("error occured");
      }
    }catch(e){
      throw e;
    }
    return rslt;

  }

  Future<void>deleteResult(String id)async{

    final url = "http://198.168.56.1:8080/v1/bloc.party/$id";

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