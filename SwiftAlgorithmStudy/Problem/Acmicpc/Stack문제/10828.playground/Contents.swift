/*
 10828
 스택
 
 10250
 ACM 호텔
 
 4153
 직각삼각형
 
 10989
 수 정렬하기 3
 */

// 스택
//var s=[String](),a=[Int]()
//for _ in 0..<Int(readLine()!)!{
//    s=readLine()!.split(separator:" ").map{String($0)}
//    switch s[0]{
//    case "push":a.append(Int(s[1])!)
//    case "top":print(a.last ?? -1)
//    case "size":print(a.count)
//    case "empty":print(a.isEmpty ?1:0)
//    default:print(a.popLast() ?? -1)
//    }
//}

// ACM 호텔
//for _ in 0..<Int(readLine()!)! {
//    var a=readLine()!.split(separator:" ").map{Int($0)!}
//    print(a[2]%a[0]*100+(a[2]/a[0]+1))
//}

//for _ in 0..<Int(readLine()!)!{var a=readLine()!.split(separator:" ").map{Int($0)!};print(((a[2]-1)%a[0]+1)*100+((a[2]-1)/a[0]+1))}

// 직각삼각형
//while true {
//    var a=readLine()!.split(separator:" ").map{Int($0)!*Int($0)!}.sorted(by:<)
//    if a.max()!==0{break}
//    print((a[0]+a[1]==a[2] ?"right":"wrong"))
//}

// 수 정렬하기 3
import Foundation


final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
let fIO = FileIO()

var a = [Int]()
for _ in 0..<fIO.readInt() {a.append(fIO.readInt())}
a.sort()
for i in a {print(i)}
