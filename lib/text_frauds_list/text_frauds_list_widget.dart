import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_frauds_list_model.dart';
export 'text_frauds_list_model.dart';

class TextFraudsListWidget extends StatefulWidget {
  const TextFraudsListWidget({
    Key? key,
    this.showBody,
  }) : super(key: key);

  final bool? showBody;

  @override
  _TextFraudsListWidgetState createState() => _TextFraudsListWidgetState();
}

class _TextFraudsListWidgetState extends State<TextFraudsListWidget> {
  late TextFraudsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFraudsListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Smishing Texts',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 32.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://picsum.photos/id/115/600',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<TextDataRecord>>(
                        stream: queryTextDataRecord(
                          queryBuilder: (textDataRecord) =>
                              textDataRecord.where(
                            'fraud_threat',
                            isEqualTo: true,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<TextDataRecord> listViewTextDataRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewTextDataRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewTextDataRecord =
                                  listViewTextDataRecordList[listViewIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 2.0, 2.0, 2.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1674049405160-9b800f5645f5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxmcmF1ZHxlbnwwfHx8fDE2OTYxNjEwOTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              listViewTextDataRecord.sender,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF15161E),
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              'Threat Score :  ${listViewTextDataRecord.score.toString()}',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF606A85),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Text(
                                                      listViewTextDataRecord
                                                          .timestamp,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF606A85),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Color(0xFF606A85),
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 1.0,
                                            thickness: 1.0,
                                            color: Color(0xFFE5E7EB),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
