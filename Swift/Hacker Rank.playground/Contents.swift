import Foundation

// Title: Arrays DS
// Instructions: Given an array, A, of N integers, print each element in reverse order as a single line of space-separated integers.
// Url: https://www.hackerrank.com/challenges/arrays-ds/
func reverseArray(a: [Int]) -> [Int] {
    return a.reversed()
}


// Title: Compare the Triplets
// Instructions: Given two arryas of three integers, compare every element at the same position in both arrays, the greater one sums a point if both are equal not points, and return an array of two integers, each one will represent the sum of total points.
// Url: https://www.hackerrank.com/challenges/compare-the-triplets/
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    let scoreA = a.enumerated().map { (i, value) in value > b[i] ? 1 : 0 }.reduce(0, {$0 + $1})
    let scoreB = b.enumerated().map { (i, value) in value > a[i] ? 1 : 0 }.reduce(0, {$0 + $1})
    return [scoreA, scoreB]
}


// Title: A Very Big Sum
// Instructions: Calculate and print the sum of the elements in an array, keeping in mind that some of those integers may be quite large.
// Url: https://www.hackerrank.com/challenges/a-very-big-sum/
func aVeryBigSum(ar: [Int]) -> Int {
    return ar.reduce(0, {$0 + $1})
}


// Title: Diagonla Difference
// Instructions: Given a square matrix, calculate the absolute difference between the sums of its diagonals. The top-left to bottom-right diagonal minus the one from top-right to bottom-left.
// Url: https://www.hackerrank.com/challenges/diagonal-difference/
func diagonalDifference(arr: [[Int]]) -> Int {
    var i = 0, j = arr.count - 1
    var left = 0, right = 0
    arr.map { (row) in
        left += row[i]
        right += row[j]
        i += 1
        j -= 1
    }
    return abs(left - right)
}


// Title: Plus Minus
// Instructions: Given an array of integers, calculate the fractions of its elements that are positive, negative, and are zeros. Print the decimal value of each fraction on a new line.
// Url: https://www.hackerrank.com/challenges/plus-minus/
func plusMinus(arr: [Int]) -> Void {
    print(String(format: "%0.6f", Float(arr.filter({$0 > 0}).count) / Float(arr.count)))
    print(String(format: "%0.6f", Float(arr.filter({$0 < 0}).count) / Float(arr.count)))
    print(String(format: "%0.6f", Float(arr.filter{$0 == 0}.count) / Float(arr.count)))
}


