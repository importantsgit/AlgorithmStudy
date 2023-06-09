/*
 2740
 행렬 곱셈
 */

var NMArr = [[Int]](), MKArr = [[Int]]()

var NM = readLine()!.split(separator: " ").map{ Int($0)! }
for _ in 0..<NM[0] {
    NMArr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var MK = readLine()!.split(separator: " ").map{ Int($0)! }
for _ in 0..<MK[0] {
    MKArr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var result = Array(repeating: Array(repeating: 0, count: MK[0]), count: NM[0])
for i in 0..<NM[0] {
    for j in 0..<MK[1] {
        for k in 0..<NM[1] {
            result[i][j] += NMArr[i][k]*MKArr[k][j]
        }
    }
}

result.forEach{
    print($0.map{String($0)}.joined(separator: " "))
}
