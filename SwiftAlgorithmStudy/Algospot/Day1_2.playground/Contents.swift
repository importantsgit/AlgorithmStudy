/*
 1. 모든 버튼을 한번씩 클릭하게 하는 함수
 2. 만약 배열의 모든 요소 == 12 라면 최솟값 계산
 
 문제점
 1. 많은 재귀함수 호출로 인하여 함수가 끝나질 않음
 
 향후 개선 방향
 1. 해당 배열에서 12가 아닌 요소의 인덱스를 가져와 가장 비슷한 버튼을 클릭하는 함수 제작
 */


let buttons = [[0,1,2],[3,7,9,11],[4,10,14,15],[0,4,5,6,7],[6,7,8,10,12],[0,2,14,15],[3,14,15],[4,5,7,14,15],[1,2,3,4,5],[3,4,5,9,13]]
var arr = [[12,9,3,12,6,6,9,3,12,9,12,9,12,12,6,6],[12,6,6,6,6,6,12,12,12,12,12,12,12,12,12,12]]

var INF = 9999
var cnt = INF

// 재귀함수
func makeNum(_ array:inout [Int],_ buttonNum: Int,_ curCnt: Int) {
    
    // 배열 값이 모두 다 12일 때 (최솟값 판별 후, cnt에 대입)
    if array.min()! == 12 {
        cnt = min(cnt, curCnt)
        return
    }
    // 버튼을 다 눌렀을 때 (값 없음)
    if buttonNum > 9 { return }
    
    for i in 0..<4 {
        // 다른 버튼 클릭하기
        makeNum(&array, buttonNum + 1, curCnt + i)
        // 배열 값 바꾸기 -> 해당 버튼 클릭 했을 때 (만약 12라면 -> 3,12가 아니라면 +3)
        for b in buttons[buttonNum] {array[b] = array[b] == 12 ? 3 : array[b] + 3}
    }
    return
}

// 배열 1당 함수 호출 및 print() -> 자동 개행
//for i in 0..<arr.count {
//    cnt = INF
//    makeNum(&arr[i], 0, 0)
//    // 만약 최솟값이 안나왔다면 -1 반환
//    print(cnt == INF ? -1 : cnt)
//}


func makeNum2(_ array:[Int],_ buttonNum: Int)->Int {

    var clock = array
    if buttonNum == 10 { return clock.contains(where: {$0 != 12}) ? INF : 0 }
    var ret = INF
    
    for cnt in 0..<4 {

        ret = min(ret, cnt + makeNum2(clock, buttonNum + 1))

        for b in buttons[buttonNum] {clock[b] = clock[b] == 12 ? 3 : clock[b] + 3}
    }
    return ret
}

//for clock in arr {
//
//    var cnt = makeNum2(clock, 0)
//    // 만약 최솟값이 안나왔다면 -1 반환
//    print(cnt == INF ? -1 : cnt)
//}


//MARK: - 시험

func clockTime(_ clocks: [Int],_ ccnt: Int)->Int {
    var clocks = clocks
    if ccnt > 9 { return clocks.contains(where: {$0 != 12}) ? INF : 0 }
    var ret = INF
    for click in 0..<4 {
        ret = min(ret, click+clockTime(clocks, ccnt+1))
        for b in buttons[ccnt] {
            clocks[b] = clocks[b] == 12 ? 3 : clocks[b] + 3
        }
    }
    return ret
}

// print(clockTime(arr[0], 0))

