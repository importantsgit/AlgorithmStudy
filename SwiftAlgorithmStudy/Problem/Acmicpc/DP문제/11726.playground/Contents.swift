/*
 2Xn 타일링
 11726
 */

var n = Int(String(readLine()!))!
func tiling(n: Int) {
    var tile: [Int] = [Int](repeating: 0, count: 1001) // 그냥 숫자를 집어넣는게 n을 집어넣는것보다 빠름
    tile[1] = 1
    tile[2] = 2
    if n>2 {
        for i in 3...n { tile[i] = (tile[i-1] + tile[i-2]) % 10007 }
    }
    print(tile[n])
}

tiling(n: n)

var C = Int(readLine()!)!
var tiles: [Int] = Array(repeating: 0, count: 1001)

tiles[1] = 1
tiles[2] = 2
if C>2 {
    for i in 3...n { tiles[i] = (tiles[i-1] + tiles[i-2]) % 10007 }
}
print(tiles[C])


//인터넷 풀이
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)

func solution(_ n: Int) -> Int {
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    if dp[n] > 0 { return dp[n] } // 중복을 피하기 위함
    dp[n] = (solution(n-2) + solution(n-1)) % 10007
    return dp[n]
}

print(solution(N))

// 숏코딩 -> 아이디어 그냥 공간 2개만 만들기 -> 피보나치도 이렇게 사용 가능할지도 모름
var f = [1,1]
for _ in 1..<Int(readLine()!)! {
    f = [f[1], (f[0]+f[1]) % 10007]
}

print(f[1])
