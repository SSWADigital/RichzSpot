class ModelClass {
  String title;
  String subtitle;
  String description;
  String infected;
  String cured;
  String dead;
  String image;

  ModelClass(
      {this.title,
      this.subtitle,
      this.description,
      this.image,
      this.infected,
      this.cured,
      this.dead});
}

//HomeScreenList
List<ModelClass> homeScreenHomitelList = [
  ModelClass(image: "assets/icons/ic_chat.png", title: "Chat dengan Dokter"),
  ModelClass(image: "assets/icons/ic_general_check.png", title: "Telehealth"),
  // ModelClass(image: "assets/icons/ic_health_news.png", title: "Paket Check-up"),
  ModelClass(image: "assets/icons/ic_doc.png", title: "Janji dengan \nDokter"),
];
//homeScreenDiseaseList
List<ModelClass> homeScreenDiseaseList = [
  ModelClass(
      image: "assets/icons/ic_loc3.png",
      title: "Surakarta",
      infected: "Infected: 40",
      cured: "Cured: 40",
      dead: "Dead: 33"),
  ModelClass(
      image: "assets/icons/ic_world.png",
      title: "Indonesia",
      infected: "Infected: 90.929",
      cured: "Cured: 47.796",
      dead: "Dead: 3.118"),
];
//HomeScreenList
List<ModelClass> homeScreenTestList = [
  ModelClass(image: "assets/icons/ic_endocrine.png", title: "Endocrine"),
  ModelClass(image: "assets/icons/ic_dermatology.png", title: "Dermatology"),
  ModelClass(image: "assets/icons/ic_heart.png", title: "Heart"),
  ModelClass(image: "assets/icons/ic_andrology.png", title: "Andrology"),
  ModelClass(image: "assets/icons/ic_nutrition.png", title: "Nutrition"),
  ModelClass(image: "assets/icons/ic_neurology.png", title: "Neurology"),
];

List<ModelClass> allNewsScreenSlider = [
  ModelClass(
      image: "assets/imgs/libartry_img.jpg",
      title: "COVID-19 symptoms: what are they and should i see a doctor?"),
  ModelClass(
      image: "assets/imgs/libartry_img.jpg",
      title: "China Records Lowest Infections"),
  ModelClass(
      image: "assets/imgs/libartry_img.jpg",
      title:
          "Coronavirus reaches world leaders and disrupts global sporting events"),
];
List<ModelClass> allNewsScreenList = [
  ModelClass(
      image: "assets/imgs/checkup.jpg",
      title: "USA: At Least 5 States Will Close Schools"),
  ModelClass(
      image: "assets/imgs/checkup.jpg",
      title: "China Records Lowest Infections"),
  ModelClass(
      image: "assets/imgs/checkup.jpg",
      title:
          "Coronavirus reaches world leaders and disrupts global sporting events"),
];
