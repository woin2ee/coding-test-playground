import Foundation

struct Card {
    private(set) var x: Int
    private(set) var y: Int
    
    init(x: Int, y: Int) {
        self.x = max(x, y)
        self.y = min(x, y)
    }
}

func solution(_ sizes:[[Int]]) -> Int {
    let cards = sizes.map { Card.init(x: $0[0], y: $0[1]) }
    return cards.max(by: { $0.x < $1.x })!.x * cards.max(by: { $0.y < $1.y })!.y
}
