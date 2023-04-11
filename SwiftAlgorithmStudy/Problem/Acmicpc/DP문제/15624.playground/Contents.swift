/*
 피보나치 수
 15642
 */

func f1(_ n:Int)->UInt{
    if n == 0 {return 0}
    if n<3{return 1}
    var DP=[UInt](repeating:1,count:n+1)
    for i in 3...n{DP[i]=(DP[i-1]+DP[i-2])%1000000007}
    return DP[n]
}
//print(f1(Int(readLine()!)!))

//---

func f(_ n:Int)->UInt{
    if n==0 {return 0}
    var DP:[UInt]=[0,1]
    for _ in 0..<n-1{DP=[DP[1],(DP[0]+DP[1])%1000000007]}
    return DP[1]
}
print(f(Int(readLine()!)!))
print(f(1))
