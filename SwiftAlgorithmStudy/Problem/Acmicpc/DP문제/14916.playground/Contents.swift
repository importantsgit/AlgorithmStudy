func exchange(_ n: Int)->Int {
    var DP = Array(repeating: 0, count: 100001)
    DP[5] = 1;DP[4] = 2;DP[2] = 1
    if n < 6 {
        return DP[n] != 0 ? DP[n] : -1
    }
    for i in 6...n {
        if DP[i-2] != 0 { DP[i] = DP[i-2]+1 }
        if DP[i-5] != 0 { DP[i] = DP[i] != 0 ? min(DP[i], DP[i-5]+1) : DP[i-5]+1 }
    }
    return DP[n] != 0 ? DP[n] : -1
}

print(exchange(Int(readLine()!)!))
