/*
 피자
 14606
 */
var DP = Array(repeating: 0, count: 11)
var result = 0

func r(_ n:Int)->Int{
    if n==2 {
        result += 1
        return 2
    }
    if n==1 {return 1}
    if n.isMultiple(of: 2) {
        result += r(n/2)*r(n/2)
        return n
    } else {
        result += r(n/2)*r(n-(n/2))
        return n
    }
}

//r(Int(readLine()!)!)
//print(result)


// 다시 DP를 사용하자

func pizza(_ n:Int){
    var DP=[0,1]
    if n==1{print(0);return};if n==2{print(1);return}
    for i in 3...n{DP=[DP[1],DP[1]+(i-1)]}
    print(DP[1])
}
pizza(Int(readLine()!)!)

