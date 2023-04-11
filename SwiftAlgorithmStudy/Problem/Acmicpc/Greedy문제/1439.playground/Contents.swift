/*
 뒤집기
 1439
 */

var str = readLine()!
var cnt1 = str.split(separator: "1").count
var cnt0 = str.split(separator: "0").count

//MARK: - 결과 출력
// 작은 값, 큰 값을 min, max로 만들 수 있다.

print(cnt0 >= cnt1 ? cnt1 : cnt0)

print(min(str.split(separator: "1").count, str.split(separator: "0").count))
