/*
 피보나치 비스무리한 수열
 14495
 */

// 1.재귀함수 쓰는 방법
// topDown 방식
var DP = [UInt](repeating: 0, count: 117)
func recursion(_ n:Int)->UInt {
    if n<4 {return 1}
    if DP[n] != 0 {return DP[n]}
    DP[n] = recursion(n-1) + recursion(n-3)
    return DP[n]
}
print(recursion(Int(readLine()!)!))

// 2. bottomUP 방식
func fibo(_ n: Int)->UInt {
    if n<4 {return 1}
    var DP = [UInt](repeating: 1, count: n+1)
    for i in 4...n {
        DP[i] = DP[i-1] + DP[i-3]
    }
    return DP[n]
}
print(fibo(Int(readLine()!)!))


func f(_ n:Int)->UInt{
    if n<4{return 1}
    var DP=[UInt](repeating:1,count:n+1)
    for i in 4...n{DP[i]=DP[i-1]+DP[i-3]}
    return DP[n]
}
print(f(Int(readLine()!)!))
