import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Todo]> {
        return Todo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        return try req.content.decode(Todo.self).flatMap { todo in
            return todo.save(on: req)
        }
    }
    func update(_ req: Request) throws -> Future<Todo> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return try req.content.decode(Todo.self).flatMap { newTodo in
                todo.name = newTodo.name
                todo.position = newTodo.position
                todo.represents = newTodo.represents
                todo.ratFucker = newTodo.ratFucker
                todo.gerrymander = newTodo.gerrymander
                todo.voterSupression = newTodo.voterSupression
                todo.ratKing = newTodo.ratKing
                todo.ratKiller = newTodo.ratKiller
                return todo.save(on: req)
            }
        }
    }
    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
}
