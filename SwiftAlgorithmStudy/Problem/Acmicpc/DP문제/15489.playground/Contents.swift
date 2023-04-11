/*
 파스칼 삼각형
 15489
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

func pa(_ arr:[Int]){
    var DP=[[Int]](repeating: [Int](repeating:0,count:arr[0]+arr[2]),count:arr[0]+arr[2]);DP[1][1]=1
    for i in 2..<arr[0]+arr[2]{for j in 1...i{DP[i][j]=DP[i-1][j]+DP[i-1][j-1]}}
    var result=0
    for i in 0..<arr[2]{for j in 0...i{result+=DP[i+arr[0]][j+arr[1]]}}
    print(result)
}
pa(readLine()!.split(separator:" ").map{Int($0)!})

