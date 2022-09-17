import Foundation

func solution(_ num: Int) -> Int {
    var result = num
    
    for count in 0..<500 {
        if result == 1 { return count }
        
        if result.isEven {
            result /= 2
        } else {
            result *= 3
            result += 1
        }
    }
    
    return -1
}

extension Int {
    var isEven: Bool {
        if self & 1 == 0 { return true }
        else { return false }
    }
}
