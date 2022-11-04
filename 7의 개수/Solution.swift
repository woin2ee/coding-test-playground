import Foundation

func solution(_ array:[Int]) -> Int {
    return array
        .map { String($0) }
        .map { numberString -> Int in
            countNumber(in: numberString)
        }
        .reduce(0) { $0 + $1 }
}

func countNumber(in string: String) -> Int {
    return string.filter { char in
        char == "7"
    }.count
}
