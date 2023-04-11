/*
 1로 만들기
 1463
 */

func f(_ n:Int){
    if n <= 3 {print(n==1 ? 0:1);return}
    var DP=[Int](repeating:0,count:1000001)
    DP[1]=0;DP[2]=1;DP[3]=1
    for i in 4...n{DP[i]=1+DP[i-1];if i%2==0{DP[i]=min(DP[i],DP[i/2]+1)};if i%3==0{DP[i]=min(DP[i],DP[i/3]+1)}}
    print(DP[n])
}

f(Int(readLine()!)!)

var n = Int(readLine()!)!
var cache = [Int](repeating: -1, count: n+1)
func f1(_ n:Int)->Int{
    if cache[n] != -1{return cache[n]}
    if n<2{return 0}
    cache[n] = f1(n-1)+1
    if n%2==0{cache[n]=min(cache[n],f1(n/2)+1)}
    if n%3==0{cache[n]=min(cache[n],f1(n/3)+1)}
    return cache[n]
}
print(f1(n))

