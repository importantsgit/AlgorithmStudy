/*
 DFS 깊이 우선 탐색
 - 모든 경우를 구해볼 때
 1부터 시작해 N개의 노드를 가지는 방향 그래프가 주어짐
 1번 노드에서 시작하여 2~N번 노드에 도달할 수 있는 최단 루트를 각각 구하시오
 */

var n = 6
var edges = [
[1,5],[2,4],[2,5],[3,2],[3,6],[4,2],[4,5],[5,3],[5,6]
]

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
    weak var source: Node<T>?
    let destination: Node<T>
    
    init(from source: Node<T>,to destination: Node<T>){
        self.source = source
        self.destination = destination
    }
}

func BFS(n :Int, edges: [[Int]]) {
    let nodes = (1...n).map{Node<Int>(value: $0)}
    for edge in edges {
        nodes[edge[0] - 1].appendEdgeTo(nodes[edge[1] - 1])
    }
    
    var shortest = Array(repeating: [1], count: n)
    var queue = Queue<Node<Int>>()
    queue.enqueue(nodes[0])
    nodes[0].visited = true
    
    while let node = queue.dequeue() {
        for edge in node.edges {
            let dest = edge.destination
            guard dest.visited == false else { continue }
            queue.enqueue(dest)
            dest.visited = true
            
            shortest[dest.value - 1] = shortest[node.value - 1] + [dest.value]
        }
    }
    print(shortest)
}

BFS(n: n, edges: edges)
