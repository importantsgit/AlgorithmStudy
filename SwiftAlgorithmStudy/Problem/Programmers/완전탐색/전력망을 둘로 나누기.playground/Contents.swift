var n = 9
var wires = [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]

func leftDFS(start: Int, wires:[[Int]], cnt: Int)->Int{
    return wires.map{ item in leftDFS(start: item[0], wires: wires.filter{$0[1]==start}, cnt: cnt+1) }.max()!
}
func rightDFS(start: Int, wires:[[Int]], cnt: Int)->Int{
    return wires.map{ item in rightDFS(start: item[1], wires: wires.filter{$0[0]==start}, cnt: cnt+1) }.max()!
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    for i in 0..<wires.count {
        var minus = leftDFS(start: wires[i][0], wires: wires, cnt: 1) - rightDFS(start: wires[i][1], wires: wires, cnt: 1)
        var maxCount = max(max)
    }
    
    return -1
}
