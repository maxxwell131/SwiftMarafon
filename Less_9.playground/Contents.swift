/*
 1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.
 */
let myString = "Представители Google также сообщили, что сегодня считают одной из основных своих задач удаление вредоносной или назойливой рекламы. В 2017 году компания посчитала некорректными, обманывающими или вредоносными 3,2 млрд рекламных объявлений в Сети. Это почти вдвое больше, чем 1,7 млрд объявлений, которые Google счел такими в 2016 году. Такими объявлениями Google, в частности, считает ссылки, которые ведут на сайты с вирусами (таких компания насчитала 79 млн штук).".lowercased()

let vovelsArray = ["а","о","и","е","ё","э","ы","у","ю","я"] //Гласные буквы
let consonantsArray = ["б","в","г","д","ж","з","й","к","л","м","н","п","р","с","т","ф","х","ц","ч","ш","щ"] //Согласные буквы
let numbersArray = ["0","1","2","3","4","5","6","7","8","9"]

let myCharsterArray = Array(myString)

var coubters = (vovels: 0, consonants: 0, numbs: 0)

for item in 0..<myCharsterArray.count {
    if (consonantsArray.index(of: String(myCharsterArray[item]))) != nil {
        coubters.consonants += 1
    } else if (vovelsArray.index(of: String(myCharsterArray[item]))) != nil {
        coubters.vovels += 1
    } else if (numbersArray.index(of: String(myCharsterArray[item]))) != nil {
        coubters.numbs += 1
    }
}
print("Согласные буквы -\(coubters.consonants)\rГласные буквы - \(coubters.vovels)\rКол-во символов - \(myString.count)\rцифр - \(coubters.numbs)")

/*
 2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа
 */
let age = 45

switch age {
case 6...17:
    print("школьник")
case 18...23:
    print("студент")
case 24...27:
    print("чайник-искатель")
case 27...33:
    print("молодой,амбициозный")
case 34...40:
    print("проверенный, уверенный чайник")
case 41...50:
    print("идищий к цели")
case 51...61:
    print("готовимся к пенсии")
case 62...66:
    print("вся жизнь впереди")
default:
    print("пенсия")
    break
}


/*
 3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.
 */
var student = (firstName: "Василий", middleName: "Иванович",lastName: "Зенькеръ")

switch student {
case _ where student.firstName.hasPrefix("А") || student.firstName.hasPrefix("О"):
    print("дорогой студент: \(student.firstName)")
case _ where student.middleName.hasPrefix("В") || student.middleName.hasPrefix("Д"):
    print("дорогой студент: \(student.firstName) \(student.middleName)")
case _ where student.lastName.hasPrefix("Е") || student.lastName.hasPrefix("З"):
    print("дорогой студент: \(student.lastName)")
default:
    print("\(student.firstName) \(student.middleName) \(student.lastName)")
}

/*
 4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.
 */

let shot = (x: 2, y: 4)
switch shot {
case (1,2), (2,3):
    print("ранил")
case (2,4):
    print("убил")
default:
    print("Мимо")
}

