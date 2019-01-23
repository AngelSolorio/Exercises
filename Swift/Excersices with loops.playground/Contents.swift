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

    for counter in 1...n {
        print(counter * counter)
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


// Triangle: Given an integer N draw a right triangle of asterisks. The right triangle should have N lines, the i-th line should have iasterisks on it.
func printRightTriangle(ofNLines n: Int) {
    var counter = 1
    var lineToPrint = "*"

    while counter <= n {
        print(lineToPrint)
        lineToPrint.append("*")
        counter += 1
    }
}


// Triangle: Given an integer N draw a isoceles triangle of asterisks. The isoceles triangle should have N lines, the i-th line should have iasterisks on it.
func printIsoscelesTriangle(ofNLines n: Int) {
    var line = 1

    while line <= n {
        print(String(repeating: " ", count: n - line) + String(repeating: "* ", count: line))
        line += 1
    }
}


// Inverted Triangle: Given an integer N draw an inverted isoceles triangle of asterisks. The isoceles triangle should have N lines, the i-th line should have iasterisks on it.
func printInvertedTriangle(ofNLines n: Int) {
    var line = n

    while line > 0 {
        print(String(repeating: " ", count: n - line) + String(repeating: "* ", count: line))
        line -= 1
    }
}


// Pyramid: Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should beN-i spaces followed by i*2-1 asterisks.
func printPyramid(ofNLines n: Int) {
    var line = 1, starts = 1

    while line <= n {
        print(String(repeating: " ", count: n - line) + String(repeating: "*", count: starts))
        line += 1
        starts += 2
    }
}


// Rhombus: Given an integer N draw a rhombus of asterisks.
func printRhombus(n: Int) {
    var spaces = n - 1, starts = 1, iteration = 1

    while iteration <= (n * 2 - 1) {
        print(String(repeating: " ", count: spaces) + String(repeating: "*", count: starts))
        spaces = (iteration < n) ? spaces - 1 : spaces + 1
        starts = (iteration < n) ? starts + 2 : starts - 2
        iteration += 1
    }
}


// Aztec Pyramid: Given an integer N draw a Aztec pyramid of asterisks.
func printAztecPyramid(ofNLevels n: Int) {
    var spaces = 2 * (n - 1), starts = 2, level = 1

    while level <= n {
        print(String(repeating: " ", count: spaces) + String(repeating: "*", count: starts))
        print(String(repeating: " ", count: spaces) + String(repeating: "*", count: starts))
        starts += 4
        spaces -= 2
        level += 1
    }
}


// Chess Board: Given an integer N draw a chess board of size N x N. Each line of the chess board should have spaces and number signs(#) alternating. A space represents a white cell and the number sign a black one. The chess board should be bordered using +, - and | like in the examples below.
/*
 var N = 3
 +---+
 |# #|
 | # |
 |# #|
 +---+
 */
func printChessBoard(ofNCells n: Int) {
    if n <= 0 { return }

    let border = "+\(String(repeating: "-", count: n))+"
    print(border)
    for i in 1...n {
        var row = "|", cell: Character
        for j in 1...n {
            cell = (i % 2 == j % 2) ? "#" : " "
            row.append(cell)
        }
        row.append("|")
        print(row)
    }
    print(border)
}


// Fibonacci: Write a program that prints the first N Fibonacci numbers. The first two Fibonacci numbers are 1, the rest of the elements are the sum of the previous two. The first seven numbers are 1, 1, 2, 3, 5, 8 and 13.
func printFibonacciSerie(size n: Int) {
    var fibonacci = (n < 1) ? [] : (n == 1) ? [1] : [1, 1]
    var i = 0

    while i < (n - 2) {
        fibonacci.append(fibonacci[i] + fibonacci[i + 1])
        i += 1
    }
    print(fibonacci)
}


// Leap Years: Write a program that prints the next N leap years starting with leapYear. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days. The extra day is added in February, which has 29 daysinstead of the normal 28 days. Leap years occur every 4 years, 2012 was a leap year and 2016 will be a leap year. Except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not divisible by 400. For example 1900 was not a leap year, but 2000 was.
func printLeapYears(total: Int, from: Int) {
    var leapYears = Array<Int>()
    var year = from

    while year > 0 && leapYears.count < total {
        if ((year % 4 == 0) && (year % 100 != 0)) || ((year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)) {
            leapYears.append(year)
        }
        year += 1
    }
    print(leapYears)
}


// Reverse: You are given a number. Print the number with the digits in reversed order.
func printReverse(number: Int) {
    let stringNumber = number < 0 ? String(number * -1) : String(number)
    var reversedDigits = number < 0 ? "-" : ""

    for character in stringNumber.reversed() {
        reversedDigits.append(character)
    }
    print(reversedDigits)
}


// Odd Numbers: Given the l and k integers, print the odd numbers between those two numbers, l and k are inclusive.
func oddNumbers(l: Int, r: Int) -> [Int] {
    if l > r { return [] }
    return Array(l...r).filter({ ($0 % 2) != 0 })
}

