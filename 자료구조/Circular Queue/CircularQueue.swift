struct CycleIndex {
    var value: Int
    private var max: Int
    private var min: Int
    
    init(max: Int, min: Int = 0, current: Int? = nil) {
        self.max = max
        self.min = min
        if let current = current {
            self.value = current
        } else {
            self.value = min
        }
    }
    
    mutating func next() {
        if value < max {
            value += 1
        } else {
            value = min
        }
    }
    
    static func ==(left: CycleIndex, right: CycleIndex) -> Bool {
        return left.value == right.value
    }
}

struct CircularQueue<T> {
    private var queue: [T?]
    private var size: Int
    private var nextInput: CycleIndex
    private var nextOutput: CycleIndex

    var isEmpty: Bool {
        return (nextInput == nextOutput) && (queue[nextOutput.value] == nil)
    }

    var isFull: Bool {
        return (nextInput == nextOutput) && (!self.isEmpty)
    }

    init(size: Int) {
        self.queue = .init(repeating: nil, count: size)
        self.size = size
        self.nextInput = .init(max: size - 1, min: 0)
        self.nextOutput = .init(max: size - 1, min: 0)
    }

    mutating func enqueue(_ value: T) {
        if isFull { return }
        queue[nextInput.value] = value
        nextInput.next()
    }

    mutating func dequeue() -> T? {
        if isEmpty { return nil }
        let returnValue = self.queue[nextOutput.value]
        self.queue[nextOutput.value] = nil
        nextOutput.next()
        return returnValue
    }
}
