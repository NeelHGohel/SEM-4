
import 'database.dart';

void main() async {
  MyDatabase db = MyDatabase();

  int categoryId = await db.insertCategory('Work');
  await db.insertCategory('Personal');

  int taskId1 = await db.insertTask('Complete Flutter Project', 'Finish the project for the course', '2025-02-01', categoryId);
  int taskId2 = await db.insertTask('Buy groceries', 'Buy milk, eggs, and bread', '2025-01-31', 2);

  await db.selectAllTasks();

  await db.selectAllCategories();

  await db.selectTasksByCategory(1);
}