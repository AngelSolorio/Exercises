import UIKit
import Foundation

extension Array where Element: Comparable {
    // Bubble Sort
    func bubbleSort(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var data = self

        for i in 0..<(data.count-1) {
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) {
                data.swapAt(j, j+1)
            }
        }

        return data
    }
}

// Sort an array of integer numbers
let numbers = [5, 1, 0, 10, 9, 8, 7, 2]
let sortedNumbers = numbers.bubbleSort(by: >)
print("\nSorted numbers = \(sortedNumbers)")

// Sort and array of floating numbers
let decimals = [64,24,12,22,11,3,-2.5,99]
let sortedDecimals = decimals.bubbleSort(by: <)
print("\nSorted decimals = \(sortedDecimals)")

// Sort and array of strings
let strings = ["John", "David", "Angel", "Pallav", "Erika", "Stefany", "Abbey"]
let sortedStrings = strings.bubbleSort(by: >)
print("\nSorted strings = \(sortedStrings)")
