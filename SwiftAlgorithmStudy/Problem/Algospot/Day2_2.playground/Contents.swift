// 그리디로 푼다면
// - max(제일 작은 hegiht부터 사각형 값을 구해서 같은 height인 사각형 넓이와 비교)
// - 그 후 다음 height로부터 사각형 값을 구하고 max에 저장된 값과 비교 후 max 업데이트
// 좋은 풀이는 아닌 것 같음

// 분할정복
// 1. 기저사례로 가장 작은 사각형 ( 너비 1인 판자 ) 의 넓이 return
// 2. return 된 결과를
// - 1) 먼저 왼쪽 부분 큰 사각형이랑 오른쪽 부분 큰 사각형 비교 후 ret에 저장
// - 2) 중간에 걸쳐있는 사각형의 너비를 계산 후 ret와 비교하여 큰 값을 ret에 저장
// - 3) 이 과정 반복

var arr:[Int] = []

func makeRec(left: Int, right: Int) -> Int {
    // 원자값일 때 그 값을 그냥 return -> 기저사례
    if left == right { return arr[left] }
    
    // 중간값 계산(분할부분) -> 이 부분이 분할정복에서 중요한 역할
    var mid = (left + right) / 2
    // 왼쪽과 오른쪽에서 나온 큰 결과값 중 제일 큰 것을 ret에 집어넣기 -> 여기서 분할되어 정복된 값을 return
    var ret = max(makeRec(left: left, right: mid), makeRec(left: mid + 1, right: right))
    
    // 중간에 걸쳐있는 사각형이 클 수 있으니 계산
    // 왼쪽으로 -할 값
    var low = mid
    // 오른쪽으로 +할 값
    var high = mid + 1
    
    var height = min(arr[low], arr[high])
    ret = max(ret, height*2)
    
    // 만약 low값과 high 값이 범위 안에 있다면 ( left < N < right 값 모두 덮을 때까지 ret 업데이트
    // < 인 이유는 high값이 +1 / low값이 -1 -> 경계까지 걸치게 됨
    while left < low || high < right {
        // 먼저 left로 진행될 수 있게
        // arr[low - 1] < arr[high + 1] 이 조건을 안 걸어 준다면, 계속 왼쪽으로 진행되면서 height값이 왼쪽 최소 height값으로 갱신
        // 왼쪽으로 진행이 끝나면 왼쪽 최소 hegiht값이 오른쪽 최소 height값보다 작다면 오른쪽으로 진행해도 갱신이 안됨
        // 왼쪽 최소 = 1이라면 계속 hegiht값이 1임 -> 오른쪽 최소가 3이라도 진행이 안됨
        // 그러면 ret가 갱신 안되서 틀린 값이 return 됨
        // low <= left 만약 low가 left에 걸치게 되면 True임으로 high값만 올라감
        if high < right && ( low <= left || arr[low - 1] < arr[high + 1] ) {
            high+=1
            height = min(height,arr[high])
        } else {
            low-=1
            height = min(height,arr[low])
        }
        // 계속 업데이트 되는 hegiht 값을 계산 후 ret와 비교
        ret = max(ret, height*(high-low+1))
    }
    return ret
}

//arr = [7,1,5,9,6,7,3]
//print(makeRec(left: 0, right: arr.count - 1))
//
//arr = [1,4,4,10000,4,1,1]
//print(makeRec(left: 0, right: arr.count - 1))

//MARK: - 중간고사

func Rec(_ start: Int,_ end: Int)->Int {
    if start == end {return start}
    var mid = (start+end)/2
    var ret = min(Rec(start, mid), Rec(mid+1, end))
    var low=mid,high=mid+1
    var height = min(low,high)
    ret = max(ret, height*2)
    while 0<low || high<end {
        if high < end && (low < 0 || arr[low-1] < arr[high+1]) {
            high += 1
            height = min(height, arr[high])
        } else {
            low -= 1
            height = min(height, arr[low])
        }
    }
    return max(ret, height*(high-low+1))
}
arr = [7,1,5,9,6,7,3]
print(0,arr.count-1)
