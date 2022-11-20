import Foundation

func solution(_ number: Int, _ limit: Int, _ power: Int) -> Int {
    return (1...number)
        .map { calculatePower($0, limit, power) }
        .reduce(0, +)
}

func calculatePower(_ number: Int, _ limit: Int, _ power: Int) -> Int {
    if number <= 0 {
        return 0
    } else {
        var divisors = Set<Int>.init()
        let squareRoot = Int(sqrt(Double(number)))
        
        for divisor in (1...squareRoot) {
            if (number % divisor == 0) {
                divisors.insert(divisor)
                divisors.insert(number / divisor)
                if divisors.count > limit {
                    return power
                }
            }
        }
        return divisors.count
    }
}
