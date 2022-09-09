import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { command -> Int in
        let startIdx = command[0] - 1
        let endIdx = command[1] - 1
        let targetIdx = command[2] - 1
        return array[startIdx...endIdx].sorted { $0 < $1 }[targetIdx]
    }
}
