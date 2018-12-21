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

    // Merge Sort
    func mergeSort(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var data = self

        if data.count > 1 {
            data = _divideArray(array: data, by: areInIncreasingOrder);
        }

        return data
    }

    private func _divideArray(array: Array, by areInIncreasingOrder:(Element, Element) -> Bool) -> Array {
        if array.count == 1 {
            return array
        }

        var leftArray = Array(array.prefix(upTo: (array.count)/2))
        var rightArray = Array(array.suffix(from: (array.count/2)))

        leftArray = _divideArray(array: leftArray, by: areInIncreasingOrder)
        rightArray = _divideArray(array: rightArray, by: areInIncreasingOrder)

        return _merge(left: leftArray, right: rightArray, by: areInIncreasingOrder)
    }

    private func _merge(left: Array, right: Array, by areInIncreasingOrder:(Element, Element) -> Bool) -> Array {
        var _left = left
        var _right = right
        var mergedArray: Array = []

        while (!_left.isEmpty && !_right.isEmpty) {
            if areInIncreasingOrder(_left[0], _right[0]) {
                mergedArray.append(_left[0])
                _left.remove(at: 0)
            } else {
                mergedArray.append(_right[0])
                _right.remove(at: 0)
            }
        }

        mergedArray.append(contentsOf: _left)
        mergedArray.append(contentsOf: _right)

        return mergedArray
    }
}

// Sort an array of integer numbers
let numbers = [5, 1, 0, 10, 9, 8, 7, 2]
let sortedNumbers = numbers.mergeSort(by: >)
print("\nSorted numbers = \(sortedNumbers)")

// Sort and array of floating numbers
let decimals = [64,24,12,22,11,3,-2.5,99]
let sortedDecimals = decimals.mergeSort(by: <)
print("\nSorted decimals = \(sortedDecimals)")

// Sort and array of strings
let strings = ["John", "David", "Angel", "Pallav", "Erika", "Stefany", "Abbey"]
let sortedStrings = strings.mergeSort(by: <)
print("\nSorted strings = \(sortedStrings)")
