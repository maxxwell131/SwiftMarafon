/*
 1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
 */

func printPhone() -> String {
    return "\u{260E}"
}

func printHeart() -> String {
    return "\u{2764}"
}

func printEuro() -> String {
    return "\u{20AC}"
}

print(printPhone() + printHeart() + printEuro())

/*
 2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
 */
func ColorOfCell(symbolCell: String) -> String? {
    let colCellArray = ["a","b","c","d","e","f","g","h"]
    let row = Int(String(symbolCell.last!))
    var col: String = String(symbolCell.lowercased().first!)
    var cellColor:Bool = false
    var colStrintToNumber:Int? = 1 + colCellArray.index(of: String(col))!
    
    if (row! + colStrintToNumber!) % 2 == 0  {
        cellColor = true
    } else {
        cellColor = false
    }
    var result = cellColor ? "белая": "черная"
    return result
}

ColorOfCell(symbolCell: "a5")
ColorOfCell(symbolCell: "a6")

/*
 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
 */
func reverseArray(array: [Int]) -> [Int] {
    var resultArray = [Int]()
    for item in array {
        resultArray.insert(item, at: 0)
    }
    return resultArray
}

let inputArray = [1,2,3,4,5,6,7,8,9,0,11,12,13,14]
var reverseInputArray = reverseArray(array:inputArray)


/*
 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 */

/*
5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
 */
