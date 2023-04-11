/*
 돌 게임
 9655
-------
 BABBA
 9625
 */

func stoneGame(_ n: Int) {
    var DP = Array(repeating: 0, count: n+1)
    DP[1] = 1
    DP[2] = 2
    for i in 3...n { DP[i] = min(DP[i-1]+1, DP[i-3]+1) }
    print(DP)
}

// stoneGame(10)

//print(Int(String(readLine()!))!%2 == 0 ? "CY" : "SK")


//---------------

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


func BABBA(_ n: Int)->String {
    if n == 1 { return "0 1" }
    var DP = Array(repeating: [0,0], count: n+1)
    DP[0] = [1,0]
    DP[1] = [0,1]
    for i in 2...n {for j in 0...1 {DP[i][j] = DP[i-2][j] + DP[i-1][j]}}
    printArray(arr: DP)
    return "\(DP.last![0]) \(DP.last![1])"
}

//print(BABBA(Int(readLine()!)!))

//var arr = [1,2,4,3,5,6,7,8]
//var b = true
//repeat {
//    for i in 1..<arr.count {
//        if abs(arr[i]-arr[i-1]) != 1 {
//            print("mixed"); b = false
//            break
//        }
//    }
//    if b {print(arr.first! > arr.last! ? "descending":"ascending")}
//    break
//} while true

//14337275
//var a=readLine()!.split(separator:" ")
//print(a==a.sorted() ?"ascending":a==a.sorted(by:>) ?"descending":"mixed")

print(readLine()!.split{$0==" "}.map{Int($0)!*Int($0)!}.reduce(0,+)%10)

