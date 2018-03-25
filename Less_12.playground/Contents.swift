/*
 1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 
 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
 */
enum Piece {
    case King(name: Name, color: Color,positionX: Position, positionY: Position)
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
        case x(String)
        case y(Int)
    }
}

let whiteKing: Piece = .King(name: .King, color: .White,positionX: .x("A"), positionY: .y(1))
let blackKing: Piece = .King(name: .King, color: .Black, positionX: .x("A"), positionY: .y(2))
let blackCastle: Piece = .Castle(name: .Castle, color: .Black, positionX: .x("B"), positionY: .y(1))

let chessboard: [Piece] = [ whiteKing, blackKing, blackCastle]

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
 
 print(" \u{2B1C} \u{2B1B}")
 print(" \u{265A} \u{2654} ")
 print(" \u{265B} \u{2655} ")
 print(" \u{265C} \u{2656} ")
 print(" \u{265D} \u{2657} ")
 print(" \u{265E} \u{2658} ")
 print(" \u{265F} \u{2659} ")
*/


//MARK: функция печатает на экран доску и выводит на нее фигуры
func showChessboard (board: [Piece]) {
    for obj in board {
        print(drawPiece(piece: obj))
    }
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

showChessboard(board: chessboard)


func colorOfCell() {
    
}

/*
 4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
 5. Следите чтобы ваш код был красивым!
 */

