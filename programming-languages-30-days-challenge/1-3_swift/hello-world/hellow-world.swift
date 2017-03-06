print("Hello, World!")


let someVar: Float = 4.0
print(someVar)


let label = "The width is "
let width = 94
let widthLabel = label + String(94)
print(widthLabel)


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary)
print(fruitSummary)


var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jane"] = "Public Relations"
print(shoppingList)
print(occupations)


let emptyArray = [String]()
let emptyDict = [String:Float]()


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


var optionalValue: String? = "Hello"
print(optionalValue == nil)


var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)


let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind: String = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
print("Largest number was of kind '\(largestKind)' and equals to \(largest)")


var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


var total = 0
for i in 0..<4 {
    total += i
}
print(total)


/*
 * Functions
 */


func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
print(greet(person: "Bob", day: "Tuesday"))


func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
print(greet2("Bob", on: "Tuesday"))


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let stats = calculateStatistics(scores: [5, 3, 100, 3, 9])
print (stats.sum)
print (stats.2)
print(stats)



func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
print(sumOf())
print(sumOf(numbers: 42, 597, 12))


func avgOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum / numbers.count
}

print(avgOf(numbers: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))


func returnFifteen() -> Int {
    var y = 10
    func add() -> Int {
        y += 5
        return y
    }
    return add()
}
print(returnFifteen())


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }

    return addOne
}
let increment = makeIncrementer()
print(increment(19))


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
let numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))


let numbers2 = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(numbers2)


let numbers3 = numbers.map({
    (number: Int) -> Int in
    if number % 2 == 0 {
        return 0
    }
    return number
})
print(numbers3)


let numbers4 = numbers.map({n in 5 * n})
print(numbers4)


let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)


/*
 * Objects and Classes
 */


class Shape {
    var numberOfSides = 0
    let color = "red"

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }

    func setNumberOfSides(sides: Int) {
        numberOfSides = sides
    }
}
let shape = Shape()
shape.numberOfSides = 7
shape.setNumberOfSides(sides: 10)
print(shape.simpleDescription())


class NamedShape {
    var numberOfSides = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
let shape2 = NamedShape(name: "Cube")
shape2.numberOfSides = 10
print(shape2.simpleDescription())


class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let sq = Square(sideLength: 5.2, name: "square")
print(sq.area())
print(sq.simpleDescription())


class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}
let tri = EquilateralTriangle(sideLength: 3.1, name: "a trianlge")
print(tri.perimeter)
tri.perimeter = 9.9
print(tri.perimeter)
print(tri.sideLength)
print(tri.simpleDescription())


class TriangleSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }

    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }

    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
let triAndSq = TriangleSquare(size: 10, name: "triangle and square")
print(triAndSq.square.sideLength)
print(triAndSq.triangle.sideLength)
triAndSq.square = Square(sideLength: 50, name: "larger square")
print(triAndSq.triangle.sideLength)


/**
 * Enumerations and Structures
 */


enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func desc() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
print(ace.rawValue)
print(ace.desc())


if let convertedRank = Rank(rawValue: 3) {
    print(convertedRank.desc())
}


enum Suit {
    case spades, hearts, diamonds, clubs
    func desc() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}


enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:00 pm")
let failure = ServerResponse.failure("Out of cheese.")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}


struct Card {
    var rank: Rank
    var suit: Suit
    func desc() -> String {
        return "The \(rank.desc()) of \(suit.desc())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
print(threeOfSpades.desc())


/**
 * Protocols and Extensions
 */


protocol ExampleProtocol {
    var desc: String { get }
    mutating func adjust()
}


class SimpleClass: ExampleProtocol {
    var desc: String = "A very simple class."
    var anotherProperty: Int = 12345
    func adjust() {
        desc += "  Now 100% adjusted."
    }
}
var sci = SimpleClass()
sci.adjust()
print(sci.desc)


struct SimpleStruct: ExampleProtocol {
    var desc: String = "A simple struct."
    mutating func adjust() {
        desc += " (adjusted)"
    }
}
var ssi = SimpleStruct()
ssi.adjust()
print(ssi.desc)


enum SimpleEnum: ExampleProtocol {
    var desc: String {
        get {
            return "123"
        }
        set {}
    }
    case one, two, three
    mutating func adjust() {
        desc += ". adjusted"
    }
}

print(SimpleEnum.one.desc)


extension Int: ExampleProtocol {
    var desc: String {
        return "The number is \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.desc)


/**
 * Errors
 */


enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}


func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}


do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.noToner {
    print("No toner")
} catch {
    print(error)
}


let printerSuccess = try? send(job: 4242, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 4343, toPrinter: "Never Has Toner")


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    return fridgeContent.contains(food)
}
print(fridgeContains("banana"))
print(fridgeIsOpen)


/**
 * Generics
 */


func makeArray<T>(repeating item: T, numberOfTimes: Int) -> [T] {
    var res = [T]()
    for _ in 0..<numberOfTimes {
        res.append(item)
    }
    return res
}
print(makeArray(repeating: "knock", numberOfTimes: 4))


enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInt: OptionalValue<Int> = .none
possibleInt = .some(100)
print(possibleInt)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
print(anyCommonElements([1, 2, 3], [3]))
