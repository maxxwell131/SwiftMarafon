import Foundation

//1. Самостоятельно повторить проделанное в уроке
//2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)

struct DateOfBirth {
    var day: Int
    var mounth: Int
    var year: Int
    
    var age: Int {
        get {
            let currentDate = Date()
            let calendar = Calendar.current
            let currentYear = calendar.component(.year, from: currentDate)
            
            return currentYear - year
        }
    }
    
    var studentWasStudying: Int {
        get {
            var result = 0
            
            if age > 6 {
                result = age - 6
            }
            return result
        }
    }
}

struct Student {
    var firstName: String {
        willSet {
            print("Will set " + newValue + " insted of " + firstName)
        }
        
        didSet {
            print("did set " + firstName + " insted of " + oldValue)
            firstName = firstName.capitalized
        }
    }
    
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        
        set {
            print("fullName wonts to be set to " + newValue)
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    var howOldAreYou: DateOfBirth
}

let dateOfBirth = DateOfBirth(day: 20, mounth: 3, year: 1997 )
var student = Student(firstName: "Petro", lastName: "Rebro", howOldAreYou: dateOfBirth)

print(student.firstName)
print(student.lastName)
print(student.fullName)
print(student.howOldAreYou)
print(student.howOldAreYou.age)
print(student.howOldAreYou.studentWasStudying)

student.firstName = "Semen"



//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
struct MyPoint {
    var x: Int = 0
    var y: Int = 0
    
}

struct MyLine {
    var A: MyPoint
    var B: MyPoint
    
    var lenghtLine: Double {
        get {
            let result = pow(Double(B.x - A.x), 2) + pow(Double(B.y - B.x), 2)
            return sqrt(result)
        }
    }
    
    var middleOfLine: MyPoint {
        get {
            var result = MyPoint(x: 0, y: 0)
            result.x = (A.x + B.x) / 2
            result.y = (A.y + B.y) / 2
            
            return result
        }
        set {
            
        }
    }
}

//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
