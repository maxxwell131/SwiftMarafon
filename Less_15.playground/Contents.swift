//: Playground - noun: a place where people can play

import Foundation

/*
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)
 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
 */
enum FileType: String {
    case Hidden = "HIDDEN"
    case None = "NONE"
}

struct FileStruct {
    var path: String
    var fileName: String {
        get {
            let tmp = path.components(separatedBy: "/")
            return tmp.last! as String
        }
        
    }
    
    static var MaxLength: Int = 1024
    
    var folderName: String {
        get {
            var tmp = path.components(separatedBy: "/")
            tmp.removeLast()
            return tmp.joined(separator: "/")
        }
    }
    
    var fileType: FileType
    lazy var content = "This is content file........."
    
}

let path1 = "/Volumes/HDD_500Gb/Project/Swift/SwiftMarafon/Less_15.playground"
var obj = FileStruct(path: path1, fileType: .Hidden, content: nil )

obj.content
obj.fileName
obj.fileType.rawValue
obj.folderName
obj.path

/*
 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
 */

enum MyColor: Int {
    case Black = 0x000
    case White = 0xFFF
    case Blue = 0xFF
    case Red = 0xF00
    case Yellow = 0xFF0
    
    static var countColorsOfGammy = 5
    static var firstColor = MyColor.Black
    static var lastColor = MyColor.Yellow
}

MyColor.countColorsOfGammy
MyColor.firstColor
MyColor.lastColor


/*
 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */
class Human {
    
    var firstName: String {
        didSet {
            if self.firstName.count > Human.MaxLengthName || self.firstName.count < Human.MinLengthName {
                firstName = oldValue
            }
        }
    }
    var secondName: String {
        didSet {
            if secondName.count > Human.MaxLengthName || secondName.count < Human.MinLengthName {
                secondName = oldValue
            }
        }
    }
    var age: Int {
        didSet {
            if age > Human.MaxAge || age < Human.MinAge {
                age = oldValue
            }
        }
    }
    var height : Int {
        didSet {
            if height > Human.MaxHeight || height < Human.MinHeight {
                height = oldValue
            }
        }
    }
    var weight: Int {
        didSet {
            if weight > Human.MaxWeight || weight < Human.MinWeight {
                weight = oldValue
            }
        }
    }
    
    init(firstName: String, secondName: String, age: Int, height: Int, weight: Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.age = age
        self.weight = weight
        self.height = height
        Human.HumanObjCounter = Human.HumanObjCounter + 1
    }
    
    static var HumanObjCounter = 0
    
    class  var MinAge: Int {
        return 20
    }
    
    class var MaxAge: Int {
        return 99
    }
    
    class var MinLengthName: Int {
        return 3
    }
    
    class var MaxLengthName: Int {
        return 20
    }
    
    class var MinWeight: Int {
        return 50
    }
    
    class var MaxWeight: Int {
        return 120
    }
    
    class var MinHeight: Int {
        return 150
    }
    
    class var MaxHeight: Int {
        return 195
    }
}

let human1 = Human(firstName: "Stepan", secondName: "Petrovsky", age: 25, height: 75, weight: 178)
Human.HumanObjCounter
