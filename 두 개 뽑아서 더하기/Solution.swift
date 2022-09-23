import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    var additionSet: Set<Int> = .init()
    
    numbers.enumerated().forEach { idx1, number1 in
        numbers.enumerated().forEach { idx2, number2 in
            if idx1 >= idx2 { return }
            additionSet.insert(number1 + number2)
        }
    }
    
    return additionSet.sorted(by: { $0 < $1 })
}
