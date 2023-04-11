struct Stack<T> {
    var stack:[T] = []
    
    private var count: Int {
        return stack.count
    }
    
    private var isEmpty: Bool {
        return stack.isEmpty
    }
    
    mutating func push(_ num: T) {
        stack.append(num)
    }
    
    mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}

// 베열로 충분히 만들 수 있음
var arr: [Int] = []

arr.append(1)
arr.popLast()
