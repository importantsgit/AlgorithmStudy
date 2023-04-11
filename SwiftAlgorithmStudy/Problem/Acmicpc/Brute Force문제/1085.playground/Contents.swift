/*
 직사각형에서 탈출
 1085
 
 단어정렬
 1181
 
 팰린드롬수
 1259
 */

var a=readLine()!.split(separator:" ").map{Int($0)!}
print(min(a[0],a[1],a[3]-a[1],a[2]-a[0]))

var str = [
    "but",
    "i",
    "wont",
    "hesitate",
    "no",
    "more",
    "no",
    "more",
    "it",
    "cannot",
    "wait",
    "im",
    "yours",
]

var i=13, b:Set<String>=[]//i=Int(readLine()!)!,b:[String]=[]
for j in 0..<i {
    //b.append(readLine()!)
    b.insert(str[j])
}
print(b)
var c:[String]=b.sorted().sorted(by:{
    return $0.count<$1.count
})

print(c)


var d:Set<String>=[]
for _ in 0..<Int(readLine()!)! {d.insert(readLine()!)}
d.sorted().sorted(by:{$0.count<$1.count}).forEach{print($0)}
// 먼저 아스키코드 순 정렬 시킨 뒤, 다시 sorted(count)로 돌리기


while let c=readLine(),c != "0"{print(c==String(c.reversed()) ?"yes":"no")}

var n:[Int] = []
func a(_ n:[Int]){var c=n.count;for i in 0..<c/2{if n[i] != n[c-i-1]{print("no");return}};print("yes")}
n=readLine()!.map{Int(String($0))!}
repeat{a(n);n=readLine()!.map{Int(String($0))!}
}while n != [0]

// 문자열 대칭인것은 reverse와 비교하면 쉽다
