var arr = [1,2,3,1,2,8]
var arr1 = [100,1,4,2,3,4,5,1]
var arr2 = [1,2,3,4,5,5,6,7]

// 한 개의 LIS
var cache = [Int](repeating: -1, count: arr1.count)
func max1(_ idx: Int)-> Int {
    if idx > arr1.count-1 { return 0 }
    if cache[idx] != 1 { return cache[idx] }
    cache[idx] = 1
    for i in 1..<arr1.count-idx {
        if arr1[idx] < arr1[idx+i] {
            cache[idx] = max(cache[idx+i], 1 + max2(idx+i))
        }
    }
    return cache[idx]
}
// 위 방법은 시작 위치를 선별하여 지정해줘야 한다.

//MARK: -시작하는 위치를 지정해주지 않는 방법

func max2(_ idx: Int)-> Int {
    if idx > arr1.count-1 { return 0 }
    if cache[idx] != 1 { return cache[idx] }
    cache[idx] = 1
    for i in 0..<arr1.count-idx-1 {
        for j in i..<arr1.count-idx {
            if arr1[idx+i] < arr1[idx+j] {
                cache[idx+i] = max(cache[idx+i], 1 + max2(idx+j))
            }
        }
    }
    return cache[idx]
}
// 위 방법은 시작 위치를 지정하지 않아도 되지만 한 재귀에 이중 루프가 들어 있어 효율 x

//max2(0)
//print(cache)

var cache1 = [Int](repeating: -1, count: arr1.count+1)
func max3(_ idx: Int)-> Int {
    if cache1[idx+1] != -1 { return cache1[idx+1] }
    cache1[idx+1] = 1
    var num = idx == -1 ? -1 : arr1[idx]
    for i in (idx+1)..<arr1.count {
        if num < arr1[i] {
            cache1[idx+1] = max(cache1[idx+1], max3(i)+1)
        }
    }
    return cache1[idx+1]
}

max3(-1)-1
print(cache1)

// 이것을 bottomUP으로 푼다면
func lisDP(_ arr:[Int]) {
    var DP = [Int](repeating: 0, count: arr.count) // 최장길이 저장
    
    for i in 0..<arr.count {
        DP[i] = 1
        for j in 0..<i {
            if arr[j]<arr[i] {
                DP[i] = max(DP[i], DP[j]+1)
            }
        }
    }
    print(DP.last!)
}

//lisDP(arr)


//MARK: - 합친 LIS

var arr3 = [100,1,2]
var arr4 = [3,4]

var ch = [[Int]](repeating: [Int](repeating: -1, count: arr4.count+1), count: arr3.count+1)

func max4(_ ia:Int,_ ib: Int) -> Int {
    if ch[ia+1][ib+1] != -1 { return ch[ia+1][ib+1] }
    ch[ia+1][ib+1] = 2
    var maxa = ia == -1 ? -1 : arr3[ia], maxb = ib == -1 ? -1 : arr4[ib]
    var maxNum = max(maxa, maxb)

    for i in (ia+1)..<arr3.count {
        if maxNum < arr3[i] {
            ch[ia+1][ib+1] = max(ch[ia+1][ib+1], max4(i, ib)+1)
        }
    }
    
    for i in (ib+1)..<arr4.count {
        if maxNum < arr4[i] {
            ch[ia+1][ib+1] = max(ch[ia+1][ib+1], max4(ia, i)+1)
        }
    }
    
    return ch[ia+1][ib+1]
}



max4(-1,-1)-2
print(ch)


var ch1 = [[Int]](repeating: [Int](repeating: -1, count: arr4.count), count: arr3.count)
func max5(_ ia:Int,_ ib: Int) -> Int {
    if ch1[ia][ib] != -1 { return ch1[ia][ib] }
    ch1[ia][ib] = 2
    var maxNum = max(arr3[ia], arr4[ib])

    for i in (ia+1)..<arr3.count {
        if maxNum < arr3[i] {
            ch1[ia][ib] = max(ch1[ia][ib], max4(i, ib)+1)
        }
    }
    
    for i in (ib+1)..<arr4.count {
        if maxNum < arr4[i] {
            ch1[ia][ib] = max(ch1[ia][ib], max4(ia, i)+1)
        }
    }
    
    return ch1[ia][ib]
}

max5(0,0)
print(ch1)
