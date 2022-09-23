import Foundation

func solution(_ s: String) -> Int {
    var result: String = s
    ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        .enumerated()
        .forEach { i, numStr in
            print(i, numStr)
            result = result.replacingOccurrences(of: numStr, with: String(i))
            print(result)
        }
    return Int(result) ?? -1
}
