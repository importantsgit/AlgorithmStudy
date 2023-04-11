import Foundation

public struct Edge<T> {
    // 시작
    public let source: Vertex<T>
    // 목적지
    public let destination: Vertex<T>
    // 가중치
    public let weight: Double
    
    init(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        self.source = source
        self.destination = destination
        if let weight = weight {
            self.weight = weight
        } else {
            self.weight = 0
        }
    }
}
