// 삼각형 최대 경로

// 테스트 케이스
var tri = [[1,0,0,0],[1,1,0,0],[1,1,1,0],[1,1,1,1]]
var tri2 = [[9,0,0,0],[5,7,0,0],[1,3,2,0],[3,5,5,6]]


func getResult(_ arr:[[Int]]) {
    var DP = arr[arr.count-1]
    var DP2 = Array(repeating: 1, count: arr[arr.count-1].count)
    let arr:[[Int]] = arr
    for i in (0..<arr.count-1).reversed() { // tri기준 3->0
        for j in 0...i { // 0->3
            DP2[j] = DP[j] == DP[j+1] ? DP2[j] + DP2[j+1] : DP[j] > DP[j+1] ? DP2[j] : DP2[j+1]
            DP[j] = arr[i][j] + max(DP[j], DP[j+1])
        }
    }
    print(DP2[0])
}
getResult(tri) // tri 일 경우 -> 8


/* ----------------------------- */


var cache = [[Int]](repeating: [Int](repeating: -1, count: tri2.count), count: tri2.count)
var cache2 = [[Int]](repeating: [Int](repeating: 0, count: tri2.count), count: tri2.count)
cache2[tri2.count-1] = [Int](repeating: 1, count: tri2.count)
func getResult2(_ i:Int,_ j:Int)->Int{
    if i > cache.count-1 || j > cache.count-1 {return 0}
    if i == cache.count-1 {return tri2[i][j]}
    if cache[i][j] != -1  {return cache[i][j]}
    
    let a = getResult2(i+1,j)
    let b = getResult2(i+1,j+1)
    cache[i][j] = tri2[i][j] + max(a,b)
    
    cache2[i][j] = a == b ? cache2[i+1][j] + cache2[i+1][j+1] : a > b ? cache2[i+1][j] : cache2[i+1][j+1]

    return cache[i][j]
}

getResult2(0,0)
print(cache2[0][0]) // tri2 일 경우 -> 3
