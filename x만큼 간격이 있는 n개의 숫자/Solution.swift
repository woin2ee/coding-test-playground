import Foundation

func solution(_ x: Int, _ n: Int) -> [Int64] {
    var result: [Int64] = []
    for _ in 0..<n {
        result.append((result.last ?? 0) + Int64(x))
    }
    return result
}
