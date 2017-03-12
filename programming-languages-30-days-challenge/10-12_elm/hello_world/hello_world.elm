"hellow"
"hello" ++ "world"

2 + 3 * 4
(2 + 3) * 4

9 / 2
9 // 2

isNegative n =
    n < 0

isNegative 4
isNegative -7
isNegative (-3 * -4)

if True then "hello" else "world"
if False then "hello" else "world"

over9000 powerLevel =
    if powerLevel > 9000 then
        "It's over 9000!!!"
    else
        "meh"

over9000 42
over9000 90001

names = ["Alice", "Bob", "Chuck"]
List.isEmpty names
List.length names
List.reverse names

numbers = [1,4,3,2]
List.sort numbers
double n = n * 2
List.map double numbers

goodName name =
    if String.length name <= 20 then
        (True, "name accepted")
    else
        (False, "name was too long; please limit it to 20 characters")

goodName "Tom"

point = { x = 3, y = 4 }
point.x

bill = { name = "Gates", age = 57 }
bill.name
.name bill
List.map .name [bill, bill, bill, bill]

under70 {age} =
    age < 70

under70 bill
under70 { species = "Triceratops", age = 68000000 }

{ bill | name = "Nye" }
{ bill | age = 22 }
