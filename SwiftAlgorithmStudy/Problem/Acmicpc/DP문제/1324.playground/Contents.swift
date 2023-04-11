/*
 젠장
 1324
 */
func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
            let value = arr[i][j]
            if value != 1000000 {
                row += "\(value) \t"
            } else {
                row += "INF\t"
            }
        }
        grid.append(row)
    }

    let edgesDescription = grid.joined(separator: "\n\n")
    print(edgesDescription)
}

//var arr:[[Int]] = [[1,3],[2,3]]

//DP 알고리즘

var C = Int(String(readLine()!))!
var arr:[[Int]] = []
for _ in 0..<C {
    arr.append([Int(String(readLine()!))!,Int(String(readLine()!))!])
}

func Chairman(_ arr:[Int])->Int {
    var DP: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 15), count: 15)
    
    for n in 0...arr[0] {
        for k in 1...arr[1] {
            DP[n][k] = n == 0 ?  k + DP[n][k-1] : DP[n][k-1] + DP[n-1][k]
        }
    }
    return DP[arr[0]-1][arr[1]]
}

for xy in arr {
    print(Chairman(xy))
}


