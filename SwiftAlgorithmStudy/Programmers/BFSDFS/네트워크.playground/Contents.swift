var n = 3
var computers = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]


func DFS(computers: [[Int]], start:Int, visited:inout [Bool]){
    print(start)
    var computer = computers[start]
    visited[start] = true
    
    for i in 1...computer.count {
        if !visited[i] && computer[i-1] == 1 {
            DFS(computers: computers, start: i, visited: &visited)
        }
    }
    
}


func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var computers = computers
    var result = 0
    computers.insert([], at: 0)
    var visited = [Bool](repeating: false, count: computers.count+1)
    
    for i in 1..<computers.count {
        if !visited[i] {
            DFS(computers: computers, start: i, visited: &visited)
            result += 1
        }
    }
    
    return result
}

solution(n, computers)
