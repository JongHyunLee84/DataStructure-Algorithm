import Foundation

// Bubble
// 앞에서부터 그 다음과 비교하며 계속해서 더 큰 값을 뒤로 보내기를 반복하며 정렬
public func bubbleSort<T: Comparable>(_ array: [T]) -> [T] {
    var sorted = array
    for i in 0..<sorted.count {
        for j in 0..<sorted.count - i - 1 {
            if sorted[j] > sorted[j+1] {
                sorted.swapAt(j, j+1)
            }
        }
    }
    return sorted
}

// Selection
// 앞에서부터 순서대로 그 다음번 요소들과 비교하여 가장 작은 값으로 스왑 해주는 정렬
public func selectionSort<T: Comparable>(_ array: [T]) -> [T] {
    var sorted = array
    for i in 0..<array.count {
        var minIdx = i
        for j in i+1..<array.count {
            if sorted[minIdx] > sorted[j] {
                minIdx = j
            }
        }
        sorted.swapAt(i, minIdx)
    }
    return sorted
}

//Insertion
//0번 인덱스는 정렬되었다고 가정하고, 1번 인덱스부터 시작 해당 인덱스부터 이전 인덱스를 -1씩 접근하면서 본인보다 크면 비교한 인덱스를 뒤로 1이동 시킨다. 만약 본인이 더 크다면 해당 위치에서 멈추고 해당 for문을 끝낸다.
public func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.count == 1 { return array }
    var sorted = array
    for i in 1..<sorted.count {
        let temp = sorted[i]
        for j in (0..<i).reversed() {
            if temp > sorted[j] {
                sorted[j + 1] = temp
                break
            } else {
                sorted[j+1] = sorted[j]
            }
        }
    }
    return sorted
}

// Quick
// 가운데 피봇을 기준으로 작은 값은 왼쪽, 큰 값은 오른쪽으로 넘긴다. 이를 원소의 갯수가 하나가 남을 때까지 재귀적으로 반복한다.
public func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.count == 1 { return array }
    var sorted = array
    var pl = 0
    var pr = array.count - 1
    let pivot = sorted[pr / 2]
    while pl <= pr {
        while sorted[pl] < pivot { pl += 1 }
        while sorted[pr] > pivot { pr -= 1 }
        if pl <= pr {
            sorted.swapAt(pl, pr)
            pl += 1
            pr -= 1
        }
    }
    sorted.append(pivot)
    return quickSort(Array(sorted[0..<pl])) + quickSort(Array(sorted[pl..<sorted.count]))
}

// Merge
// 반씩 계속 쪼개나가다가 더이상 쪼갤 수 없을 때부터 다시 왼쪽과 오른쪽을 병합한다. 이때 각각은 이미 정렬되어 있기에 정렬된 두 배열을 병합하는 방식을 사용하여 재귀적으로 계속해서 병합한다.
public func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.count == 1 { return array }
    
    let mid = array.count / 2
    let left = Array(array[0..<mid])
    let right = Array(array[mid..<array.count])
    print(left, right)
    return mergeTwoArray(mergeSort(left), mergeSort(right))
}

func mergeTwoArray<T: Comparable>(_ la: [T], _ ra: [T]) -> [T] {
    var array: [T] = []
    var li = 0
    var ri = 0
    while li < la.count && ri < ra.count {
        if la[li] > ra[ri] {
            array.append(ra[ri])
            ri += 1
        } else {
            array.append(la[li])
            li += 1
        }
    }
    
    while li < la.count {
        array.append(la[li])
        li += 1
    }
    while ri < ra.count {
        array.append(ra[ri])
        ri += 1
    }
    return array
}

// Counting, Bucket Sort O(n) max값 또는 특정 범위 내에서 정렬이 수행된다는 제한적인 조건
// 각 원소의 계수가 몇 개있는지 세어서 갯수만큼 순서대로 반복하여 나열하는 정렬 방식
public func countingSort(_ array: [Int], _ max: Int) -> [Int] {
    var count = Array(repeating: 0, count: max + 1)
    
    for i in 0..<array.count {
        count[array[i]] += 1
    }
    
    var result: [Int] = []
    
    for i in 1..<count.count {
        for _ in 0..<count[i] {
            result.append(i)
        }
    }
    return result
}

//// heap
//public func heapSort<T: Comparable>(_ array: [T]) -> [T] {
//    
//}
