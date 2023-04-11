/*
 파스칼의 삼각형
 16395
 */

func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
            let value = arr[i][j]
            if value != 1000000 {row += "\(value) \t"} else {row += "INF\t"}
        }
        grid.append(row)
    }
    let edgesDescription = grid.joined(separator: "\n\n")
    print(edgesDescription)
}

func pascal(arr:[Int]) {
    if arr[1] == 1 || arr[0] == 2 || arr[0] == arr[1] { print(1);return }
    var DP = Array(repeating: Array(repeating: 1, count: arr[0]), count: arr[0])
    for i in 1..<DP.count {
        for j in 1..<DP.count - i {
            DP[i][j] = DP[i-1][j] + DP[i][j-1]
            if  i == arr[0]-arr[1] && j == arr[1]-1 {print(DP[i][j]);return}
        }
    }
}

pascal(arr: readLine()!.split(separator: " ").map{Int(String($0))!})
