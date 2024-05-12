part of 'todos_overview_bloc.dart';

// sealed class được sử dụng để định nghĩa một lớp cha trừu tượng mà không thể được khởi tạo trực tiếp.
// Các lớp con của sealed class phải được khai báo trong cùng một tệp và không thể được mở rộng hoặc triển khai bên ngoài tệp đó.
// Điều này giúp đảm bảo rằng tất cả các lớp con của sealed class được quản lý và sử dụng trong phạm vi hạn chế,
// giúp cải thiện tính bảo mật và quản lý mã nguồn.
sealed class TodosOverviewEvent extends Equatable {
  const TodosOverviewEvent();

  //Khi mở rộng Equatable, phải triển khai phương thức props để xác định các thuộc tính cần được sử dụng trong quá trình so sánh.
  //Khi so sánh hai đối tượng, Equatable sẽ tự động so sánh các giá trị của các thuộc tính được xác định trong phương thức props.
  @override
  List<Object> get props => [];
}

// This is the startup event. In response, the bloc subscribes to the stream of todos from the TodosRepository.
final class TodosOverviewSubscriptionRequested extends TodosOverviewEvent {
  const TodosOverviewSubscriptionRequested();
}

final class TodosOverviewTodoCompletionToggled extends TodosOverviewEvent {
  const TodosOverviewTodoCompletionToggled({
    required this.todo,
    required this.isCompleted,
  });

  final Todo todo;
  final bool isCompleted;

  @override
  List<Object> get props => [todo, isCompleted];
}

final class TodosOverviewTodoDeleted extends TodosOverviewEvent {
  const TodosOverviewTodoDeleted(this.todo);

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

final class TodosOverviewUndoDeletionRequested extends TodosOverviewEvent {
  const TodosOverviewUndoDeletionRequested();
}

// This takes a TodosViewFilter as an argument and changes the view by applying a filter.
class TodosOverviewFilterChanged extends TodosOverviewEvent {
  const TodosOverviewFilterChanged(this.filter);

  final TodosViewFilter filter;

  @override
  List<Object> get props => [filter];
}

//This toggles completion for all todos.
class TodosOverviewToggleAllRequested extends TodosOverviewEvent {
  const TodosOverviewToggleAllRequested();
}

//This deletes all completed todos.
class TodosOverviewClearCompletedRequested extends TodosOverviewEvent {
  const TodosOverviewClearCompletedRequested();
}
