/*
 인접 리스트
 - 그래프의 각 노드에 인접한 노드들을 연결리스트(Linked List)로 표현하는 방법
 - 노드의 개수만큼 인접리스트가 존재, 각각의 인접리스트에는 인접한 노드 정보가 저장
 - 그래프는 각 인접 리스트에 대한 헤드 포인터를 배열로 갖는다.
 - 무향은 1-2라면 1->2 / 2->1로 저장
 - 유향은 1->2라면 1->2 저장
 
 장점
 - 존재하는 간선만 관리하므로 보다 메모리 사용이 효율적
 단점
 - 두 노드를 연결하는 간선을 조회하거나 노드의 차수를 알기 위해서는 노드의 인접 리스트를 탐색해야 하므로 노드의 차수만큼 시간이 필요
 
 - 즉, 느슨하게 연결된 그래프라면 인접 리스트를 쓰는게 좋다.
 */

import Foundation

public class AdjacencyList<T>: Graph {
    private var adjacenecies: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    // 꼭지점을 생성하고 꼭지점을 adjacenecies에 추가 후, vertex를 반환
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacenecies.count, data: data)
        adjacenecies[vertex] = []
        return vertex
    }
    
    // 방향이 있는 Edge를 추가함 ( 가중치도 함께 추가 )
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacenecies[source]?.append(edge)
    }
    
    // 해당 꼭지점에서 연결되어 있는 다른 꼭지점 목록들을 반환
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacenecies[source] ?? []
    }
    
    // 출발점과, 도착점을 넣으면 가중치를 반환
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double {
        return edges(from: source).first { $0.destination == destination }?.weight ?? 0.0
    }
    
    //MARK: - 이 부분 다시 생각하기
//    public func breadthFirstSearch(source: Vertex<T>) -> [T] {
//        var source = source
//        var queue = Queue<Vertex<T>>()
//        queue.enqueue(source)
//
//        var nodesExplored = [source.data]
//        source.visited = true
//
//        while let node = queue.dequeue() {
//            for edge in edges(from: node) {
//                var neighborNode = edge.destination
//                if !neighborNode.visited {
//                    queue.enqueue(neighborNode)
//                    neighborNode.visited = true
//                    nodesExplored.append(neighborNode.data)
//                }
//            }
//            //for edge in node.이웃
//        }
//        return nodesExplored
//    }
}

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacenecies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("목적지: \(edge.destination)- 가중치: \(edge.weight) / ")
                } else {
                    edgeString.append("목적지: \(edge.destination)- 가중치: \(edge.weight)")
                }
            }
            result.append("\(vertex) ---> [\(edgeString)]\n")
        }
        return result
    }
}



