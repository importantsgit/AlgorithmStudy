/*
 크림 파스타
 25214
 */


var cache = Array(repeating: -1, count: 200000)
var arr2 = [50,100,70,110,10,100].sorted() // 6


// 차이가 제일 큰 값 찾기
func pasta(_ arr:[Int],_ start: Int)-> Int {
    print("\(start): a.c-1 \(arr.count-1)")
    if start == arr.count-1 {return 0}
    if cache[start] != -1 {return cache[start]}
    var start = start
    var ret = 0
    var compare = Array(arr[(start+1)...])
    var maxN = compare.max()!
    var minus = maxN - arr[start]
    if minus > 0 { ret = minus }
    for i in 1..<arr.count-start {
        print("\(start): minus\(arr.count-start)")
        cache[start] = max(ret, pasta(arr2, start+i))
    }
    return cache[start]
}

pasta(arr2,0)
// 사실상 이럴 필요까지는 없다


import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var byteIdx: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        byteIdx = 0
    }
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }

    @inline(__always) func readString() -> String {
        var str = "", byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() } // 공백과 줄바꿈 무시
        while byte != 10 && byte != 32 && byte != 0 {
            str += String(bytes: [byte], encoding: .ascii)!
            byte = readByte()
        }
        return str
    }
}
var file = FileIO()
var arr:[Int] = []
var n = file.readInt()
for _ in 0..<n {arr.append(file.readInt())}
func pa(_ n:Int,_ arr:[Int]){
    if n==1{print(0);return}
    var result=[0]
    var minN=arr[0]
    var maxN=arr[1]
    if n==2{print(maxN-minN>0 ?maxN-minN:0);return}
    result.append(maxN-minN>0 ?maxN-minN:0)
    for i in 2..<n{
        minN=min(minN,maxN)
        maxN=arr[i]
        result.append(max(result[i-1],maxN-minN))
    }
    print(result.map{String($0)}.joined(separator:" "))
}
pa(n,arr)
