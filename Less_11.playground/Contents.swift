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

 /*
 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы
 */
print("------Task_4-----------")

 
 /*
 5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)
 */
print("------Task_5-----------")
