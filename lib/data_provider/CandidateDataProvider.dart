import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:meta/meta.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/util/util.dart';

class CandidateDataProvider {

  final http.Client httpClient;

  CandidateDataProvider({@required this.httpClient})
      :assert(httpClient != null);


  Future<List<Candidate>> getCandidates() async {
    List<Candidate>candidates;
    final url = "https://192.168.56.1:8080/v1/candidates";

    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List<dynamic>;

        if (extractedData == null) {
          return null;
        }
        else {
          candidates =
              extractedData.map<Candidate>((json) => Candidate.fromJson(json))
                  .toList();
        }
      }
      else {
        throw HttpException("error occured");
      }
    } catch (e) {
      throw e;
    }
    return candidates;
  }

  Future<Candidate> getCandidate(String id) async {
    final url = "https://192.168.56.1:8080/v1/candidates/$id";
    Candidate cndt;

    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final extractedata = json.decode(response.body) as Map<String, dynamic>;
        if (extractedata == null) {
          return null;
        }
        else {
          cndt = Candidate.fromJson(extractedata);
        }
      }
      else {
        throw HttpException("error occurred");
      }
    }
    catch (e) {
      throw e;
    }
    return cndt;
  }


  Future<Candidate> postCandidate(Candidate candidate) async {
    final url = "http://192.168.56.1:8080/v1/candidate";
    Candidate cndt;
    Util util = new Util();
    String token = await util.getUserToken();

    try {
      final response = await http.post(
        url,
        body: json.encode({
          "id": candidate.id,
          "name": candidate.name,
          "partyID": candidate.partyID,
        }),

        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );

      if (response.statusCode == 201) {
        final extractedData = json.decode(response.body) as Map<String,
            dynamic>;
        cndt = Candidate.fromJson(extractedData);
      }
      else {
        throw HttpException("error occured");
      }
    }
    catch (e) {
      throw e;
    }
    return cndt;
  }

  Future<Candidate> putCandidate(Candidate candidate) async {
    final url = "http://192.168.56.2:8080/v1/party/${candidate.id}";
    Candidate cndt;
    Util util = new Util();
    String token = await util.getUserToken();

    try {
      final response = await http.put(
        url,
        body: json.encode({
          "id": candidate.id,
          "name": candidate.name,
          "partyID": candidate.partyID,
        }),
        headers: {

          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as Map<String,
            dynamic>;
        cndt = Candidate.fromJson(extractedData);
      }
      else {
        throw HttpException("error occured");
      }
    } catch (e) {
      throw e;
    }
    return cndt;
  }

  Future<void> deleteCandidate(String id) async {
    final url = "http://198.168.56.1:8080/v1/candidate/$id";

    try {
      final response = await http.delete(url);
      if (response.statusCode != 200) {
        throw HttpException("error occured");
      }
    } catch (e) {
      throw e;
    }
  }

}