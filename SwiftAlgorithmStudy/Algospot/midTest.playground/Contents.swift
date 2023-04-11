// 와일드 카드

var strs = ["he?p", "help"]
var dp = [[Int]](repeating: [Int](repeating: -1, count: strs[1].count+1), count: strs[0].count+1)

extension String {
    func findTo(i:Int)->String {
        if i<0 || self.count<self.count {return ""}
        var idx = index(self.startIndex, offsetBy: i)
        return String(self[idx])
    }
}

func wildCard(_ strs:[String],_ w:Int,_ s:Int)-> Bool {
    var w=w,s=s
    if dp[w][s] != -1 {return dp[w][s] == 1}
    while w < strs[0].count && s < strs[1].count && (strs[0].findTo(i: w)=="?"||strs[0].findTo(i: w) == strs[1].findTo(i: s))
    {w+=1;s+=1}
    
    if w == strs[0].count {
        dp[w][s] = s == strs[1].count ?1:0
        return s == strs[1].count
    }
    if strs[0].findTo(i: w) == "*" {
        for i in 0...strs[1].count-s {
            if wildCard(strs, w+1, s+i){
                dp[w][s] = 1
                return true
            }
        }
    }
    dp[w][s] = 0
    return false
}

// print(wildCard(strs, 0, 0))



// 원주율 외우기


var DP = [[Int]](repeating: [Int](repeating: -1, count: 100000), count: 10)

func getLevel(_ arr: [Int])->Int {
    if !arr.contains(where: {$0 != arr[0]}) {return 1}
    var gaps:[Int] = []
    for i in 1..<arr.count {
        gaps.append(arr[i]-arr[i-1])
    }
    if !gaps.contains(where: {$0 != gaps[0]}) {
        if gaps[0] == 1 || gaps[0] == -1 {
            return 2
        }
        return 5
    }
    var idx = 0
    repeat {
         if arr[idx] != arr[idx+2] {break}
        idx += 1
    } while idx < arr.count-2
    if idx == arr.count-2 {return 4}

    return 10
}

func memo(_ arr:[Int],_ pos:Int,_ parts:Int)->Int {
    if pos == arr.count {return 0}
    if parts == 0 {return 987654321}
    if DP[parts][pos] != -1 {return DP[parts][pos]}
    DP[parts][pos] = 987654321
    for i in 3...5 {
        if i + pos <= arr.count {
            DP[parts][pos] = min(DP[parts][pos], memo(arr, pos+i, parts-1)+getLevel(Array(arr[pos..<(pos+i)])))
        }
    }
    
    return DP[parts][pos]
}

// print(memo([1,1,1,1,1,2,2,2], 0, 2))


// 삼각형 최대 경로
var tri = [[6,0,0,0,0],[1,2,0,0,0],[3,7,4,0,0],[9,4,1,7,0],[2,7,5,9,4]]
var tri2 = [[1,0,0,0,0],[2,4,0,0,0],[8,16,8,0,0],[32,64,32,64,0],[128,256,128,256,128]]

func getResult(_ arr:[[Int]]) {
    var DP = arr[arr.count-1]
    var arr:[[Int]] = arr
    for i in (0..<arr.count-1).reversed() { // tri기준 3->0
        for j in 0...i { // 0->3
            DP[j] = arr[i][j] + max(DP[j],DP[j+1])
        }
    }
    print(DP[0])
}

var cache = [[Int]](repeating: [Int](repeating: -1, count: tri2.count), count: tri2.count)
func getResult2(_ i:Int,_ j:Int)->Int{
    if i > cache.count-1 || j > cache.count-1 {return 0}
    if cache[i][j] != -1 {return cache[i][j]}
    cache[i][j] = tri2[i][j] + max(getResult2(i+1,j), getResult2(i+1,j+1))
    return cache[i][j]
}
//getResult(tri) // 28
//getResult(tri2) // 341


getResult2(0, 0)
print(cache)
