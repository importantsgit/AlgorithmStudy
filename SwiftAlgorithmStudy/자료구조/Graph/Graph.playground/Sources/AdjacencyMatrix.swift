/*
 인접 행렬
 - 노드의 개수가 n이라면, n*n 형태의 2차원 배열로 그래프의 연결 관계를 표현
 - 인접 행렬에서 행과 열은 노드를 의미하며, 각각의 원소들은 노드 간의 간선을 나타냄
 - adj[i][j]
    - 가중치가 없는 무방향 그래프 : 대칭, 1, 0값으로 저장
    - 가중치가 있는 유방향 그래프 : 비대칭, 가중치로 저장
 
 장점
 - 2차원 배열에 모든 노드들의 간선 정보가 있기 때문에, 두 노드를 연결하는 간선을 조회할 때 O(1) 시간 복잡도를 가진다.
 단점
 - 간선의 수와 무관하게 항상 n제곱 크기의 2차원 배열이 필요하므로 메모리 공간 낭비
 - 그래프의 모든 간선의 수를 알아내려면 인접행렬 전체를 확인해야 하므로 O(n제곱) 시간이 소요
 
 - 즉, 촘촘하게 연결된 그래프라면 인접 행렬을 쓰는게 좋다.
 */

import Foundation

public class AdjacencyMatrix<T>: Graph {
    private var vertices: [Vertex<T>] = []
    private var weights: [[Double]] = []
    private var isVisited: [Bool] = []
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        // 새로운 꼭지점을 배열에 추가
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0..<weights.count {
            // 아직 모서리를 가지지 않기 때문에 아무 가중치도 추가하지 않음
            weights[i].append(0)
        }
        let row: [Double] = [Double](repeating: 0, count: vertices.count)
        weights.append(row)
        isVisited.append(false)
        return vertex
    }
    
    // 모서리 생성 -> 가중치 추가
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double = 1.0) {
        weights[source.index][destination.index] = weight
    }
    
    // 꼭지점에 대한 모서리 검색
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        for column in 0..<weights.count {
            let weight = weights[source.index][column]
            edges.append(Edge(
                source: source,
                destination: vertices[column],
                weight: weight
            ))
        }
        return edges
    }
    
    // 가중치 검색
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double {
        return weights[source.index][destination.index]
    }
    
    public func shortestPath() {
        var allDistances:[[Double]] = []
        for i in 0..<weights.count{
            allDistances.append(self.weights[i].map { return $0 == 0.0 ? 10000000.0 : $0})
        }
        printArray(arr: allDistances)
        print("---------------------------------------------")
        floydWarshall(allDistances: &allDistances)
    }
    
    private func floydWarshall(allDistances:inout [[Double]]) {
        for k in 0...allDistances.count-1 {
            for i in 0...allDistances.count-1 {
                if k == i { continue }
                for j in 0...allDistances.count-1 {
                    if j == i {allDistances[i][j]=0}
                    if j == k || j == i { continue }
                    allDistances[i][j] = min(allDistances[i][k]+allDistances[k][j], allDistances[i][j])
                }
            }
        }
        printArray(arr: allDistances)
    }
    
    public func search(source: Vertex<T>) {
        var isVisited = self.isVisited
        DepthFirstSearch(source: source, isVisited: &isVisited)
    }
    
    public func DepthFirstSearch(source: Vertex<T>, isVisited:inout [Bool]) {
        let source = source
        isVisited[source.index] = true
        print("정점 \(source.data) ->")
        for i in 0..<weights.count {
            if weights[source.index][i] != 0 && !isVisited[i] {
                DepthFirstSearch(source: vertices.first(where: {$0.index == i})!, isVisited: &isVisited)
            }
        }
    }
    
    private func printArray(arr: [[Double]]) {
        var grid: [String] = []
        for i in 0..<arr.count {
            var row = ""
            for j in 0..<arr.count {
                let value = arr[i][j]
                if value != 10000000.0 {
                    row += "\(value) \t"
                } else {
                    row += "INF  \t\t"
                }
            }
            grid.append(row)
        }

        let edgesDescription = grid.joined(separator: "\n\n")
        print(edgesDescription)
    }
}

extension AdjacencyMatrix: CustomStringConvertible {
    public var description: String {
        let verticesDescription = vertices.map { " \($0)" }
        // 2
        var grid: [String] = []
        for i in 0..<weights.count {
            var row = ""
            for j in 0..<weights.count {
                let value = weights[i][j]
                if value != 0.0 {
                    row += "\(value) \t"
                } else {
                    row += "ø  \t\t"
                }
            }
            grid.append(row)
        }

        let edgesDescription = grid.joined(separator: "\n\n")
        
        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
}
