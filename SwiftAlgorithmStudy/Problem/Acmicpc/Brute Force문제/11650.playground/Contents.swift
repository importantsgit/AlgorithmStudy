/*
 자동정렬하기
 11650
 */

var a = [[Int]]()
for _ in 0..<Int(readLine()!)! {
    a.append(readLine()!.split(separator:" ").map{Int($0)!})
}

//중요
a=a.sorted(by:{($0[0],$0[1]) < ($1[0],$1[1])})

a=a.sorted(by:{$0[0]==$1[0] ? $0[1]<$1[1] : $0[0]<$1[0]})


for i in a {
    print(i[0],i[1])
}
