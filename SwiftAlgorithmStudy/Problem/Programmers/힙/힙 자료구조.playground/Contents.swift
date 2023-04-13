enum Child{
    case none, left, both
    
    static func type(_ idx: Int,_ count: Int) -> Self {
        if count <= idx * 2 {return .none}
        else if count - 1 == idx * 2 {return .left}
        else {return .both}
    }
}

class Heap {
    var heap:[Int] = [Int.max]
    
    var hasMaxValue: Bool {
        if heap.count == 1 {return false}
        else {return true}
    }
    
    func getParentIndex(_ currentIdx: Int)->Int{currentIdx/2}
    func getLeftChildIndex(_ currentIdx: Int)->Int{currentIdx*2}
    func getRightChildIndex(_ currentIdx: Int)->Int{currentIdx*2+1}
    
    func insert(num:Int) {
       
        var currentIdx = heap.count
        heap.append(num)
        
        while heap[self.getParentIndex(currentIdx)] < heap[currentIdx]{
            heap.swapAt(getParentIndex(currentIdx), currentIdx)
            currentIdx = getParentIndex(currentIdx)
        }
    }
    
    func pop() -> Int? {
        if !hasMaxValue {return nil}
        var currentIdx = heap.count-1
        heap.swapAt(currentIdx, 1)
        var item = heap.popLast()
        currentIdx = 1
        
        while true {
            switch Child.type(currentIdx, heap.count) {
            case .left:
                if heap[self.getLeftChildIndex(currentIdx)] > heap[currentIdx] {
                    heap.swapAt(self.getLeftChildIndex(currentIdx), currentIdx)
                    currentIdx = self.getLeftChildIndex(currentIdx)
                } else {
                    return item
                }
            case .both:
                var leftChild = heap[self.getLeftChildIndex(currentIdx)]
                var rightChild = heap[self.getRightChildIndex(currentIdx)]
                var greaterChildIdx = leftChild > rightChild ? self.getLeftChildIndex(currentIdx) : self.getRightChildIndex(currentIdx)

                if heap[greaterChildIdx] > heap[currentIdx] {
                    heap.swapAt(greaterChildIdx, currentIdx)
                    currentIdx = greaterChildIdx
                } else {
                    return item
                }

                
            case .none: return item
            }
        }
    }
}

var heap = Heap()
heap.insert(num: 1)
heap.insert(num: 3)
heap.insert(num: 2)
heap.insert(num: 4)
heap.insert(num: 6)
heap.insert(num: 5)

print(heap.pop())
print(heap.pop())
print(heap.pop())
print(heap.pop())
print(heap.pop())
print(heap.pop())

