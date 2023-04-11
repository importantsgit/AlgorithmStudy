// 수용량은 제한이 없지만, 전체 count값이 주어졌을 때는 불필요하지 않을까라는 생각이 듦 -> removefirst 값이 있기에 앞 요소들 제거
// 또한 계속 pop했을 때, 오류 발생 -> pop의 if head <= count에서 오류
struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < count, let element = queue[head] else {
            return nil
        }
        queue[head] = nil
        head += 1
        
        if head > 3 {
            // head 만큼 앞의 값 지움
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

var queue: Queue = Queue<Int>()

queue.enqueue(3)
queue.enqueue(2)
queue.enqueue(1)
queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(3)
queue.enqueue(7)

print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")
print(queue.dequeue() ?? "sd")

