/*
 알고리즘 수업 - 피보나치 수 2
 24417
 */

var r:UInt = 0

func fi(_ n:Int)->UInt {
    var DP:[UInt] = [1,1]
    for _ in 3...n {
        DP = [DP[1],(DP[0]+DP[1])%1000000007]
        r += 1
    }
    return DP[1]
}
var n=2000000//Int(readLine()!)!
print(fi(n),r)
