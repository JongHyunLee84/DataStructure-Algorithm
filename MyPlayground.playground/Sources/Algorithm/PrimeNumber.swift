import Foundation

// https://school.programmers.co.kr/learn/courses/30/lessons/12921
// 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.
//
// 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
// (1은 소수가 아닙니다.)
//
// 제한 조건
// n은 2이상 1000000이하의 자연수입니다.
// 입출력 예
// n    result
// 10    4
// 5    3
// 입출력 예 설명
// 입출력 예 #1
// 1부터 10 사이의 소수는 [2,3,5,7] 4개가 존재하므로 4를 반환
//
// 입출력 예 #2
// 1부터 5 사이의 소수는 [2,3,5] 3개가 존재하므로 3를 반환

public func primeNumber(_ n:Int) -> Int {
    if n == 2 { return 1 }
    var primeList = Array(repeating: 0, count: n + 1)
    primeList[0] = 1
    primeList[1] = 1
    // N = 100이라고 해봅시다. sqrt(100) = 10입니다.
    // 100의 인수들을 나열해보면: 1, 2, 4, 5, 10, 20, 25, 50, 100
    // 여기서 볼 수 있듯이, 10(sqrt(100)) 이하의 인수들만 검사해도 모든 합성수를 걸러낼 수 있습니다.
    let maxNum = Int(sqrt(Double(n)))
    for i in 2...maxNum {
        var temp = i * 2
        while temp <= n {
            primeList[temp] = 1
            temp += i
        }
    }
    return primeList.filter { $0 == 0 }.count
}
