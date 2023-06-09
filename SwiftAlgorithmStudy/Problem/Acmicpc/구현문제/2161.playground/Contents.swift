/*
 2161
 카드1
 
 맨 첫번째 카드를 버릴 것인지 아니면 뒤에 집어넣을 것인지 선택
 앞에서 빼고 뒤에서 집어넣는다.
 (큐를 생각하자)
 */

struct Queue {
    private var queue = [Int?]()
    private var idx = 0

    mutating func enqueue(items: [Int]) {
        queue += items
    }
    
    mutating func enqueue(item: Int) {
        queue.append(item)
    }
    
    mutating func dequeue() -> Int? {
        guard queue.count > idx,
            let item = queue[idx] else {
            return nil
        }
        
        queue[idx] = nil
        idx += 1
        
        if idx > 2 {
            queue.removeFirst(3)
            idx = 0
        }
        
        return item
    }
}

var c = Int(readLine()!)!
var queue = Queue()
queue.enqueue(items: [Int](1...c))
var arr = [Int]()
var isEnqueue = false

while let item = queue.dequeue() {
    if isEnqueue {
        queue.enqueue(item: item)
    } else {
        arr.append(item)
    }
    isEnqueue.toggle()
}

print(arr.map{String($0)}.joined(separator: " "))

