import Foundation

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    var x: Int = -1
    var y: Int = -1
    
    for yellowX in 1...yellow {
        if yellow % yellowX != 0 { continue }
        let yellowY = yellow / yellowX
        if yellowX * 2 + yellowY * 2 + 4 == brown {
            x = yellowX + 2
            y = yellowY + 2
        }
    }
    
    return [max(x, y), min(x, y)]
}
