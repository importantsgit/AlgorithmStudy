/*
 1475
 방 번호
 */
import Foundation
var a = readLine()!.map{Int(String($0))!}
var count = 0
var b = [Double](repeating: 0.0, count: 10)
for i in a {b[i] += 1.0}
b[6] = round((b[6]+b.removeLast())/2.0)
print(Int(b.max()!))

// 6과 9의 평균을 반올림하기
// 왜냐면 6과 9는 동시에 사용 가능하기 때문
// 6699 -> 2
// 9996 -> 3+1/2 = 2
// 9999 -> 4/2 = 2
// 99966 -> 5/2 = 2.5 반올림 3
// 반올림 round


