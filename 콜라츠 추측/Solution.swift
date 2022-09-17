import Foundation

func solution(_ num: Int) -> Int {
    var result = num
    
    for count in 0..<500 {
        if result == 1 { return count }
        switch result % 2 {
        case 0:
            result /= 2
        case 1:
            result *= 3
            result += 1
        default:
            return -1
        }
    }
    
    return -1
}
