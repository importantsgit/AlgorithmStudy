/*
 수열
 2491
 */

func sequenceNum(_ n:Int,_ arr: [Int]) {
    var DP1 = Array(repeating: 1, count: n), DP2 = Array(repeating: 1, count: n)
    
    for i in 1..<n {
        if arr[i] <= arr[i-1] {
            DP1[i] = max(DP1[i],DP1[i-1]+1)
        }
        if arr[i] >= arr[i-1] {
            DP2[i] = max(DP2[i],DP2[i-1]+1)
        }
    }
    print(max(DP1.max()!,DP2.max()!))
}

// sequenceNum(9, [1, 2, 2, 4, 4, 5, 7, 7, 2])

sequenceNum(Int(readLine()!)!, readLine()!.split(separator: " ").map{Int($0)!})




func sequenceNum2(_ n:Int,_ arr:[Int]){
    var DP1=Array(repeating:1,count:n),DP2=Array(repeating:1,count:n)
    for i in 1..<n{if arr[i]<=arr[i-1]{DP1[i]=max(DP1[i],DP1[i-1]+1)};if arr[i]>=arr[i-1]{DP2[i]=max(DP2[i],DP2[i-1]+1)}}
    print(max(DP1.max()!,DP2.max()!))
}

// sequenceNum(9, [1, 2, 2, 4, 4, 5, 7, 7, 2])

sequenceNum2(Int(readLine()!)!,readLine()!.split(separator:" ").map{Int($0)!})
