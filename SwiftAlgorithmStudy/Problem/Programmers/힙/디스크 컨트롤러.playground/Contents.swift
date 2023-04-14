enum Child {
    case left, both, none
    
    static func type(idx: Int, count: Int) -> Self {
        if count <= idx * 2 {return .none}
        if count - 1 == idx * 2 {return .left}
        return .both
    }
}

class Heap {
    var heap:[[Int]] = [[-1,-1]]
    var maxValue: [Int]? {
        if heap.count == 1 {return nil}
        return heap[1]
    }
    
    var hasMaxValue: Bool {
        if heap.count == 1 {return false}
        return true
    }
    
    func getParentIdx(_ currentIdx: Int) -> Int {currentIdx/2}
    func getLeftChildIdx(_ currentIdx: Int) -> Int {currentIdx*2}
    func getRightChildIdx(_ currentIdx: Int) -> Int {currentIdx*2+1}
    
    func insert(job :[Int]){
        var currentIdx = heap.count
        heap.append(job)
        
        while heap[self.getParentIdx(currentIdx)][1] > heap[currentIdx][1] {
            heap.swapAt(self.getParentIdx(currentIdx), currentIdx)
            currentIdx = self.getParentIdx(currentIdx)
        }
    }
    
    func pop()->[Int]? {
        if heap.count == 1 {return nil}
        heap.swapAt(heap.count - 1, 1)
        var item = heap.popLast()!
        var currentIdx = 1

        while true {
            switch Child.type(idx: currentIdx, count: heap.count) {
            case .both:
                var minIdx = heap[self.getLeftChildIdx(currentIdx)][1] < heap[self.getRightChildIdx(currentIdx)][1] ? self.getLeftChildIdx(currentIdx) : self.getRightChildIdx(currentIdx)
                if heap[minIdx][1] < heap[currentIdx][1] {
                    heap.swapAt(minIdx, currentIdx)
                    currentIdx = minIdx
                } else {
                    return item
                }
                
            case .left:
                if heap[self.getLeftChildIdx(currentIdx)][1] < heap[currentIdx][1]{
                    heap.swapAt(self.getLeftChildIdx(currentIdx), currentIdx)
                    currentIdx = self.getLeftChildIdx(currentIdx)
                } else {
                    return item
                }
            case .none:
                return item
            }
        }
    }
}

func solution(_ jobs:[[Int]]) -> Int {
    var heap = Heap()
    var jobs = jobs.sorted{$0[0] < $1[0]}
    for job in jobs {
        heap.insert(job: job)
    }
    var plusTime = 0
    while heap.hasMaxValue {
        guard let runningJob = heap.pop() else {break}
        var runningTime = runningJob[1]
        plusTime += runningTime
        
        while let nextJob = heap.maxValue,
              runningTime > nextJob[0] {
            let nextJob = heap.pop()!
            var plus = (runningTime - nextJob[0]) + 1
            heap.insert(job: [runningTime, plus + nextJob[1]])

        }
    }
    
    return plusTime/jobs.count
}
var jobs = [[0, 3], [1, 9], [2, 6]]
solution(jobs)



