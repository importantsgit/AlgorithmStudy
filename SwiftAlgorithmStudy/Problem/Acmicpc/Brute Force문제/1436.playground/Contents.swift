/*
 1436
 영화감독 숌
 */

var n = Int(readLine()!)!
var count = 0
var title = 666
var compare = 0
while true {
    compare = title
    while compare != 0 {
        if compare%1000==666{count+=1;break}
        compare=compare/10
    }
    if n == count {break}
    title += 1
}
print(title)

// 그냥 1씩 더해서 666이 나올때 카운트 1씩 올리기

