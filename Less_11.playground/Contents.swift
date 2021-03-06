import Foundation
/*
 1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
 */
print("------Task_1-----------")
func counterTen(foo : () -> ()) {
   
    for _ in 1...10 {
        print("counterTen")
    }
    foo()
}

print(counterTen {
    print("foo")
})
 /*
 2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
 */
print("------Task_2-----------")
var myArray = [Int]()

for i in 0...50 {
    myArray.append(Int(arc4random_uniform(UInt32(i+100)) + 1))
}
print(myArray)

let myArraySorted = myArray.sorted(by: {(number1: Int , number2: Int) -> Bool in return number1 < number2 })
print(myArraySorted)

let myArraySorted2 = myArray.sorted(by: {(number1: Int , number2: Int) -> Bool in return number1 > number2 })
print(myArraySorted2)
/*
 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.
    используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.
 */
print("------Task_3-----------")
func task3(inputArray: [Int], foo: (Int, Int?) -> Bool) -> Int {
    var  optionVar: Int?
    
    for obj in inputArray {
        if foo(obj, optionVar) {
            optionVar = obj
        }
    }
    return optionVar!
}
print(task3(inputArray: myArray, foo: {
    (number1: Int, number2: Int?) -> Bool in
    if let tmp = number2 {
        return number1 > tmp
    } else if number2 == nil {
        return true
    }
        return false
}))

print(task3(inputArray: myArray, foo: {
    (number1: Int, number2: Int?) -> Bool in
    if let tmp = number2 {
        return number1 < tmp
    } else if number2 == nil {
        return true
    }
    return false
}))

let a = task3(inputArray: myArraySorted) { $1 == nil || $0 > $1! }
print(a)

 /*
 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы
 */
print("------Task_4-----------")
var myString = "Всего лет двадцать назад контроль над ребёнком был основан исключительно на доверительных отношениях между ним и родителями. Но указания вернуться с улицы домой до определённого времени или не ходить играть в соседний двор далеко не всегда воспринимались нами со всей ответственностью. Ситуацию не исправляло и заслуженное наказание – дети есть дети. Современный мир стал куда разнообразнее, но опасностей для ребёнка не стало меньше. И в первую очередь от этого страдает нервная система родителей, которые начинают переживать за своё чадо ровно с той минуты, как оно выходит за порог дома. Чтобы 4131 снизить всем известные риски, а +- заодно и немного успокоить родителей,%@ в крупных (да и не только) городах давно уже введены всевозможные общественные системы контроля над детьми: 6583 камеры наблюдения 56 в образовательных учреждениях, электронные пропускные системы, электронные дневники и журналы, SMS-оповещения о посещении и многое другое.13 Волей-неволей ребёнок учится?. жить под постоянным контролем. Во взрослой жизни ведь нас также теперь окружают$%^^&& камеры наблюдения, контроль за денежными операциями, наблюдение за социальными сетями, телефонными разговорами и прочие не сильно приятные (хотя иногда и полезные) условно! бесплатные услуги, которые никто из нас не заказывал."

var myArrayChar = Array(myString)

func priority(myString: Character) -> Int {
    var result: Int
    
    switch myString {
    case "а","о","и","е","ё","э","ы","у","ю","я":
        result = 1
    case "б","в","г","д","ж","з","й","к","л","м","н","п","р","с","т","ф","х","ц","ч","ш","щ" :
        result = 2
    case "0"..."9":
        result = 3
    default:
        result = 4
    }
    return result
}

let task4Array = myArrayChar.sorted(by: {
    switch (priority(myString: $0), priority(myString: $1)) {
    case let(x, y) where x < y: return true
    case let(x, y) where x > y: return false
    default: return $0 <= $1
    }
})
 
print(String(task4Array))

 /*
 5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)
 */
print("------Task_5-----------")
let task5String = "Cable News Network (CNN) was launched in 1980, 34 years ago as an American basic cable & Satellite television. The 24 hour news channel was established by the Ted Turner which decorated the channel as the first all-news channel of States then. The channel was also the only of its kind to televise the news for 24 hours, broadcasting cnn live stream with HD quality."

func task5(arg1: String, foo: (String, String?) -> Bool) -> String {
    var result: String?
    for obj in arg1 {
        if foo(String(obj),result) {
            result = String(obj)
        }
    }
    return result!
}
// Max
print(task5(arg1: task5String, foo: { $1 == nil || $0 > $1! }))

// Mim
print(task5(arg1: task5String, foo: { $1 == nil || $0 < $1! }))




