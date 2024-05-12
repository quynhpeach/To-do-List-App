import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todos/app/app.dart';
import 'package:flutter_todos/app/app_bloc_observer.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';

void bootstrap({required TodosApi todosApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () => runApp(App(todosRepository: todosRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

//FlutterError.onError: Đoạn code này thiết lập một hàm xử lý lỗi cho ứng dụng Flutter. 
//Khi có lỗi xảy ra trong ứng dụng, hàm này sẽ được gọi và in ra chi tiết lỗi cùng với stack trace tương ứng.

// Bloc.observer: Đoạn code này thiết lập một BlocObserver cho ứng dụng sử dụng thư viện bloc. 
// BlocObserver cho phép bạn theo dõi và ghi lại các sự kiện xảy ra trong các Bloc của ứng dụng.

// TodosRepository: Đoạn code này khởi tạo một đối tượng TodosRepository từ thư viện todos_repository. 
//TodosRepository là một lớp được sử dụng để tương tác với dữ liệu từ API và cung cấp dữ liệu cho ứng dụng.

// runZonedGuarded: Đoạn code này chạy ứng dụng Flutter bên trong một Zone để bắt và xử lý các lỗi xảy ra trong ứng dụng. 
// Nếu có lỗi xảy ra trong ứng dụng, hàm xử lý lỗi được cung cấp sẽ được gọi và in ra chi tiết lỗi cùng với stack trace tương ứng.

// Cuối cùng, hàm bootstrap() được sử dụng để thực hiện các bước khởi tạo cần thiết trước khi chạy ứng dụng, 
// bao gồm thiết lập xử lý lỗi, cài đặt BlocObserver, khởi tạo TodosRepository và chạy ứng dụng trong một Zone để bảo vệ ứng dụng khỏi các lỗi không xử lý.
