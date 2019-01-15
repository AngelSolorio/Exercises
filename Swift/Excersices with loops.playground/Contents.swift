import UIKit

// Chalkboard: Print “I will not skip the fundamentals!” N times.
func printMessage(Ntimes n: Int) {
    if n <= 0 { return }

    for _ in 1...n {
        print("I will not skip the fundamentals!")
    }
}


// Squares: Print the first N square numbers. A square number, also called perfect square, is an integer that is obtained by squaring some other integer; in other words, it is the product of some integer with itself (ex. 1, 4 = 2 * 2, 9 = 3* 3 …).
func printSquareNumbers(until n: Int) {
    if n <= 0 { return }

    var counter = 1
    for _ in 1...n {
        print(counter * counter)
        counter += 1
    }
}


// Powers of 2: Print the powers of 2 that are less than or equal to N.
func printPowersOf2(until n: Int) {
    if n <= 1 { return }

    var power = 2
    while power <= n {
        print(power)
        power = power * 2
    }
}
