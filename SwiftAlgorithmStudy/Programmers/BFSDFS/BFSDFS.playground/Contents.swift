struct Queue {
    var queue = [Int?]()
    var idx = 0
    
    mutating func enqueue(item: Int){
        queue.append(item)
    }
    mutating func enqueue(items: [Int]){
        queue += items
    }
    
    mutating func dequeue()->Int?{
        guard idx < queue.count, let item = queue[idx] else {
            return nil
        }
        queue[idx] = nil
        idx += 1
        if idx >= 3 {
            queue.removeFirst(3)
            idx = 0
        }
        return item
    }
}


var graph = [[],[2,3,6],[4,5],[1,2],[6],[5],[3,4],[1]]
var visited = [Bool](repeating: false, count: graph.count)

func BFS(item: Int, visited: [Bool]){
    var visited = visited
    var queue = Queue()
    queue.enqueue(item: item)
    visited[item] = true
    
    while let item = queue.dequeue() {
        print(item)
        for i in graph[item] {
            if !visited[i] {
                queue.enqueue(item: i)
                visited[i] = true
            }
        }
    }
}

//BFS(item: 1, visited: visited)

func DFS(item: Int) {
    print(item)
    visited[item] = true
    for i in graph[item] {
        if !visited[i] {
            DFS(item: i)
        }
    }
}

DFS(item: 1)
