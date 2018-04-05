//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
struct StudentStruct {
    var name: String
    var surname: String
    var birthday: String
    var averangeScore: UInt
    
    init(_name: String, _surname: String, _birthday: String, _averangeScore: UInt) {
        self.name = _name
        self.surname = _surname
        self.averangeScore = _averangeScore
        self.birthday = _birthday
    }
}

var structStudent1 = StudentStruct(_name: "Vasya", _surname: "Petrov", _birthday: "12-10-2000", _averangeScore: 4)
var structStudent2 = StudentStruct(_name: "Petya", _surname: "Fedorov", _birthday: "13-10-2000", _averangeScore: 17)
var structStudent3 = StudentStruct(_name: "Afonya", _surname: "Stepanov", _birthday: "14-10-2000", _averangeScore: 8)
var structStudent4 = StudentStruct(_name: "Stepan", _surname: "Ivanov", _birthday: "15-10-2000", _averangeScore: 6)
var structStudent5 = StudentStruct(_name: "Evstegney", _surname: "Hrenov", _birthday: "16-10-2000", _averangeScore: 10)
var structStudent6 = StudentStruct(_name: "Leopold", _surname: "Hrenov", _birthday: "16-10-2000", _averangeScore: 11)
var structStudent7 = StudentStruct(_name: "Anyfriy", _surname: "Hrenov", _birthday: "16-10-2000", _averangeScore: 7)



var classBookStruct:[StudentStruct] = [ structStudent1, structStudent2, structStudent3, structStudent4,
                                        structStudent5, structStudent6, structStudent7]
classBookStruct

//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
func ClassBookDescripton(classBookStruct: [StudentStruct]) -> String {
    var result:String = ""
    var counter = 1
    
    for obj in classBookStruct {
        result += "\(counter). name: \(obj.name), surname: \(obj.surname), birthday: \(obj.birthday), averangeScore: \(obj.averangeScore)\r"
        counter += 1
    }
    return result
}

print(ClassBookDescripton(classBookStruct: classBookStruct))

//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
print("--Task 3--")
let classBookStructSorted3 = classBookStruct.sorted(by: { $0.averangeScore < $1.averangeScore})
print(ClassBookDescripton(classBookStruct: classBookStructSorted3))

//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
print("--Task 4--")
var classBookStructSorted4 = classBookStruct.sorted(by: {
    if $0.surname != $1.surname {
        return $0.surname < $1.surname
    } else {
        return $0.name < $1.name
    }
})
print(ClassBookDescripton(classBookStruct: classBookStructSorted4))

//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
print("--Task 4--")
var copyOf = classBookStructSorted4
classBookStructSorted4.removeLast()
classBookStructSorted4.removeFirst()
classBookStructSorted4.removeLast()
classBookStructSorted4.removeFirst()
print(ClassBookDescripton(classBookStruct: classBookStructSorted4))
print("--Task 4--")
print(ClassBookDescripton(classBookStruct: copyOf))

//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?

//7. Выполните задание шахмат из урока по энумам используя структуры либо классы
//71. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
//72. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
//73. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