// Title: Staircase
// Instructions: Write a function that prints a staircase of size n. Observe that its base and height are both equal to n, and the image is drawn using # symbols and spaces. The first line is preceded by n - 1 spaces and a # symbol, while the last line is not preceded by any spaces.
// Url: https://www.hackerrank.com/challenges/staircase/
func staircase(n: Int) {
    for row in 1...n {
        print("\(String(repeating: " ", count: n - row))\(String(repeating: "#", count: row))")
    }
}


// Title: Mini-Max Sum
// Instructions: Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.
// Url: https://www.hackerrank.com/challenges/mini-max-sum/
func miniMaxSum(arr: [Int]) {
    print("\(arr.sorted(by: <).dropLast().reduce(0, {$0 + $1})) \(arr.sorted(by: >).dropLast().reduce(0, {$0 + $1}))")
}


// Title: Birthday Cake Candles
// Instructions: You are in charge of the cake for your niece's birthday and have decided the cake will have one candle for each year of her total age. When she blows out the candles, she’ll only be able to blow out the tallest ones. Your task is to find out how many candles she can successfully blow out.
// Url: https://www.hackerrank.com/challenges/birthday-cake-candles/
func birthdayCakeCandles(ar: [Int]) -> Int {
    let max = ar.max()
    return ar.sorted(by: >).prefix(while: {$0 == max}).count
}


// Title: Time Conversion
// Instructions: Given a time in 12-hour AM/PM format, convert it to military (24-hour) time. Note: Midnight is 12:00:00AM on a 12-hour clock, and 00:00:00 on a 24-hour clock. Noon is 12:00:00PM on a 12-hour clock, and 12:00:00 on a 24-hour clock. A single string s containing a time in 12-hour clock format (i.e.: hh:mm:ssAM or hh:mm:ssPM).
// Url: https://www.hackerrank.com/challenges/time-conversion/
func timeConversion(s: String) -> String {
    let meridian = s.contains("PM") ? "PM" : "AM"
    let timeFormated = s.prefix(upTo: s.firstIndex(of: meridian.first!)!)
    let oldHours = Int(s.prefix(upTo: s.firstIndex(of: ":")!))!
    var newHours: Int = 0
    if meridian == "AM" && oldHours == 12 {
        newHours = 0
    } else if meridian == "PM" && oldHours != 12 {
        newHours = oldHours + 12
    } else {
        newHours = oldHours
    }

    let range = timeFormated.range(of: s.prefix(upTo: s.firstIndex(of: ":")!))!
    return timeFormated.replacingCharacters(in: range, with: String(format: "%02d", newHours))
}


// Title: Grading Students
// Instructions: HackerLand University has the following grading policy:
// -> Every student receives a grade in the inclusive range from 0 to 100.
// -> Any gtrade less than 40 is a failing grade.
// Sam is a professor at the university and likes to round each student's grade according to these rules:
// -> If the difference between the grade and the next multiple of 5 is less than 3, round grade up to the next multiple of 5.
// -> If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.
// For example, gtrade = 84 will be rounded to 85 but grade = 29 will not be rounded because the rounding would result in a number that is less than 40.
// Url: https://www.hackerrank.com/challenges/grading/
func gradingStudents(grades: [Int]) -> [Int] {
    return grades.map { (grade) in
        return grade >= 38 && (grade % 5) >= 3 ? (grade / 5) * 5 + 5 : grade
    }
}


// Title: Apple and Orange
// Instructions: Print in two lines the total number of apples and oranges that fall into Sam's house. To see the detailed instructions and ilustrations about this problem go the below url.
// Url: https://www.hackerrank.com/challenges/apple-and-orange/
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    print(apples.reduce(0) { $0 + (((a + $1) >= s && (a + $1) <= t) ? 1 : 0) })
    print(oranges.reduce(0) { $0 + (((b + $1) >= s && (b + $1) <= t) ? 1 : 0) })
}


// Title: Kangaroo
// Instructions: You are choreographing a circus show with various animals. For one act, you are given two kangaroos on a number line ready to jump in the positive direction (i.e, toward positive infinity).
//  -> The first kangaroo starts at location x1 and moves at a rate of v1 meters per jump.
//  -> The second kangaroo starts at location x2 and moves at a rate of v2 meters per jump.
//  You have to figure out a way to get both kangaroos at the same location at the same time as part of the show. If it is possible, return YES, otherwise return NO.
// Url: https://www.hackerrank.com/challenges/kangaroo/
func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    return (v1 > v2 && ((x2 - x1) % (v1 - v2) == 0)) ? "YES" : "NO"
}


// Title: Between Two Sets
// Instructions: You will be given two arrays of integers and asked to determine all integers that satisfy the following two conditions:
//  -> The elements of the first array are all factors of the integer being considered
//  -> The integer being considered is a factor of all elements of the second array
//  These numbers are referred to as being between the two arrays. You must determine how many such numbers exist.
// Url: https://www.hackerrank.com/challenges/between-two-sets
func getTotalX(a: [Int], b: [Int]) -> Int {
    return (1...100).filter{ (i) in (a.filter{i % $0 == 0}.count == a.count) && (b.filter{$0 % i == 0}.count == b.count)}.count
}

// Another version of previous funtion, but more eficcient (5x faster) because it uses less cycles.
func getTotalXV2(a: [Int], b: [Int]) -> Int {
    let min = b.min() ?? 1
    return (1...min).filter{ (i) in (a.filter{i % $0 == 0}.count == a.count) && (b.filter{$0 % i == 0}.count == b.count)}.count
}

