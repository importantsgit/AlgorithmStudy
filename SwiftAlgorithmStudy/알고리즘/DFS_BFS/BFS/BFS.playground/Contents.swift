var n = 6
var edges = [
[1,5],[2,4],[2,5],[3,2],[3,6],[4,2],[4,5],[5,3],[5,6]
]

public struct Queue<T> {
    private var queue:[T?] = []
    private var head:Int = 0
    
    public var count:Int { self.queue.count }
    public var isEmpty:Bool { self.queue.isEmpty }
    
    public init() {}
    
    public mutating func enQueue(_ element: T){
        self.queue.append(element)
    }
    
    public mutating func deQueue()->T? {
        guard head < count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        if head > 3 {queue.removeFirst(head);head = 0}
        return element
    }
    
}


class Node<T> {
    let value: T
    var edges = [Edge<T>]()
    var visited = false
    
    init(value: T) {
        self.value = value
    }
    
    func appendEdgeTo(_ node: Node<T>) {
        let edge = Edge<T>(from: self, to: node)
        self.edges.append(edge)
    }
}

class Edge<T> {
    unowned var source: Node<T>?
    let destination: Node<T>
    
    init(from source: Node<T>,to destination: Node<T>){
        self.source = source
        self.destination = destination
    }
}

func BFS(n :Int, edges: [[Int]]) {
    let nodes = (1...n).map{Node<Int>(value: $0)}
    // [1,2,3,4,5] 로 저장

    for edge in edges {
        nodes[edge[0] - 1].appendEdgeTo(nodes[edge[1] - 1])
    }
    var shortest = Array(repeating: [1], count: n)
    var queue = Queue<Node<Int>>()
    queue.enQueue(nodes[0])
    nodes[0].visited = true
    
    while let node = queue.deQueue() {
        for edge in node.edges { // Queue에서 방출된 노드의 엣지들
            let dest = edge.destination
            guard dest.visited == false else { continue }
            queue.enQueue(dest)
            dest.visited = true // 방문한 사실을 알려야 멈출 수 있음
            
            shortest[dest.value - 1] = shortest[node.value - 1] + [dest.value] // 만약 5->3으로 간다면, [1,5] + [3] = [1,5,3]
        }
    }
    print(shortest)
}

BFS(n: n, edges: edges)


