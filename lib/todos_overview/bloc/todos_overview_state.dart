part of 'todos_overview_bloc.dart';

enum TodosOverviewStatus { initial, loading, success, failure }

final class TodosOverviewState extends Equatable {
  const TodosOverviewState({
    this.status = TodosOverviewStatus.initial,
    this.todos = const [],
    this.filter = TodosViewFilter.all,
    this.lastDeletedTodo,
  });

  final TodosOverviewStatus status;
  final List<Todo> todos;
  final TodosViewFilter filter;
  final Todo? lastDeletedTodo;

  //Iterable là một cách để đại diện cho một tập hợp các phần tử có thể được lặp qua và thực thi các thao tác lặp qua như map, where, forEach,...
  // để thao tác trên các phần tử trong tập hợp đó.
  Iterable<Todo> get filteredTodos => filter.applyAll(todos);

  //việc sử dụng Function()? trong trường hợp này cho phép bạn linh hoạt cập nhật các trường của đối tượng
  // TodosOverviewState thông qua việc truyền vào các hàm để trả về giá trị mới cho các trường đó.
  TodosOverviewState copyWith({
    TodosOverviewStatus Function()? status,
    List<Todo> Function()? todos,
    TodosViewFilter Function()? filter,
    Todo? Function()? lastDeletedTodo,
  }) {
    return TodosOverviewState(
      status: status != null ? status() : this.status,
      todos: todos != null ? todos() : this.todos,
      filter: filter != null ? filter() : this.filter,
      lastDeletedTodo:
          lastDeletedTodo != null ? lastDeletedTodo() : this.lastDeletedTodo,
    );
  }

  @override
  List<Object?> get props => [
        status,
        todos,
        filter,
        lastDeletedTodo,
      ];
}
