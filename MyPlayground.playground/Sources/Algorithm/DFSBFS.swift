import Foundation

// https://www.acmicpc.net/problem/2178

public func findShortestPath(_ n: Int, _ m: Int, arr: [[Int]]) -> Int {
    let row = Array(repeating: Int.max, count: m)
    var visited = Array(repeating: row, count: n)
    
    // 상하좌우로 이동
    let dy = [-1, 1, 0, 0]
    let dx = [0, 0, -1, 1]
    // 0이거나 범위를 넘어가거나 visited에서 도착번째가 더 작은 경우 패스
    var queue = [(y: Int, x: Int)]()
    queue.append((y: 0, x: 0))
    visited[0][0] = 1
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        if y == n-1 && x == m-1 { return visited[n-1][m-1] }
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
            if arr[ny][nx] == 0 || visited[ny][nx] != .max { continue }
            visited[ny][nx] = visited[y][x] + 1
            queue.append((ny, nx))
        }
    }
    
    return visited[n][m]
}

// let nums = readLine()!.split(separator: " ").map { Int($0)! }
// let (n, m) = (nums[0], nums[1])
// var array = [[Int]]()
// for _ in 0..<n {
//     let arr = readLine()!.map { Int(String($0))! }
//     array.append(arr)
// }
//
// print(findMap(n, m, arr: array))

// https://www.acmicpc.net/problem/11403

public func findPath(_ n: Int, _ arr: [[Int]]) -> [[Int]] {
    var connected = Array(repeating: [Int](), count: n)
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if arr[i][j] == 1 {
                connected[i].append(j)
                result[i][j] = 1
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if isConnected(i, j) {
                result[i][j] = 1
            }
        }
    }
    
    func isConnected(_ y: Int, _ x: Int) -> Bool {
        var queue = connected[y]
        var visited = Array(repeating: 0, count: n)
        while !queue.isEmpty {
            let temp = queue.removeFirst()
            if visited[temp] == 1 { continue }
            visited[temp] = 1
            if connected[temp].contains(x) {
                return true
            }
            queue.append(contentsOf: connected[temp])
        }
        return false
    }
    return result
}

// let n = Int(readLine()!)!
// var arr = [[Int]]()
// for _ in 0..<n {
//     let temp = readLine()!.split(separator: " ").map { Int($0)! }
//     arr.append(temp)
// }
//
// let result = findPath(n, arr)
// for i in 0..<result.count {
//     for j in 0..<result.count {
//         print(result[i][j], terminator: " ")
//     }
//     print("")
// }
