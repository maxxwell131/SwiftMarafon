import Foundation
/*
 1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 
 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
 */
print("---Task 1 & 2---")

enum Piece {
    case King(name: Name, color: Color,positionX: PositionX, positionY: Int)
    case Queen(name: Name, color: Color, positionX: PositionX, positionY: Int)
    case Bishop(name: Name, color: Color, positionX: PositionX, positionY: Int)
    case Knight(name: Name, color: Color, positionX: PositionX, positionY: Int)
    case Castle(name: Name, color: Color, positionX: PositionX, positionY: Int)
    case Pawn(name: Name, color: Color, positionX: PositionX, positionY: Int)
    
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

var whiteKing: Piece = .King(name: .King, color: .White,positionX: .A, positionY: 1)
var blackKing: Piece = .King(name: .King, color: .Black, positionX: .A, positionY: 2)
var blackCastle: Piece = .Castle(name: .Castle, color: .Black, positionX: .B, positionY: 1)

var chessboard: [Piece] = [ whiteKing, blackKing, blackCastle]

func showPiece(piece: Piece) -> String{
    var result = String()
    
    switch piece {
    case .King(let name, let color, let posX, let posY):
        result = "\(name.rawValue) \(color.rawValue) color with position: \(posX) and \(posY)"
    case .Queen(let name, let color, let posX, let posY):
        result = "\(name.rawValue) \(color.rawValue) color with position: \(posX) and \(posY)"
    case .Bishop(let name, let color, let posX, let posY):
        result = "\(name.rawValue) \(color.rawValue) color with position: \(posX) and \(posY)"
    case .Knight(let name, let color, let posX, let posY):
        result = "\(name.rawValue) \(color.rawValue) color with position: \(posX) and \(posY)"
    case .Castle(let name, let color, let posX, let posY):
        result = "\(name.rawValue) \(color.rawValue) color with position: \(posX) and \(posY)"
    case .Pawn(let name, let color, let posX, let posY):
        result = "\(name.rawValue) \(color.rawValue) color with position: \(posX) and \(posY)"
    }
    return result
}

for obj in chessboard {
   print(showPiece(piece: obj))
}

/*
 3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
*/

print("---Task 3---")

//MARK: функция печатает на экран доску и выводит на нее фигуры
func showChessboard (board: [Piece]) {
    var chessBoard = String()
    
    for i in 1...8 {
        for j in 1...8 {
            //проверка piece из массива фигур, если есть фигура с текущими координатами, печатаем фигуру иначе клетку
            
            if let currentPiece = chekPieceOnTheBoard(WithX: i, AndY: j, InThe: chessboard) {
                chessBoard += currentPiece
            } else {
                chessBoard += ((i + j) % 2 == 0 ? "\u{2B1C}" :  "\u{2B1B}")
            }
        }
            chessBoard += "\r"
        }
        print(chessBoard)
    }

//MARK: функция принимает фигуру, расшифровывает и возвращает рисинок Unicode
func drawPiece(piece: Piece) -> String{
    var result = String()
    
    switch piece {
    case .King( _, let color, _,  _):
        result = (color == .White) ? "\u{265A}" : "\u{2654}"
    case .Queen( _, let color, _, _):
        result = (color == .White) ?  "\u{265B}" : "\u{2655}"
    case .Bishop( _, let color, _, _):
        result = (color == .White) ? "\u{265D}" : "\u{2657}"
    case .Knight( _, let color, _, _):
        result = (color == .White) ?  "\u{265E}" : "\u{2658}"
    case .Castle( _, let color, _, _):
        result = (color == .White) ? "\u{265C}" : "\u{2656}"
    case .Pawn( _, let color, _, _):
        result = (color == .White) ? "\u{265F}" : "\u{2659}"
    }
    return result
}


func chekPieceOnTheBoard(WithX _x: Int, AndY _y:Int, InThe board: [Piece]) -> String? {
    var result: String?
    
    for obj in board {
        var positionX: Int
        var positionY: Int
        
        switch obj {
        case .King(_, _, let posX, let posY):
            positionX = posX.rawValue
            positionY = posY
            
        case .Queen( _, _, let posX, let posY):
            positionX = posX.rawValue
            positionY = posY
            
        case .Bishop( _, _, let posX, let posY):
            positionX = posX.rawValue
            positionY = posY

        case .Knight( _, _, let posX, let posY):
            positionX = posX.rawValue
            positionY = posY

        case .Castle( _, _, let posX, let posY):
            positionX = posX.rawValue
            positionY = posY

        case .Pawn( _, _, let posX, let posY):
            positionX = posX.rawValue
            positionY = posY
        }
        
        if (positionX == _x && positionY == _y) {
            result = drawPiece(piece: obj)
        }
    }
    return result
}

showChessboard(board: chessboard)

print("---Task 4---")

/*
 4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
 5. Следите чтобы ваш код был красивым!
 */
func MovePiece( piece: inout Piece, toPositions: ( x: Piece.PositionX , y: Int )) -> Bool{
    var result: Bool!
    
    if (toPositions.y < 1 || toPositions.y > 9) {
        result = false
    } else {
        
        switch piece {
        case .King(_, let _color, _ , _ ):
            piece = Piece.King(name: .King, color: _color, positionX: toPositions.x , positionY: toPositions.y)
            result = true
        case .Queen(_, let _color, _ , _ ):
            piece = Piece.Queen(name: .King, color: _color, positionX: toPositions.x , positionY: toPositions.y)
            result = true
        case .Bishop(_, let _color, _ , _ ):
            piece = Piece.Bishop(name: .King, color: _color, positionX: toPositions.x , positionY: toPositions.y)
            result = true
        case .Knight(_, let _color, _ , _ ):
            piece = Piece.Knight(name: .King, color: _color, positionX: toPositions.x , positionY: toPositions.y)
            result = true
        case .Castle(_, let _color, _ , _ ):
            piece = Piece.Castle(name: .King, color: _color, positionX: toPositions.x , positionY: toPositions.y)
            result = true
        case .Pawn(_, let _color, _ , _ ):
            piece = Piece.Pawn(name: .King, color: _color, positionX: toPositions.x , positionY: toPositions.y)
            result = true
        default: break
        }
    }
    return result
}


MovePiece(piece: &chessboard[0], toPositions: (x: .B, y:5))
showChessboard(board: chessboard)

