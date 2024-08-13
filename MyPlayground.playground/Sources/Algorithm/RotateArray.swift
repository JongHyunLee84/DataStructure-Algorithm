import Foundation

// 배열 돌리기
// 초기 배열의 위치에서 90도 회전한 모습의 배열을 리턴한다
//[1,2,3,4],      9  5 1
//[5,6,7,8],   -> 10 6 2
//[9,10,11,12]    11 7 3
//                12 8 4

// (0,0) -> (2,0)
// (0,1) -> (1,0)
// (0,2) -> (0,0)


// 시계방향
public func rotate(_ array: [[Int]]) -> [[Int]] {
    if array.isEmpty { return [[]] }
    let arrCnt = array.count
    let arrRowCnt = array[0].count
    let row = Array(repeating: 0, count: arrCnt)
    var result = Array(repeating: row, count: arrRowCnt)
    for y in 0..<arrRowCnt {
        for x in 0..<arrCnt {
            result[y][x] = array[arrCnt - 1 - x][y]
        }
    }
    return result
}

// 반시계방향
public func rotateReverse(_ array: [[Int]]) -> [[Int]] {
    if array.isEmpty { return [[]] }
    let arrCnt = array.count
    let arrRowCnt = array[0].count
    let row = Array(repeating: 0, count: arrCnt)
    var result = Array(repeating: row, count: arrRowCnt)
    for y in 0..<arrRowCnt {
        for x in 0..<arrCnt {
            result[y][x] = array[x][arrRowCnt - 1 - y]
        }
    }
    return result
}
