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

    // Insertition Sort
    func insertionSort(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var data = self

        for i in 1..<data.count {
            var j = i - 1;
            var shouldReorder = false

            // Iterates to find the correct position of the sorting element into the sorted section
            while (j >= 0 && areInIncreasingOrder(data[i], data[j])) {
                shouldReorder = true
                j -= 1;
            }

            // Inserts the sorting element into its final position
            if shouldReorder {
                data.insert(data[i], at: j+1)
                data.remove(at: i+1)
            }
        }

        return data
    }

    // Selection Sort
    func selectionSort(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var data = self

        for i in 0..<(data.count-1) {
            var key = i

            for j in i+1..<data.count where areInIncreasingOrder(data[j], data[key]) {
                key = j
            }

            if key != i {
                data.swapAt(i, key)
            }
        }

        return data
    }
}

// Sort an array of integer numbers
let numbers = [5, 1, 0, 10, 9, 8, 7, 2]
let sortedNumbers = numbers.selectionSort(by: >)
print("\nSorted numbers = \(sortedNumbers)")

// Sort and array of floating numbers
let decimals = [64,24,12,22,11,3,-2.5,99]
let sortedDecimals = decimals.selectionSort(by: <)
print("\nSorted decimals = \(sortedDecimals)")

// Sort and array of strings
let strings = ["John", "David", "Angel", "Pallav", "Erika", "Stefany", "Abbey"]
let sortedStrings = strings.selectionSort(by: <)
print("\nSorted strings = \(sortedStrings)")
