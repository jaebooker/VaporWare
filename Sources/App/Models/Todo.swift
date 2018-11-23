import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Todo: SQLiteModel {
    /// The unique identifier for this `Todo`.
    var id: Int?

    /// A title describing what this `Todo` entails.
    var name: String
    var position: String
    var represents: String
    var ratFucker: Bool
    var gerrymander: Bool
    var voterSupression: Bool
    var ratKing: Bool
    var ratKiller: Bool

    /// Creates a new `Todo`.
    init(id: Int? = nil, name: String, position: String, represents: String, ratFucker: Bool, gerrymander: Bool, voterSupression: Bool, ratKing: Bool, ratKiller: Bool) {
        self.id = id
        self.name = name
        self.position = position
        self.represents = represents
        self.ratFucker = ratFucker
        self.gerrymander = gerrymander
        self.voterSupression = voterSupression
        self.ratKing = ratKing
        self.ratKiller = ratKiller
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Todo: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Todo: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Todo: Parameter { }
