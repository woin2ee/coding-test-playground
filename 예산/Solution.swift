import Foundation

func solution(_ d: [Int], _ budget: Int) -> Int {
    var budget = budget
    var count: Int = d.count
    let d = d.sorted(by: { $0 < $1 })
    
    for i in 0..<d.count {
        budget -= d[i]
        if budget < 0 {
            return i
        }
    }
    
    return count
}
