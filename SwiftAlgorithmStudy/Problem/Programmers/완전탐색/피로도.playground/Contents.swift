var k = 80
var dungeons = [[20,20],[20,20],[20,20],[20,20],[20,20]]
//var dungeons = [[80,20],[50,40],[30,10]]

var count = 0

func DFS(_ k: Int,_ start: Int,_ visited:[Bool],_ dungeons: inout [[Int]],_ cnt: Int) -> Int {
    var start = start, visited = visited
    visited[start] = true
    var cnt = cnt + 1
    var maxNum = cnt
    
    
    for (i, dungeon) in dungeons.enumerated() {
        var k = k
        if !visited[i] && k >= dungeon[0] {
            maxNum = max(maxNum, DFS(k - dungeon[1], i, visited, &dungeons, cnt))
        }
    }
    return maxNum
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var dungeons = dungeons
    var visited = [Bool](repeating: false, count: dungeons.count)
    var maxNum = 0
    // 처음 함수에 집어넣을 때 조건 생각하기
    for (idx, dungeon) in dungeons.enumerated() {
        maxNum = max(maxNum, DFS(k-dungeon[1], idx, visited, &dungeons, 0))
    }
    return maxNum
}

solution(k, dungeons)


// 이런 것도 생각하기
private func explore(_ k: Int, _ dungeons: [[Int]], _ depth: Int) -> Int {
    return dungeons.map { dungeon in
        // 이 방법은 DFS에 어울리는 방법이다.
        k >= dungeon[0] ? explore(k - dungeon[1], dungeons.filter { elem in dungeon != elem }, depth + 1) : depth
    }.max() ?? depth
}
