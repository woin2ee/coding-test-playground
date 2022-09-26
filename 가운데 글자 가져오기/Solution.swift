import Foundation

func solution(_ s: String) -> String {
    if s.count % 2 == 1 {
        let idx = s.index(s.startIndex, offsetBy: (s.count - 1) / 2)
        return String(s[idx])
    } else {
        let startIdx = s.index(s.startIndex, offsetBy: s.count / 2 - 1)
        let endIdx = s.index(s.startIndex, offsetBy: s.count / 2)
        return String(s[startIdx...endIdx])
    }
}
