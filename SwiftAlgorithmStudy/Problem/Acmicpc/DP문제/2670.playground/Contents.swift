/*
 연속부분최대곱
 2670
 */

import Foundation
func multiple(_ n:Int,_ arr:[Double] ){
    if n == 1 { print(arr.first!);return }
    var arr=arr // 자기 자신으로 초기화 해야됨
    for i in 1..<n {
        arr[i] = max(arr[i-1]*arr[i],arr[i])
    }
    print(String(format: "%.3f", arr.max()!))
}
var n = Int(readLine()!)!
var arr:[Double] = []
for _ in 0..<n {
    arr.append(Double(readLine()!)!)
}
multiple(n, arr)

// 3째자리에서 반올림
print(round(arr.max()!*1000)/1000)

// 2째자리까지 자르기
print(String(format: "%.3f", arr.max()!))
