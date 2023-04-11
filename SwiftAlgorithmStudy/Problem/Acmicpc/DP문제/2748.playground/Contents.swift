/*
피보나치 수 2
2748
*/



func fibonacci(_ n: Int) {
    var DP = Array(repeating: 0, count: 91)
    DP[0] = 0
    DP[1] = 1
    if n>1 {
        for i in 2...n {
            DP[i] = DP[i-1] + DP[i-2]
        }
    }
    print(DP[n])
}

func fibonacci2(_ n: Int) {
    var DP = [0,1]
    if n>1 {
        for _ in 2...n {
            DP = [DP[1], DP[0]+DP[1]]
        }
    }
    print(DP[1])
}

fibonacci(Int(readLine()!)!)
fibonacci2(Int(readLine()!)!)

