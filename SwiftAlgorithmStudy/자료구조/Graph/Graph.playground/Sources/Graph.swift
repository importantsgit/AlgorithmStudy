import Foundation

public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {
    associatedtype Element
    
    // 꼭지점을 생성하고 그것을 그래프에 추가함
    func createVertex(data: Element) -> Vertex<Element>
    
    // directed edge를 두 개의 꼭지점 사이에 추가
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double)
    // 두 개의 꼭지점 사이에 양방향 모서리 undirected(or bidirectional)를 추가
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double)
    // edgeType를 사용하여 방향이 정해진 또는 양방향 모서리를 두개의 꼭지점 사이에 추가
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double)
    // 특정 꼭지점에서 다른 꼭지점으로 연결된 모서리들 목록을 반환
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    //두 꼭지점 사이의 모서리 가중치를 반환
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double
}

extension Graph {
    // 방향이 없는 모든 모서리는 양방향 모두 순회할 수 있음 -> 방향 있는 func에 양방향으로 값 집어넣음
    // 이 구현은 재사용되기 때문에 확장에다 집어넣기
    public func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double) {
        // Bidrectional을 Protocol Extension을 통해 구현
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    // 방향 또는 무방향 모서리를 만들 수 있는 편리한 메서드
    // 프로토콜 채택하면 addUndirected를 사용할 수 있고, 만약 directed을 추가하고 싶다면 
    public func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}
