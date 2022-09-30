import Foundation

extension Character {
    func caesarEncrypt(distance: Int) -> Character? {
        if self == " " { return " " }
        
        let lowerTable: [Character] = .init("abcdefghijklmnopqrstuvwxyz") // 26개
        let upperTable: [Character] = lowerTable.map { Character($0.uppercased()) }
        
        if let index = lowerTable.firstIndex(of: self) {
            return lowerTable[(index + distance) % 26]
        } else if let index = upperTable.firstIndex(of: self) {
            return upperTable[(index + distance) % 26]
        }
        return nil
    }
}

func solution(_ s: String, _ n: Int) -> String {
    return String(s.compactMap { $0.caesarEncrypt(distance: n) })
}
