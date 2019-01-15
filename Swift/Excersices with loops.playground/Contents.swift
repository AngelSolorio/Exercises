/**
   This file contains a series of methods with algorithms to practice the loops in Switf
   Created by Angel Solorio on 14/01/2019.
**/

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


// Alternative Counting: Write all the numbers from 1 to N in alternative order, one number from the left side (starting with one) and one number from the right side (starting from N down to 1).
func printNumbersAlternatively(until n: Int) {
    if n <= 0 { return }

    var i = 1
    var j = n
    repeat {
        print(i)
        if i != j { print(j) }
        i += 1
        j -= 1
    } while i <= j
}


// Square: Given an integer N draw a square of N x N asterisks.
func printASquareNumberOfAstericks(until n: Int) {
    if n <= 0 { return }

    for _ in 1...n {
        var lineToPrint = ""
        for _ in 1...n {
            lineToPrint.append("*")
        }
        print(lineToPrint)
    }
}


// Rectangle: Given two integers N and M draw a rectangle of N x M asterisks.
func printRectangleOfAstericks(n: Int, m: Int) {
    if n <= 0 || m <= 0 { return }

    for _ in 1...n {
        var lineToPrint = ""
        for _ in 1...m {
            lineToPrint.append("*")
        }
        print(lineToPrint)
    }
}
