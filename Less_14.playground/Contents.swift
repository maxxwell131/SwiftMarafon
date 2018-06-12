import Foundation

//1. Самостоятельно повторить проделанное в уроке

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
        
        init(firstName: String, lastName: String) {
            
        }
    }
    
    var student = Student()

    
}
//2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)

//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)

//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
