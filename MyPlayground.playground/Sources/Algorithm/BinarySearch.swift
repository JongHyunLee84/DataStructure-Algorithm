import Foundation

// 이진검색은 선행조건으로 array가 정렬되어 있어야 한다.
// 정렬된 배열을 반으로 쪼개서 찾고자 하는 값을 마지막 값과 대소비교 해준다.
// 반복한다.

public func binarySearch<T: Comparable>(_ list: [T], key: T, range: Range<Int>) -> Int? {
    print("lowerBound: \(range.lowerBound), upperBound: \(range.upperBound)")
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        print("midIndex: \(midIndex)")
        if list[midIndex] > key {
            return binarySearch(list, key: key, range: range.lowerBound..<midIndex)
        } else if list[midIndex] < key {
            return binarySearch(list, key: key, range: midIndex+1..<range.upperBound)
        } else {
            return midIndex
        }
    }
}
