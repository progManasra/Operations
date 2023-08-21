class ReservationModel {
  String? reservID;
  String? reservStartDateTime;
  String? reservEndDateTime;
  String? reservTitle;
  String? reservDescriptions;
  String? reservLocationID;
  String? reservStatusID;
  String? reservOrderTypeID;
  String? reservByEmployeeID;
  String? reservEstimatedTime;
  String? reservCreatedDate;
  String? reservProductionTypeID;

  ReservationModel(
      {this.reservID,
      this.reservStartDateTime,
      this.reservEndDateTime,
      this.reservTitle,
      this.reservDescriptions,
      this.reservLocationID,
      this.reservStatusID,
      this.reservOrderTypeID,
      this.reservByEmployeeID,
      this.reservEstimatedTime,
      this.reservCreatedDate,
      this.reservProductionTypeID});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    reservID = json['Reserv_ID'];
    reservStartDateTime = json['Reserv_Start_DateTime'];
    reservEndDateTime = json['Reserv_End_DateTime'];
    reservTitle = json['Reserv_Title'];
    reservDescriptions = json['Reserv_Descriptions'];
    reservLocationID = json['Reserv_Location_ID'];
    reservStatusID = json['Reserv_Status_ID'];
    reservOrderTypeID = json['Reserv_Order_Type_ID'];
    reservByEmployeeID = json['Reserv_By_Employee_ID'];
    reservEstimatedTime = json['Reserv_Estimated_Time'];
    reservCreatedDate = json['Reserv_Created_Date'];
    reservProductionTypeID = json['Reserv_Production_Type_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Reserv_ID'] = this.reservID;
    data['Reserv_Start_DateTime'] = this.reservStartDateTime;
    data['Reserv_End_DateTime'] = this.reservEndDateTime;
    data['Reserv_Title'] = this.reservTitle;
    data['Reserv_Descriptions'] = this.reservDescriptions;
    data['Reserv_Location_ID'] = this.reservLocationID;
    data['Reserv_Status_ID'] = this.reservStatusID;
    data['Reserv_Order_Type_ID'] = this.reservOrderTypeID;
    data['Reserv_By_Employee_ID'] = this.reservByEmployeeID;
    data['Reserv_Estimated_Time'] = this.reservEstimatedTime;
    data['Reserv_Created_Date'] = this.reservCreatedDate;
    data['Reserv_Production_Type_ID'] = this.reservProductionTypeID;
    return data;
  }
}
