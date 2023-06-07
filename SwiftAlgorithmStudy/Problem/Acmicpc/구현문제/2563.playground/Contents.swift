let n=Int(readLine()!)!
var arr=[[Int]]()
for _ in 0..<n{
    arr.append(readLine()!.split(separator: " ").map{Int($0)!})
}

// 간단하게 생각하기

var paper = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 101)

for point in arr {
    for y in point[1]..<point[1]+10 {
        for x in point[0]..<point[0]+10 {
            paper[x][y] = 1
        }
    }
}
print(paper.reduce(0, {$0+$1.filter{$0==1}.count}))


// set을 이용하기

var paper2:Set<[Int]> = []
for _ in 0..<Int(readLine()!)! {
    var a = readLine()!.split(separator: " ").map{Int($0)!}
    for y in a[1]..<a[1]+10 {
        for x in a[0]..<a[0]+10 {
            paper2.insert([x,y])
        }
    }
}
print(paper2.count)
