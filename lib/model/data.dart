import './catagories_model.dart';

String apiKey='563492ad6f91700001000001f35441c63e4544d5bc5b528306c1925d';
List<Categoriesmodel> getCategories(){
    List<Categoriesmodel> categorie=new List();
    Categoriesmodel categoriesmodel=new Categoriesmodel();
    
    categoriesmodel.imgurl =
      "https://images.pexels.com/photos/1036398/pexels-photo-1036398.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.categoriesname = "Street Art";
  categorie.add(categoriesmodel);
  categoriesmodel = new Categoriesmodel();

  categoriesmodel.imgurl =
      "https://images.pexels.com/photos/567540/pexels-photo-567540.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.categoriesname = "wild life";
  categorie.add(categoriesmodel);
  categoriesmodel = new Categoriesmodel();

  categoriesmodel.imgurl =
      "https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.categoriesname = "coding";
  categorie.add(categoriesmodel);
  categoriesmodel = new Categoriesmodel();

categoriesmodel.imgurl =
      "https://images.pexels.com/photos/3165335/pexels-photo-3165335.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.categoriesname = "gameing";
  categorie.add(categoriesmodel);
  categoriesmodel = new Categoriesmodel();

categoriesmodel.imgurl =
      "https://images.pexels.com/photos/1107717/pexels-photo-1107717.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.categoriesname = "nature";
  categorie.add(categoriesmodel);
  categoriesmodel = new Categoriesmodel();

  categoriesmodel.imgurl =
      "https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.categoriesname = "city";
  categorie.add(categoriesmodel);
  categoriesmodel = new Categoriesmodel();

  categoriesmodel.imgurl =
      "https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesmodel.categoriesname = "cars";
  categorie.add(categoriesmodel);
  categoriesmodel = new Categoriesmodel();

  return categorie;
}

