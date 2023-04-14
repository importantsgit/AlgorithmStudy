var n = 7
var wires = [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]]

// 이 문제에서는 어울리지 않는 방법이다. (최소 최대값을 구하는 방법이 아닌, 모든 경우의 수의 합을 구해야됨)
func leftDFS(wires:[[Int]], cnt: Int)->Int{
    return wires.map{ item in leftDFS(wires: wires.filter{$0[1]==item[0]}, cnt: cnt+1) }.reduce(0, +) + cnt
}
func rightDFS(wires:[[Int]], cnt: Int)->Int{
    return wires.map{ item in rightDFS(wires: wires.filter{$0[0]==item[1]}, cnt: cnt+1) }.reduce(0, +) + cnt
}

class Queue{
    var queue = [Int?]()
    var idx = 0
    
    func enqueue(item:Int){
        self.queue.append(item)
    }
    func dequeue()->Int?{
        guard queue.count > idx,
              let item = queue[idx] else {
            return nil
        }
        queue[idx] = nil
        idx += 1
        
        if idx > 3 {
            queue.removeFirst(3)
            idx = 0
        }
        
        return item
    }
}


func BFS(_ idx: Int ,_ rootWire: Int,_ wires:[[Int]]) ->Int {
    var rootWire = rootWire, cnt = 1
    var queue = Queue()
    var visited = [Bool](repeating: false, count: wires.count)
    visited[idx] = true
    queue.enqueue(item: rootWire)
    
    while let item = queue.dequeue() {
        for (idx,wire) in wires.enumerated() {
            if !visited[idx] {
                if wire[0] == item {
                    queue.enqueue(item: wire[1])
                    visited[idx] = true
                    cnt += 1
                } else if wire[1] == item {
                    queue.enqueue(item: wire[0])
                    visited[idx] = true
                    cnt += 1
                }

            }
        }
    }
    return cnt
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var minCount = n
    for i in 0..<n-1 {
        var wire = wires[i]
        print(BFS(i,wire[0], wires), BFS(i,wire[1], wires))
        var minus = abs(BFS(i,wire[0], wires) - BFS(i,wire[1], wires))
        minCount = min(minCount, minus)
    }
    
    return minCount
}

solution(n, wires)
