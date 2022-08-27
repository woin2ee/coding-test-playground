import Foundation

struct Coordinate {
    var x: Int
    var y: Int
    
    func measureDistance(to coordinate: Self) -> UInt {
        (self.x - coordinate.x).magnitude + (self.y - coordinate.y).magnitude
    }
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var leftHandNumber: Int = -1
    var rightHandNumber: Int = -2
    
    let numbersCoordinate: [Int : Coordinate] = [
        1 : .init(x: 0, y: 0), 2 : .init(x: 1, y: 0), 3 : .init(x: 2, y: 0),
        4 : .init(x: 0, y: 1), 5 : .init(x: 1, y: 1), 6 : .init(x: 2, y: 1),
        7 : .init(x: 0, y: 2), 8 : .init(x: 1, y: 2), 9 : .init(x: 2, y: 2),
        -1 : .init(x: 0, y: 3), 0 : .init(x: 1, y: 3), -2 : .init(x: 2, y: 3)
    ]
    
    numbers.forEach { number in
        switch number {
        case 1, 4, 7:
            leftHandNumber = number
            result += "L"
        case 3, 6, 9:
            rightHandNumber = number
            result += "R"
        default:
            let leftHandDistance = numbersCoordinate[leftHandNumber]!.measureDistance(to: numbersCoordinate[number]!)
            let rightHandDistance = numbersCoordinate[rightHandNumber]!.measureDistance(to: numbersCoordinate[number]!)
            
            if leftHandDistance < rightHandDistance {
                leftHandNumber = number
                result += "L"
            } else if rightHandDistance < leftHandDistance {
                rightHandNumber = number
                result += "R"
            } else {
                if hand == "left" {
                    leftHandNumber = number
                    result += "L"
                } else {
                    rightHandNumber = number
                    result += "R"
                }
            }
        }
    }
    
    return result
}
