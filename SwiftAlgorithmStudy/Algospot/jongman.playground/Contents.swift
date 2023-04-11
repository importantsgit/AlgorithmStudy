/*
 LIS
 JLIS
 */

var n = 0

//var s = [1,4,2,3,5,9,19,2939,39,19,19]
var s = [5000,1,4,2,3,5,9,19,2939,39,19,19]
var cache = [Int](repeating: -1, count: s.count)

func list(_ start:Int)->Int {
    if cache[start] != -1 {return cache[start]}
    cache[start] = 1 // 최소 길이는 1임
    for next in (start+1)..<s.count { //next는 count-1까지만 들어올 수 있음
        print("s:\(start) n:\(next)")
        if s[start] < s[next]{
            cache[start] = max(cache[start], list(next)+1)
        }
    }
    return cache[start]
}
// 위 코드는 항상 시작 위치를 지정해야한다.
// S[start]에서 시작하는 증가 부분 수열 중 최대 길이를 반환하는 함수

list(0)
print(cache)

var cache1 = [Int](repeating: -1, count: s.count+1)
func listJ(_ start:Int)->Int {
    if cache1[start+1] != -1 {return cache1[start+1]}
    cache1[start+1] = 1
    for next in (start+1)..<s.count {
        print("s:\(start) n:\(next)")
        if start == -1 || s[start] < s[next]{
            cache1[start+1] = max(cache1[start+1], listJ(next)+1)
        }
    }
    
    
    return cache1[start+1]
}

listJ(-1)-1


// 위 코드는 -1 for문 첫 루프일 때, 모든 인덱스에서 계산을 하게 한 다음
// 나머지 루프에서 계산 시, 나머지 결과는 DP로 계산


var NEGINF = CLongLong.min

var Anums:[CLongLong] = [1,4,3,3,55,6,4,3,2,24,44,56]//[CLongLong](repeating: 0, count: 100)
var Bnums:[CLongLong] = [1,3,324,532,34,3,2,1,2,465,3653,1]//[CLongLong](repeating: 0, count: 100)
var cache2 = [[Int]](repeating: [Int](repeating: -1, count: 101), count: 101)

func jlis(_ indexA: Int,_ indexB: Int)-> Int {
    if cache2[indexA][indexB] != -1 {return cache2[indexA][indexB]}
    cache2[indexA][indexB] = 2
    var a = indexA == -1 ? NEGINF: Anums[indexA]
    var b = indexB == -1 ? NEGINF: Bnums[indexB]
    var maxElement = max(a,b)
    
    for nextA in indexA+1..<Anums.count {
        if maxElement < Anums[nextA] {
            cache2[indexA][indexB] = max(cache2[indexA][indexB], jlis(nextA, indexB)+1)
        }
    }
    for nextB in indexB+1..<Bnums.count {
        if maxElement < Bnums[nextB] {
            cache2[indexA][indexB] = max(cache2[indexA][indexB], jlis(indexA, nextB)+1)
        }
    }
    return cache2[indexA][indexB]
}

jlis(-1, -1) - 2
