
enum AlbumCollectionSectionType: Int, CustomStringConvertible {
  case all

  var description: String {
    switch self {
    case .all: return "All Photos"
   
    }
  }
}
