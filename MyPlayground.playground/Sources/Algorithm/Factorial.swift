import Foundation

// https://www.acmicpc.net/problem/1676
// 문제
// N!에서 뒤에서부터 처음 0이 아닌 숫자가 나올 때까지 0의 개수를 구하는 프로그램을 작성하시오.
//
// 입력
// 첫째 줄에 N이 주어진다. (0 ≤ N ≤ 500)
//
// 출력
// 첫째 줄에 구한 0의 개수를 출력한다.
//
// 예제 입력 1
// 10
// 예제 출력 1
// 2
// 예제 입력 2
// 3
// 예제 출력 2
// 0

public func factorial(_ n: Int) -> Int {
    var num = n
    var two = 0
    var five = 0
    while num > 1 {
        var temp = num
        while temp % 2 == 0 {
            two += 1
            temp /= 2
        }
        while temp % 5 == 0 {
            five += 1
            temp /= 5
        }
        num -= 1
    }
    return min(two, five)
}
