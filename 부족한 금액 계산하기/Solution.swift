import Foundation

func solution(_ price: Int, _ money: Int, _ count: Int) -> Int64 {
    var total: Int64 = 0
    for i in 1...count {
        total += Int64(price * i)
    }
    if money >= total {
        return 0
    }
    return (Int64(money) - total) * -1
}
