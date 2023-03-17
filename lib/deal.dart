
class Deal{
  int? id;
  String? title;
  String? discription;
  Deal({this.id, this.title, this.discription});
}

List<Deal> deals = [
  Deal(
    id: 1,
    title: "Дописать Flutter",
    discription: "В четверг вечером добавить новую функцию",
  ),
  Deal(
    id: 2,
    title: "Добавить func JS",
    discription: "Сделать уведомление о новых сообщениях",
  ),
  Deal(
    id: 3,
    title: "Почистить пк",
    discription: "Купить сжатый воздух и почитсить пк",
  ),
  Deal(
    id: 4,
    title: "Приготовить покушать",
    discription: "Сходить в магаз и купить всё для лазаньи",
  )
];

// List<Deal> deals = [];