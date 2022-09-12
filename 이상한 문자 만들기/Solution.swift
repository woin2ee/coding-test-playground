import Foundation

func solution(_ s: String) -> String {
    return s.split(separator: " ", omittingEmptySubsequences: false)
        .map { word in
            word.enumerated().map { idx, char in
                idx.isOdd ? char.lowercased() : char.uppercased()
            }
        }
        .map { $0.joined() }
        .joined(separator: " ")
}

extension Int {
    var isOdd: Bool {
        self & 1 == 1 ? true : false
    }
}
