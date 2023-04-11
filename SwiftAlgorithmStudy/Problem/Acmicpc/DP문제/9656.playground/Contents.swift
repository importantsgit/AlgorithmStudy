/*
 돌 게임2
 9656
 */

func stoneGame(_ n:Int) {
    if n < 4 {print(n.isMultiple(of: 2) ?"SK":"CY");return}
    var DP = Array(repeating: "", count: n+1)
    DP[1] = "CY"
    DP[2] = "SK"
    DP[3] = "CY"
    if n<4 { print(DP[n]);return }
    for i in 4...n {
        DP[i] = DP[i-1] == "CY" ? "SK" : "CY"
        DP[i] = DP[i-3] == "CY" ? "SK" : "CY"
    }
    print(DP[n])
}
stoneGame(Int(readLine()!)!)

func gs(_ n:Int) {
    print(n.isMultiple(of: 2) ?"SK":"CY")
}

print(Int(readLine()!)!.isMultiple(of: 2) ?"SK":"CY")
