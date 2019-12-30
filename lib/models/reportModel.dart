class ReportModel{
final String subject;
final String text;
final String serial;
final String sender;
final String time;
final String date;
final String type;
ReportModel({this.sender,this.subject,this.text,this.serial,this.time,this.date,this.type});
}
 List<ReportModel> ReportData=[
  new ReportModel(
    sender: 'Emad Bahreini Pour',
    text: 'EWFWEVVWEVWEVWEVWEVWEVWEVWEVEWVFVRFGEGEVERERV',
    subject: 'Flight Report',
    serial: '',
    time: '22:30',
    date: '2019/22/12',
   type: 'sth'
  ),
  new ReportModel(
      sender: 'Emad Bahreini Pour',
      text: 'EWFWEVVWEVWEVWEVWEVWEVWEVWEVEWVFVRFGEGEVERERV',
      subject: 'Report 2',
      serial: '',
      time: '08:30',
      date: '2019/02/10',
      type: 'sth'
  ),
];