import Foundation

struct Stack<T> {
    private var value: [T] = []
    
    var isEmpty: Bool {
        self.value.isEmpty
    }
    
    mutating func push(_ value: T) {
        self.value.append(value)
    }
    
    mutating func pop() -> T? {
        return self.value.popLast()
    }
}

func solution(_ s: String) -> Bool {
    var stack = Stack<Void>.init()
    
    for bracket in s {
        if bracket == "(" {
            stack.push(())
        } else {
            if stack.pop() == nil {
                return false
            }
        }
    }
    
    return stack.isEmpty
}
