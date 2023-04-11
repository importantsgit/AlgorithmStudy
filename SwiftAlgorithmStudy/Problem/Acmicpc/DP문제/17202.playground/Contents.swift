/*
 핸드폰 번호 궁합
 17202
 */
func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
            let value = arr[i][j]
            if value != 1000000 {row += "\(value) \t"} else {row += "INF\t"}
        }
        grid.append(row)
    }

    let edgesDescription = grid.joined(separator: "\n\n")
    print(edgesDescription)
}

func compatibility(a: String, b: String) {
    var a = a.map{Int(String($0))!}, b = b.map{Int(String($0))!}
    var DP:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 16), count: 15)
    var idx = 0
    for i in 0..<16 { if i%2 == 0 { DP[0][i] = a[idx] } else { DP[0][i] = b[idx]; idx+=1 } }
    for i in 1..<15 {
        for j in 0..<16-i {
            DP[i][j] = (DP[i-1][j] + DP[i-1][j+1])%10
        }
    }
    var result = DP.last![0] != 0 ? String(DP.last![0]*10 + DP.last![1]) : "0\(DP.last![1])"
    print(result)
}
compatibility(a: "01234567", b: "12345678")



// 만약 핸드폰 번호가 그냥 주어진다면
var a =  Array("010-1231-01010".filter({$0 != "-"}).map{Int(String($0))!}[3...]), b = Array("010-1231-01010".filter({$0 != "-"}).map{Int(String($0))!}[3...])

// 숏코딩
// 어차피 DP[i]은 다음 계산때 사용하지 않음
func compatibility1(_ a: String,_ b: String) {
    var a=a.map{Int(String($0))!},b=b.map{Int(String($0))!},DP=[Int]()
    for i in 0..<8{DP.append(a[i]);DP.append(b[i])}
    for i in (3...16).reversed(){for j in 0..<i-1{DP[j]=(DP[j]+DP[j+1])%10}}
    print(String(DP[0])+String(DP[1]))
}
compatibility1(readLine()!,readLine()!)

compatibility1("01234567","12345678")


// 최대한 줄인 코드
var c=readLine()!.map{Int(String($0))!},d=readLine()!.map{Int(String($0))!},DP=[Int]()
for i in 0..<8{DP.append(c[i]);DP.append(d[i])}
for i in (3...16).reversed(){for j in 0..<i-1{DP[j]=(DP[j]+DP[j+1])%10}}
print(String(DP[0])+String(DP[1]))
