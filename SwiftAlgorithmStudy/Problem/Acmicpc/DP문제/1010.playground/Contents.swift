/*
 다리 놓기
 1010
 */


var DP:[[Int]] = []
func initDP(){
    DP = [[Int]](repeating: [Int](repeating: 0, count: 30), count: 30)
    DP[1] = Array(stride(from: 0, through: 30, by: 1))
    for i in 0...29 {DP[i][i] = 1}
}
func buildingSite(_ NM:[Int])->Int {
    if NM[0] == 1 { return DP[1][NM[1]] }
    if NM[0] == NM[1] { return 1 }
    for N in 2...NM[0] { for M in N+1...NM[1] { if DP[N][M] == 0 {DP[N][M] = DP[N-1][M-1] + DP[N][M-1]} } }
    return DP[NM[0]][NM[1]]
}
initDP()
for _ in 0..<Int(String(readLine()!))! {
    print(buildingSite(readLine()!.split(separator: " ").map{Int(String($0))!}))
}

