/*
 최대상승
 25644
 */
func maxUP(_ c:Int,_ arr: [Int]) {
    if c == 1 { print(0);return }
    var DP = Array(repeating: 0, count: c)
    var maxNums:[Int] = []
    for i in 1..<DP.count {DP[i]=(arr[i]-arr[i-1])+DP[i-1]}
    maxNums.append(DP.max()!)
    for i in 1..<DP.count-1 {
        let delete = DP[i]
        DP[i] = 0
        for j in i+1..<DP.count {DP[j] = DP[j] - delete}
        maxNums.append(DP.max()!)
    }
    let n = maxNums.max()!
    print(n<0 ?0:n)
}
//maxUP(Int(readLine()!)!, readLine()!.split(separator: " ").map{Int($0)!})
//maxUP([4, 2, 3, 1, 5], 5)

// 시간초과


func maxUP1(_ c:Int, _ arr: [Int]) {
    if c == 1 { print(0);return }
    var DP = Array(repeating: 0, count: c)
    for i in 1..<DP.count {DP[i]=(arr[i]-arr[i-1])+DP[i-1]}
    var maxNum = DP[1...].max()!, minNum = DP[1...].min()!
    print(DP)
    print(maxNum, minNum)
    var n = maxNum - minNum
    print(n<0 ?0:n)
}
maxUP1(Int(readLine()!)!, readLine()!.split(separator: " ").map{Int($0)!})
maxUP1(4, [7, 1, 2, 6])
