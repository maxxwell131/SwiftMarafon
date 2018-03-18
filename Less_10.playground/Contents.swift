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
func reverseArray_4(array: inout [Int]) {
    var resultArray = [Int]()
    for item in array {
        resultArray.insert(item, at: 0)
        array = resultArray
    }
}

var inputArray_4 = [1,2,3,4,5,6,7,8,9,0,11,12,13,14]
reverseArray_4(array: &inputArray_4)
print(inputArray_4)
/*
5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
 */
func editToString(inputString: String) {
    let vovelsArray = ["а","о","и","е","ё","э","ы","у","ю","я"] //Гласные буквы
    let consonantsArray = ["б","в","г","д","ж","з","й","к","л","м","н","п","р","с","т","ф","х","ц","ч","ш","щ"] //Согласные буквы
    let numbersDictonary = ["0":"ноль","1":"один","2":"два","3":"три","4":"четыре","5":"пять","6":"шесть","7":"семь","8":"восемь","9":"девять"] //цифры
    let signsArray = [".","?","!","-",","] //знаки препинания
    var myCharsterArray = Array(inputString)
    
    var coubters = (vovels: 0, consonants: 0, numbs: 0, signs: 0)
    
    
    for item in 0..<myCharsterArray.count {
        
//        let tmp = numbersDictonary.index(forKey: String(myCharsterArray[item]))
//        print(tmp)
        
        if let _ = consonantsArray.index(of: (String(myCharsterArray[item])).lowercased()) { //Согласные маленькими буквы
            //coubters.consonants += 1
            myCharsterArray[item] = Character(String(myCharsterArray[item]).lowercased())
        } else if let _ = vovelsArray.index(of: (String(myCharsterArray[item])).lowercased()) { //Гласные большими буквам
            //coubters.vovels += 1
            myCharsterArray[item] = Character(String(myCharsterArray[item]).uppercased())
        } else if let indexDict = (numbersDictonary.index(forKey: String(myCharsterArray[item]))) { //цифрыцифры меняет на соответствующие слова index(forke: )
            coubters.numbs += 1
            print("key:\(numbersDictonary[indexDict].key) value:\(numbersDictonary[indexDict].value)")
            //myCharsterArray[item] = Character(String(numbersDictonary[String(myCharsterArray[item])]))
            // let tmp = numbersDictonary.index(forKey: String(myCharsterArray[item]))
        } else if let _ = signsArray.index(of: (String(myCharsterArray[item])).lowercased()) { //убрать знак препинания
            //coubters.signs += 1
            myCharsterArray[item] = Character(String(" "))
        }
    }
    print("Согласные буквы -\(coubters.consonants)\rГласные буквы - \(coubters.vovels)\rКол-во символов - \(myString.count)\rцифр - \(coubters.numbs)\rЗнаки припенания - \(coubters.signs) ")
    
    print(String(myCharsterArray))

}


let myString = "1 Представители Google также сообщили, что сегодня считают одной из основных своих задач удаление вредоносной или назойливой рекламы. В 2017 году компания посчитала некорректными, обманывающими или вредоносными 3,2 млрд рекламных объявлений в Сети. Это почти вдвое больше, чем 1,7 млрд объявлений, которые Google счел такими в 2016 году. Такими объявлениями Google, в частности, считает ссылки, которые ведут на сайты с вирусами (таких компания насчитала 79 млн штук)."

editToString(inputString: myString)
