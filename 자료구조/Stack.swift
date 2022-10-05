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
