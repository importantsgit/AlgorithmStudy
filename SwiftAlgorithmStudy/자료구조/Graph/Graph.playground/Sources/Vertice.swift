import Foundation

public struct Vertex<T> {
    // 꼭지점은 유니크한 index를 가짐
    public let index: Int
    public let data: T
}

// Vertex는 딕셔너리의 키 값을 사용하기 위해서, Hashable 프로토콜을 채택합니다.
extension Vertex: Hashable {
    //index 프로퍼티 가지고 hash와 ==를 구현
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
    
    public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.index == rhs.index
    }
}

extension Vertex: CustomStringConvertible {
    // 출력할 모양을 정의
    public var description: String {
        return "(idx:\(index)-data:\(data)) "
    }
}
