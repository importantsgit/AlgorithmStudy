var input = 4

var cache = [[Int]](repeating: [Int](repeating: -1, count: input+1), count: input+1)

func plo(maxN: Int, n: Int)->Int{
    // 같다면 더 이상 쌓을 수 없음 -> 1
    if n == maxN {return 1}
    if cache[maxN][n] != -1 {return cache[maxN][n]}
    cache[maxN][n] = 0
    for cnt in 1...maxN-n {
        // 두번째 줄이 자리 잡을 수 있는 범위 (첫번째줄+두번째줄-1)
        cache[maxN][n] += (n+cnt-1)*plo(maxN: maxN-n, n: cnt) % 10000000
    }
    return cache[maxN][n]
}

var sum = 0
for i in 1...input {
    // 첫번째 줄 배치 (1~4)
    sum += plo(maxN: input, n: i)
}

print(sum)
