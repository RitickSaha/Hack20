import '../models/task_model.dart';

List<TaskModel> _taskList = [
  TaskModel(
      title: "Plant Trees",
      description:
          "Plant at least 40 trees in a time period of 100 days and become the member of group which is working not only for themselves but also for their future generation. Also, you will be awarded with the badge of 'Saviour of Earth'",
      imageUrl:
          "https://media.beliefnet.com/~/media/photos-with-attribution/nature/smalltreehandenvironmentcreditshuterstockcom.jpg",
      points: 100,
      duration: 100),
  TaskModel(
      title: "Use Public Transport",
      description:
          "Use public transport instead of personal transport while going for work for at least 3 days a week. You might not realise but you this small contribution will cause 2 tons of less pollution per year. Strange know but its true !!",
      imageUrl:
          "http://www.yellowcabnyctaxi.com/wp-content/uploads/2016/08/NYC_Taxi.jpg",
      points: 35,
      duration: 7),
  TaskModel(
      title: "Feed Stray animals",
      description:
          "Choose a spot and feed them at the same place, every day. Let the spot not be closer to your house, especially if you have a pet and this might lead to fights between them. No time Duration here, do as long as possible.",
      imageUrl:
          "https://www.thenewsminute.com/sites/default/files/Animals-feed-kochi.jpg",
      points: 40,
      duration: 5),
  TaskModel(
      title: "Public Transport",
      description:
          "Clients who book through Yellow Taxi 333's online platform usually want to track the vehicle to the end destination. Pretty often, these clients are business partners or parents. The new Web platform is already available, you can easily book a cab after simple registration",
      imageUrl:
          "https://www.thenewsminute.com/sites/default/files/Animals-feed-kochi.jpg",
      points: 50,
      duration: 1),
];

List<TaskModel> get taskList {
  return [..._taskList];
}
