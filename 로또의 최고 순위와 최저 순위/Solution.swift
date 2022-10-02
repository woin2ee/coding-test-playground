import Foundation

func solution(_ lottos: [Int], _ win_nums: [Int]) -> [Int] {
    let winningCount = lottos.filter { win_nums.contains($0) }.count
    let zeroCount = lottos.filter { $0 == 0 }.count
    let maxWinningCount = winningCount + zeroCount
    let maxRank = maxWinningCount == 0 ? 6 : 7 - maxWinningCount
    let minRank = winningCount == 0 ? 6 : 7 - winningCount
    return [maxRank, minRank]
}
