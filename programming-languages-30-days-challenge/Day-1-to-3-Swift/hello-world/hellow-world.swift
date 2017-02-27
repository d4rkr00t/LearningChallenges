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


