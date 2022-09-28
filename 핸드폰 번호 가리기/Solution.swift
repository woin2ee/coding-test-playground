import Foundation

func solution(_ phone_number: String) -> String {
    return phone_number.enumerated()
        .map { i, char in
            if i < phone_number.count - 4 {
                return "*"
            } else {
                return String(char)
            }
        }
        .joined()
}
