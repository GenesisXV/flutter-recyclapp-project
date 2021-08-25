import 'package:path/path.dart';
import 'package:recyclapp_v1/screens/gestionAchat/article.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final table = 'user';
  static final table2 = 'article';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnGender = 'gender';
  static final columnEmail = 'email';
  static final columnPassword = 'password';
  static final columnAge = 'age';
  static final columnImageOne = 'image0';
  static final columnImageTwo = 'image1';
  static final columnImageThree = 'image2';
  static final columnImageFour = 'image3';
  static final columnImageIntro = 'intro';

  static final columnTitle = 'title';
  static final columnImgurl = 'imageUrl';
  static final columnCategorie = 'categorie';
  static final columnPrix = 'prix';
  static final columnQuantite = 'quantite';
  static final columnDescription = 'description';

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'recyclapp.db'),
      onCreate: (database, version) async {
        await database.execute(
            '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnGender TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPassword TEXT NOT NULL,
            $columnAge INTEGER NOT NULL,
            $columnImageOne TEXT,
            $columnImageTwo TEXT,
            $columnImageThree TEXT,
            $columnImageFour TEXT,
            $columnImageIntro TEXT
          )
          ''');

        await database.execute(
            '''
          CREATE TABLE $table2 (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnImgurl TEXT NOT NULL,
            $columnCategorie TEXT NOT NULL,
            $columnPrix INTEGER NOT NULL,
            $columnQuantite INTEGER NOT NULL,
            $columnDescription TEXT
          )
          ''');
      },
      version: 1,
    );
  }

  //Les insertes

  Future<int> insert(Map<String, dynamic> row) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert(table, row);
    return result;
  }

  void insertArticle(Article article) async {
    final Database db = await initializeDB();
    await db.insert(
      table2,
      article.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//Les selects *

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await initializeDB();
    return await db.query(table);
  }

//les counts

  Future<int?> queryRowCount() async {
    Database db = await initializeDB();
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

//Les updates

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await initializeDB();
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  void updateArticle(Article article) async {
    Database db = await initializeDB();
    await db.update("recipe", article.toMap(),
        where: "title = ?", whereArgs: [article.title]);
  }

//Les deletes

  Future<int> delete(int id) async {
    Database db = await initializeDB();
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  void deleteArticles(String title) async {
    Database db = await initializeDB();
    await db.delete(table2, where: '$columnTitle = ?', whereArgs: [title]);
  }

  //Fonction de creation

  Future<List<Article>> articles() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query(table2);
    List<Article> articles = List.generate(maps.length, (i) {
      return Article.fromMap(maps[i]);
    });

    if (articles.isEmpty) {
      for (Article article in defaultArticlesListe) {
        insertArticle(article);
      }
      articles = defaultArticlesListe;
    }

    return articles;
  }

  final List<Article> defaultArticlesListe = [
    Article("Fer-1", "images/fer.jpg", "Boite de conserve\n", 20, 10,
        "Boite de sardines"),
    Article("Plastique-1", "images/plastique.jpg", "Bouteille\n", 20, 10,
        "Bouteille Voltic User"),
    Article("Papier-1", "images/papier.jpg", "Papier\n", 20, 10, "Papier Rame"),
    Article("Fer-2", "images/fer.jpg", "Boite de conserve\n", 20, 10,
        "Boite de sardines"),
    Article(
      "Papier-2",
      "images/papier.jpg",
      "Papier\n",
      20,
      10,
      "Papier Rame",
    ),
    Article("Fer-3", "images/fer.jpg", "Boite de conserve\n", 20, 10,
        "Boite de sardines")
  ];
}
