import UIKit
import Foundation

extension Array where Element: Comparable {
    // Bubble Sort
    // Average complexity:  O(n^2)
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
    // Average complexity:  O(n^2)
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
    // Average complexity:  O(n^2)
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
    // Average complexity:  O(n log(n))
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

    // Quick Sort
    // Average complexity:  O(n log(n))
    func quickSort(by areInIncreasingOrder:(Element, Element) -> Bool) -> [Element] {
        var data = self

        if (data.count > 1) {
            _partitioning(array: &data, startIndex: 0, endIndex: data.count-1, by: areInIncreasingOrder)
        }

        return data
    }

    private func _partitioning(array: inout Array, startIndex: Int, endIndex: Int, by areInIncreasingOrder: (Element, Element) -> Bool) {
        if startIndex >= endIndex {
            return;
        }

        // Takes the middle element as the pivot and then recursively orders the elements on the left and right side
        let pivot = array[(startIndex + endIndex) / 2]
        let pIndex = _quickSorting(array: &array, lowerIndex: startIndex, higherIndex: endIndex, pivot: pivot, by: areInIncreasingOrder)
        _partitioning(array: &array, startIndex: startIndex, endIndex: pIndex-1, by: areInIncreasingOrder)
        _partitioning(array: &array, startIndex: pIndex, endIndex: endIndex, by: areInIncreasingOrder)
    }

    private func _quickSorting(array: inout Array, lowerIndex: Int, higherIndex: Int, pivot: Element, by areInIncreasingOrder: (Element, Element) -> Bool) -> Int {
        var lower = lowerIndex
        var higher = higherIndex

        // Sort the array placing the lower values than pivot to the left and the higher values to the right or viceversa if the order is descending
        while lower <= higher {
            while areInIncreasingOrder(array[lower], pivot) {
                lower += 1
            }

            while areInIncreasingOrder(pivot, array[higher]) {
                higher -= 1
            }

            if lower <= higher {
                array.swapAt(lower, higher)
                lower += 1
                higher -= 1
            }
        }

        return lower
    }
}

// Sort an array of integer numbers
let numbers = [5, 1, 0, 10, 9, 8, 7, 2]
let sortedNumbers = numbers.quickSort(by: >)
print("\nSorted numbers = \(sortedNumbers)")

// Sort and array of floating numbers
let decimals = [64,24,12,22,11,3,-2.5,99]
let sortedDecimals = decimals.quickSort(by: <)
print("\nSorted decimals = \(sortedDecimals)")

// Sort and array of strings
let strings = ["John", "David", "Angel", "Pallav", "Erika", "Stefany", "Abbey"]
let sortedStrings = strings.quickSort(by: <)
print("\nSorted strings = \(sortedStrings)")
