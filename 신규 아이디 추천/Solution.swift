import Foundation

func solution(_ new_id: String) -> String {
    return new_id
        .map { $0.lowercased() }.joined()
        .replacingOccurrences(of: "[^a-z0-9._-]", with: "", options: .regularExpression)
        .replacingOccurrences(of: "\\.{2,}", with: ".", options: .regularExpression)
        .trimmingCharacters(in: ["."])
        .appendAIfEmpty()
        .cutOverMaxLength()
        .trimmingCharacters(in: ["."])
        .repeatLastCharacterLessThanMinLength()
}

extension String {
    func appendAIfEmpty() -> String {
        if self.isEmpty {
            return "a"
        }
        return self
    }
    
    func cutOverMaxLength() -> String {
        let result = self
        if self.count >= 16 {
            let lastIndex = result.index(result.startIndex, offsetBy: 15)
            return String(result[result.startIndex..<lastIndex])
        }
        return self
    }
    
    func repeatLastCharacterLessThanMinLength() -> String {
        var result = self
        if result.count <= 2 {
            while(true) {
                result.append(result.last!)
                if result.count == 3 {
                    return result
                }
            }
        }
        return self
    }
}
