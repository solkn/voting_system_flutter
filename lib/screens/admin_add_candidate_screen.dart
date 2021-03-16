import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting_system_flutter/blocs/candidate/candidate.dart';
import 'package:voting_system_flutter/blocs/party/party.dart';
import 'package:voting_system_flutter/models/model.dart';
import 'package:voting_system_flutter/screens/route.dart';


class CandidateAddUpdate extends StatefulWidget {
  static const routName = "admin_add_candidate";

  final CandidateRoutArgs candidateArgs;

  CandidateAddUpdate({@required this.candidateArgs});

  @override
  CandidateAddUpdateState createState() {
    return CandidateAddUpdateState();
  }
}

class CandidateAddUpdateState extends State<CandidateAddUpdate> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final _candidateFocusNode = FocusNode();

  String candidateName = "";
  Candidate candidate = Candidate();
  bool isInit = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit && widget.candidateArgs.edit) {
      candidateName = widget.candidateArgs.candidate.name;
      isInit = true;
    }
  }

  @override
  void dispose() {
    _candidateFocusNode.dispose();

    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState.save();

    if(widget.candidateArgs.edit) {
      candidate = Candidate(
        id: widget.candidateArgs.candidate.id,
        name: candidateName,
        partyID: widget.candidateArgs.candidate.partyID,
        party: widget.candidateArgs.candidate.party,

      );

      BlocProvider.of<CandidateBloc>(context, listen: false)
        ..add(UpdateCandidateEvent(candidate: candidate));
    }else{
      candidate = Candidate(
        name: candidateName,
        partyID: widget.candidateArgs.candidate.partyID,
        party: widget.candidateArgs.candidate.party,
      );
      BlocProvider.of<CandidateBloc>(context, listen: false)
        ..add(PostCandidateEvent(candidate: candidate));
    }
  }



@override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title:
        widget.candidateArgs.edit ? Text("Update candidate") : Text("Add Candidate"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: _saveForm)
        ],
      ),
      body: BlocConsumer<CandidateBloc, CandidateStates>(
        listener: (_, state) {
          if ((state is CandidatePostingState) || (state is CandidateUpdatingState)) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CandidatePostingErrorState) {
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text('Error Adding the candidate')));
          }
          if (state is CandidateUpdatingErrorState) {
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text('Error Updating the candidate')));
          }
          if ((state is CandidatePostedState) || (state is CandidateUpdatedState)) {
            BlocProvider.of<PartyBloc>(context).add(GetPartyEvent());
            BlocProvider.of<CandidateBloc>(context).add(GetCandidateEvent());
            Navigator.pop(context);
          }
        },
        builder: (_, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                    child: TextFormField(
                      initialValue: widget.candidateArgs.edit
                          ? widget.candidateArgs.candidate.name:"",
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      focusNode: _candidateFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_candidateFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'invalid input';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        candidateName = value;
                      },
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: widget.candidateArgs.edit
                              ? widget.candidateArgs.candidate.name:"",
                          hintText: 'Enter Name'),
                    ),
                  ),


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
