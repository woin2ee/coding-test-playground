import Foundation

func solution(_ absolutes: [Int], _ signs: [Bool]) -> Int {
    return zip(absolutes, signs)
        .map { abs, sign -> Int in
            sign ? abs : -abs
        }
        .reduce(0) { $0 + $1 }
}
