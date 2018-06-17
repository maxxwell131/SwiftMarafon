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

/*
 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */
