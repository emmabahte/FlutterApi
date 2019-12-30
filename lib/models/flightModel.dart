class FLightModel{
  final String id;
  final String name;
  final String desc;
  final String date;
  final String time;

  FLightModel({this.id,this.name,this.desc,this.date,this.time});
}


List< FLightModel > dummyData=[
 new FLightModel(

  name: 'Flight1',
  desc: 'Kerman - Tehran',
  date: '11,7,2019',
  time: '22:30'
 ),
  new FLightModel(
      id: '2',
      name: 'Flight2',
      desc: 'Kerman - Tabriz',
      date: '11,14,2019',
      time: '04:30'
  ),
  new FLightModel(
      id: '3',
      name: 'Flight3',
      desc: 'Kerman - Mashhad',
      date: '11,25,2019',
      time: '06:00'
  ),
  new FLightModel(
      id: '4',
      name: 'Flight4',
      desc: 'Kerman - Kish',
      date: '12,1,2019',
      time: '06:00'
  ),
  new FLightModel(
      id: '5',
      name: 'Flight5',
      desc: 'Kerman - Tehran',
      date: '12,7,2019',
      time: '04:00'
  ),
];