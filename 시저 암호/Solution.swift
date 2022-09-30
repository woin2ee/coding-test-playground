import Foundation

extension Character {
    func caesarEncrypt(distance: Int) -> Character {
        let alphabets: [Character] = .init("abcdefghijklmnopqrstuvwxyz") // 26개
        
        guard let index = alphabets.firstIndex(of: Character(self.lowercased())) else {
            return " "
        }
        
        let encryptedAlphabet = alphabets[(index + distance) % alphabets.count]

        return self.isLowercase ? encryptedAlphabet : Character(encryptedAlphabet.uppercased())
    }
}

func solution(_ s: String, _ n: Int) -> String {
    return String(s.compactMap { $0.caesarEncrypt(distance: n) })
}
