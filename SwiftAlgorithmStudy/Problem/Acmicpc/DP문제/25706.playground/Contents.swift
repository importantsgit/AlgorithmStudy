/*
 자전거 묘기
 25706
 */


func jump(_ n: Int,_ jumps:[Int]) {
    var jumps = jumps
    var DP:[Int] = Array(repeating: 0, count: n)
    DP[n-1] = 1
    for i in (0..<n-1).reversed() {
        if jumps[i] != 0 {
            DP[i] = i+jumps[i]+1 > n-1 ? 1:1+DP[i+jumps[i]+1]
        } else {
            DP[i] = DP[i+1] + 1
        }
    }
    print(DP.map{String($0)}.joined(separator: " "))
}

jump(Int(readLine()!)!, readLine()!.split(separator: " ").map{Int($0)!})



var n=Int(readLine()!)!
var jumps=readLine()!.split(separator:" ").map{Int($0)!}
var DP:[Int]=Array(repeating:0,count:n)
DP[n-1]=1
for i in (0..<n-1).reversed() {if jumps[i] != 0{DP[i]=i+jumps[i]+1>n-1 ?1:1+DP[i+jumps[i]+1]}else{DP[i]=DP[i+1]+1}}
print(DP.map{String($0)}.joined(separator:" "))
