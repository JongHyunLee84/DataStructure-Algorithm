import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var deleted: [Int] = [] // Stack
    var currentIdx = k
    var moveCnt = 0
    var list = BinaryIndexedTree(size: n)
    var lastIdx = cmd.count - 1
    // 복구 처리 : 배열에 스택 형태로 마지막 값을 꺼내서 해당 인덱스를 다시 o처리
    // 삭제 처리 : 현재 인덱스 x처리, 현재 인덱스 아래로 이동 or 마지막일 경우 위로 이동
    // 삭제하는 인덱스가 마지막인 경우 : 아래에 o처리된 것이 하나도 없을 때
    // 인덱스 up, down 처리 : 우선적으로는 변경가능한 누적합 x, 그냥 이동할 때 x인 것은 안세고 이동하라는 값까지 이동
    for i in 0..<cmd.count {
        
        let cmdStr = cmd[i]
        if cmdStr.first == "D" {
            let num = Int(cmdStr.components(separatedBy: " ").last!)!
            moveCnt += num
        } else if cmdStr.first == "U" {
            let num = Int(cmdStr.components(separatedBy: " ").last!)!
            moveCnt -= num
        } else if cmdStr.first == "C" {
            let deletedCnt = list.rangeSum(left: currentIdx, right: currentIdx + moveCnt)
            currentIdx += moveCnt
            currentIdx += deletedCnt
            moveCnt = 0
            list.update(idx: currentIdx, value: 1)
            deleted.append(currentIdx)
            if list.rangeSum(left: currentIdx, right: n - 1) >= (n - currentIdx - 1) {
                currentIdx -= 1
            } else {
                currentIdx += 1
            }
        } else {
            let idx = deleted.removeLast()
            list.update(idx: idx, value: -1)

        }
    }
    
    return (0..<n).map {
        return list.rangeSum(left: $0, right: $0) == 0 ? "O" : "X"
    }
    .joined()
}

solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"])
