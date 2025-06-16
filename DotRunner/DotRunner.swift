// FizzBuzz.swift


@main
struct FizzBuzz {
    static func main() {
        print("\n >>>> Calling fizzBuzzSimple: \n")
        for count in 1...100 {
            print ("\(fizzBuzzSimple(count))")
        }

        print( "\n\n >>>> Calling fizzBuzzSwitch: \n")
        for count in 1...100 {
            print ("\(fizzBuzzSwitch(count))")
        }
        
        print("\n >>>> Finished FizzBuzz.swift via SwiftPM \n");

    }
}

/// fizzBuzzSimple() - No special case for 15. Uses colors.
///  - Parameter number: the specific number to analyze
///  - Returns: a string to print, e.g. the number itself, fizz, buzz, or fizzbuzz
///
func fizzBuzzSimple(_ number: Int) -> String {
    var answer = String()
    if (number % 3 == 0) { answer = "Fizz" }
    if (number % 5 == 0) { answer.append("Buzz") }
    if answer.isEmpty { answer = "(\(number.description))" }
    return answer
}


/// fizzBuzzSwitch() - Use a switch statement, with 15 as a special case
///  - Parameter number: the specific number to analyze
///  - Returns: whether the number should be number, fizz, buzz, or both
///
func fizzBuzzSwitch(_ number: Int) -> String {
    switch number {
        case _ where number % 15 == 0:
            return "FizzBuzz (\(number.description))"
        case _ where number % 3 == 0:
            return "Fizz (\(number.description))"
        case _ where number % 5 == 0:
            return "Buzz (\(number.description))"
        default:
            return number.description
    }
}



// end of file.
