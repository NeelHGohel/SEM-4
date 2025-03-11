import 'database.dart';

void main() async {
  MyDatabase db = MyDatabase();

  int categoryId = await db.insertCategory('Work');
  await db.insertCategory('Personal');


  await db.selectAllTasks();

  await db.selectAllCategories();

  await db.selectTasksByCategory(1);
}
