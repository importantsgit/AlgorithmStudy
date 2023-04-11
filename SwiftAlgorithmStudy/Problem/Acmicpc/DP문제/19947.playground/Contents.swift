/*
 투자의 귀재 배주형
 19947
 */
// import Foundation

func investKing(_ H: Int ,_ Y: Int) -> Int {
    var DP = Array(repeating: 0, count: 6)
    var invest = [5, 20, 35]
    DP[0] = 5
    for i in 1..<DP.count {
        DP[i] = DP[i-1] + invest[0]
        if i == 3 {DP[3] = max(DP[3],invest[1])}
        if i == 5 {DP[5] = max(DP[5],invest[2])}
    }
    print(DP)
    if Y < 7 { return Int(DP[Y]*H+H) }
    DP += Array(repeating: 0, count: Y-5)
    for i in 6..<DP.count {
        var idx = 0
        for item in [1,3,5] {
            print(DP[i-item]+invest[idx])
            DP[i] = max((DP[i-item]+invest[idx]),DP[i])
            idx += 1
        }
    }
    print(DP[Y]*H/100)
    print(H)
    return DP[Y]*H/100+H
}
// 년도가 바뀌면 금액도 바뀜 (같이 증가함) 윗 풀이는 금액이 고정시

//investKing(25542,10)

func investKing2(_ arr:[Int]){
    var DP=Array(repeating:0,count:arr[1]+1)
    DP[0]=arr[0]
    for i in 1..<DP.count{
        if i > 4{DP[i]=max(DP[i-1]*5/100+DP[i-1],DP[i-3]*20/100+DP[i-3],DP[i-5]*35/100+DP[i-5]);continue}
        if i > 2{DP[i]=max(DP[i-1]*5/100+DP[i-1],DP[i-3]*20/100+DP[i-3]);continue}
        DP[i] = DP[i-1]*5/100 + DP[i-1]
    }
    print(DP[arr[1]])
}
//investKing2(readLine()!.split(separator:" ").map{Int($0)!})


func investKing3(_ arr:[Int]){
    var DP=Array(repeating:0,count:arr[1]+1)
    DP[0]=arr[0]
    for i in 1..<DP.count{
        if i > 4{DP[i]=max(DP[i-1]*105/100,DP[i-3]*120/100,DP[i-5]*135/100);continue}
        if i > 2{DP[i]=max(DP[i-1]*105/100,DP[i-3]*120/100);continue}
        DP[i] = DP[i-1]*105/100
    }
    print(DP[arr[1]])
}

investKing3(readLine()!.split(separator:" ").map{Int($0)!})


// 1.05 1.2 1.35를 곱하면 이자 + 원금됨
