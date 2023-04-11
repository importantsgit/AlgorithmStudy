var n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 5001)
dp.count

// 3kg와 5kg를 만드는 가장 최소의 봉지 수는 1
// 따라서 dp[3]과 dp[5]는 무조건 1
dp[3] = 1
dp[5] = 1

// 3과 5 다음인 6부터 for loop 순회
if n > 5 {
    for i in 6...n {
        if dp[i - 3] != 0 {
            dp[i] = dp[i - 3] + 1
        }
        
        // 이미 dp[i-3]에 값이 존재할 때, dp[i]가 업데이트 됐을 수 있다.
        // 만약 dp[i]에 값이 없다면 dp[i] = dp[i - 5] + 1로 업데이트
        if dp[i - 5] != 0 {
            dp[i] = dp[i] != 0 ? min(dp[i], dp[i - 5] + 1) : dp[i - 5] + 1
        }
    }
}
print(dp[n] == 0 ? -1 : dp[n])
