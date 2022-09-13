import Foundation

func solution(_ n: Int64) -> [Int] {
    var result: [Int] = []
    var n = n
    while(n != 0) {
        result.append(Int(n % 10))
        n /= 10
    }
    return result
}
