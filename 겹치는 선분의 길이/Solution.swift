import Foundation

func solution(_ lines: [[Int]]) -> Int {
    let points = lines
        .map { $0.sorted(by: { $0 < $1 }) }
        .map { ($0[0]..<$0[1]).map { $0 } }
        .flatMap { $0 }

    let overlappedPoints: Set<Int> = .init(
        points.filter { point in
            points.firstIndex(of: point) != points.lastIndex(of: point)
        }
    )
    
    return overlappedPoints.count
}
