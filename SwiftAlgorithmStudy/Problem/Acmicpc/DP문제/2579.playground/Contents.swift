/*
 계단 오르기
 2579
 */
//var arr = [10,20,15,25,10,20]

var arr:[Int] = []
var c = Int(readLine()!)!
for _ in 0..<c {
    arr.append(Int(readLine()!)!)
}

func stepUp(_ arr: [Int]) {
    if arr.count == 1 {print(arr[0]);return}
    if arr.count == 2 {print(arr[0]+arr[1]);return}
    if arr.count == 3 {print(max(arr[0]+arr[2],arr[1]+arr[2]));return}
    var DP = [Int](repeating: 0, count: arr.count)
    DP[0] = arr[0]
    DP[1] = arr[0]+arr[1]
    DP[2] = max(arr[0]+arr[2],arr[1]+arr[2])
    for i in 3..<arr.count {
        DP[i] = max(DP[i-2]+arr[i],DP[i-3]+arr[i-1]+arr[i])
    }
    print(DP.last!)
}

stepUp(arr)


func stepUp2(_ arr: [Int]) {
    if arr.count < 2 {print(arr.last!);return}
    var DP = [Int](repeating: 0, count: arr.count)
    DP[0] = arr[0]
    DP[1] = arr[0]+arr[1]
    var c = 2
    for i in 2..<arr.count {
        c += 1
        if c == 3 {
            DP[i] = DP[i-2]+arr[i]
            c = 0
        } else {
            DP[i] = max(DP[i-1],DP[i-2]) + arr[i]
        }
    }
    print(DP.last!)
}

