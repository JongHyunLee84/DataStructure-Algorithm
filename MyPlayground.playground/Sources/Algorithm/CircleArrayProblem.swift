import Foundation

// 달팽이 문제
// N, M을 입력받고 N x M의 행렬에 숫자들을 그림처럼 나선형으로 채워넣는 문제.
// 1  2  3  4
// 12 13 14 5
// 11 16 15 6
// 10 9  8  7

public func circleArrayProblem(_ n: Int, _ m: Int) -> [[Int]] {
    // 우, 하, 좌, 상 방향 순으로 계속해서 idx를 1씩 추가하면서 움직인다.
    // 이때, 벽에 닿거나 다음이 0이 아니라면 방향을 바꿔준다.
    // 방향을 바꿔도 성립되는 조건의 자리가 없다면 종료
    
    // 재귀적으로 움직이며 방향을 바꿔준다.
    // 어느 위치에서 어느 방향으로 무슨 idx를 채워야 하는지 인풋으로 받는다.
    // while문으로 계속해서 0을 다른 idx로 채워준다.
    // 벽에 닿거나 0이 아니라면 방향을 바꿔서 다음 재귀로 넘긴다.
    
    let row = Array(repeating: 0, count: n)
    var array = Array(repeating: row, count: m)
    let dy = [0, 1, 0, -1]
    let dx = [1, 0, -1, 0]
    func recursion(_ dir: Int, _ y: Int, _ x: Int, _ idx: Int) {
//        for i in 0..<m {
//            for j in 0..<n {
//                print(array[i][j], terminator: "")
//            }
//            print("")
//        }
//        print("")
        if idx == n * m { return }
        let ny = dy[dir % 4] + y
        let nx = dx[dir % 4] + x
        if ny < 0 || nx < 0 || ny >= m || nx >= n { 
            recursion(dir + 1, y, x, idx)
            return
        } // 방향을 바꿔서 넘김
        if array[ny][nx] != 0 { 
            recursion(dir + 1, y, x, idx)
            return
        } // 방향을 바꿔서 넘김
        array[ny][nx] = idx + 1
        recursion(dir, ny, nx, idx+1)
    }
    array[0][0] = 1
    recursion(0, 0, 0, 1)
    return array
}
