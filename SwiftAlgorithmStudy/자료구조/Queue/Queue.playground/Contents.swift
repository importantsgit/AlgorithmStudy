struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    private var capaIdx: Int = 0
    
    init() {
        self.capaIdx = 19
        print("수용량이 20으로 초기화 되었습니다.")
    }
    
    init (capacity: Int) {
        self.capaIdx = capacity - 1
        print("수용량이 \(capacity)으로 초기화 되었습니다.")
    }
    
    private var count: Int {
        return queue.count
    }
    
    private var isEmpty: Bool {
        return queue.isEmpty
    }
    
    private var isFull: Bool {
        return count-1 >= capaIdx
    }
    
    mutating func enQueue(_ element: T){
        if !isFull { queue.append(element) }
        else { print("수용량을 넘었습니다.") }
    }
    
    mutating func deQueue() -> T? {
        guard head < count,
              let element = queue[head]
        else {
            print("요소가 없습니다.")
            return nil
        }
        queue[head] = nil
        head += 1
        
        if head > capaIdx {
            head = 0
        }
        return element
    }
    
    mutating func printQueue() {
        print(queue)
    }
}

var queue: Queue = Queue<Int>(capacity: 3)
queue.enQueue(1)
queue.enQueue(2)
queue.enQueue(3)
queue.enQueue(4)
queue.enQueue(3)
queue.enQueue(4)

queue.printQueue()
print(queue.deQueue()!)
print(queue.deQueue()!)
print(queue.deQueue()!)
print(queue.deQueue() ?? "없음")
