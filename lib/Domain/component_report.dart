class Report {
  String? Cycle;
  String? AuditID;
  String? AuditStatus;
  String? FoundStatus;
  String? DcID;
  String? DcName;
  String? ShopID;
  String? ShopName;
  String? ShopSegment;
  String? Region;
  String? Province;
  String? PageID;
  String? GroupID;
  String? QuestionID;
  String? Topic;
  String? Title;
  String? Module;
  int? Score;
  String? OverallImageUrl;
  String? FinalAnswer;
  String? AutoAnswer;
  String? AIAnswer; // แก้ไขชื่อฟิลด์เป็น AIAnswer ตรงกับชื่อใน JSON
  String? AnswerBy;
  String? AnswerDiff;
  String? ShelfShareDiff;
  String? PopDiff;
  String? ClusterDiff;
  String? ShelfLayoutDiff;
  String? IsAISkipped;
  String? ChallengeBy;
  String? AutoQuestion;
  String? DetectionStatus;
  String? SubmitByAuditorID;
  String? UpdateByAuditorID;
  String? CheckInDateTime;
  String? CheckOutDateTime;
  String? UpdateDateTime;
  String? QuestionTags;
  String? ScoreTags;
  String? QuestionRef1;
  String? QuestionRef2;
  String? ShopRef1;
  String? ShopRef2;
  String? BasketRef1;
  String? BasketRef2;

  Report({
    this.Cycle,
    this.AuditID,
    this.AuditStatus,
    this.FoundStatus,
    this.DcID,
    this.DcName,
    this.ShopID,
    this.ShopName,
    this.ShopSegment,
    this.Region,
    this.Province,
    this.PageID,
    this.GroupID,
    this.QuestionID,
    this.Topic,
    this.Title,
    this.Module,
    this.Score,
    this.OverallImageUrl,
    this.FinalAnswer,
    this.AutoAnswer,
    this.AIAnswer,
    this.AnswerBy,
    this.AnswerDiff,
    this.ShelfShareDiff,
    this.PopDiff,
    this.ClusterDiff,
    this.ShelfLayoutDiff,
    this.IsAISkipped,
    this.ChallengeBy,
    this.AutoQuestion,
    this.DetectionStatus,
    this.SubmitByAuditorID,
    this.UpdateByAuditorID,
    this.CheckInDateTime,
    this.CheckOutDateTime,
    this.UpdateDateTime,
    this.QuestionTags,
    this.ScoreTags,
    this.QuestionRef1,
    this.QuestionRef2,
    this.ShopRef1,
    this.ShopRef2,
    this.BasketRef1,
    this.BasketRef2,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(

      AuditID: json['auditID'],
      AuditStatus: json['auditStatus'],
      FoundStatus: json['foundStatus'],
      DcID: json['dcID'],
      DcName: json['dcName'],
      ShopID: json['shopID'],
      ShopName: json['shopName'],
      ShopSegment: json['shopSegment'],
      Region: json['region'],
      Province: json['province'],
      PageID: json['pageID'],
      GroupID: json['groupID'],
      QuestionID: json['questionID'],
      Topic: json['topic'],
      Title: json['title'],
      Module: json['module'],
      Score: json['score'],
      OverallImageUrl: json['overallImageUrl'],
      FinalAnswer: json['finalAnswer'],
      AutoAnswer: json['autoAnswer'],
      AIAnswer: json['aianswer'], // แก้ไขชื่อฟิลด์เป็น aianswer ตรงกับชื่อใน JSON
      AnswerBy: json['answerBy'],
      AnswerDiff: json['answerDiff'],
      ShelfShareDiff: json['shelfShareDiff'],
      PopDiff: json['popDiff'],
      ClusterDiff: json['clusterDiff'],
      ShelfLayoutDiff: json['shelfLayoutDiff'],
      IsAISkipped: json['isAISkipped'],
      ChallengeBy: json['challengeBy'],
      AutoQuestion: json['autoQuestion'],
      DetectionStatus: json['detectionStatus'],
      SubmitByAuditorID: json['submitByAuditorID'],
      UpdateByAuditorID: json['updateByAuditorID'],
      CheckInDateTime: json['checkInDateTime'],
      CheckOutDateTime: json['checkOutDateTime'],
      UpdateDateTime: json['updateDateTime'],
      QuestionTags: json['questionTags'],
      ScoreTags: json['scoreTags'],
      QuestionRef1: json['questionRef1'],
      QuestionRef2: json['questionRef2'],
      ShopRef1: json['shopRef1'],
      ShopRef2: json['shopRef2'],
      BasketRef1: json['basketRef1'],
      BasketRef2: json['basketRef2'],
      Cycle: json['cycle'],
    );
  }
//
}
