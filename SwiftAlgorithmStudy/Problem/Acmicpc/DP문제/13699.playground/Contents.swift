/*
 점화식
 13699
 */

func recurrenceRelation(_ n:Int)->UInt {
    if n<2 {return 1}
    var DP=[UInt](repeating: 0, count: n+1)
    DP[0]=1; DP[1]=1
    for i in 2...n {
        for j in 0..<i {
            var l = (i - 1) - j
            DP[i] += DP[l]*DP[j]
        }
    }
    return DP[n]
}
print(recurrenceRelation(Int(readLine()!)!))

// 숏코딩
func f(_ n:Int)->UInt{
    if n<2{return 1}
    var DP=[UInt](repeating:0,count: n+1)
    DP[0]=1;DP[1]=1
    for i in 2...n{for j in 0..<i{var l=(i-1)-j;DP[i]+=DP[l]*DP[j]}}
    return DP[n]
}
print(f(Int(readLine()!)!))


