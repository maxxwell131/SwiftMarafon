print("---Task 1 & 2---")

enum Piece {
    case King(name: Name, color: Color,positionX: PositionX, positionY: Position)
    case Queen(name: Name, color: Color, positionX: Position, positionY: Position)
    case Bishop(name: Name, color: Color, positionX: Position, positionY: Position)
    case Knight(name: Name, color: Color, positionX: Position, positionY: Position)
    case Castle(name: Name, color: Color, positionX: Position, positionY: Position)
    case Pawn(name: Name, color: Color, positionX: Position, positionY: Position)
    
    enum Name: String {
        case King = "King"
        case Queen = " Queen"
        case Bishop = "Bishop"
        case Knight = "Knight"
        case Castle = "Castle"
        case Pawn = "Pawn"
        
    }
    
    enum Color: String {
        case Black = "Black"
        case White = "White"
    }
    
    enum Position {
        case x(PositionX)
        case y(Int)
    }
    
    enum PositionX: Int {
        case A = 1
        case B = 2
        case C = 3
        case D = 4
        case E = 5
        case F = 6
        case G = 7
        case H = 8
    }
}

let whiteKing: Piece = .King(name: .King, color: .White,positionX: .A, positionY: .y(1))
//let blackKing: Piece = .King(name: .King, color: .Black, positionX: .x("A"), positionY: .y(2))
//let blackCastle: Piece = .Castle(name: .Castle, color: .Black, positionX: .x("B"), positionY: .y(1))

//let chessboard: [Piece] = [ whiteKing, blackKing, blackCastle]
