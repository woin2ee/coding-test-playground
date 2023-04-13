import Foundation

enum KeyboardError: Error {
    case noAlphabet
}

func findTapCountForAlphabet(_ alphabet: Character, in key: String) -> Int? {
    guard let index = key.firstIndex(of: alphabet) else {
        return nil
    }
    return index.utf16Offset(in: key) + 1
}

func solution(_ keymap: [String], _ targets: [String]) -> [Int] {
    let alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    let optimalDictionary = alphabets
        .reduce(into: [Character: Int?]()) { dict, alphabet in
            let optimalTapCount: Int? = keymap
                .compactMap { findTapCountForAlphabet(alphabet, in: $0) }
                .min()
            
            dict[alphabet] = optimalTapCount
        }
    
    let result = targets.map { targetString -> Int in
        do {
            let requiredTapCount = try targetString
                .map { alphabet in
                    guard case let tapCount?? = optimalDictionary[alphabet] else {
                        throw KeyboardError.noAlphabet
                    }
                    return tapCount
                }
                .reduce(0, +)
            return requiredTapCount
        } catch {
            return -1
        }
    }
    
    return result
}
