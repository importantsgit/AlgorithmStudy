import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

// 제네릭 형식의 최소힙

struct MinHeap<T: Comparable>{
    //Comparable을 적용해야지 비교할 수 있음
    
    var heap: [T] = []
    
    init(trashZero: T) {
        heap.append(trashZero)
    }
    
    // 1. 제일 마지막 단말 노드에 데이터를 삽입한다.
    mutating func insert(of num: T) {
        heap.append(num)
        var numIdx = heap.count - 1
        // 2. 부모 노드랑 계속 비교하면서 부모 노드가 자신보다 크다면 부모와 자신의 위치를 Swap
        // 3. 2번 조건을 만족하지 않을 때까지 자신이 루트 노드가 아닐 때까지 반복
        while numIdx != 1 && num < heap[numIdx/2] {
            changeNum(heap: &heap,n1: numIdx, n2: numIdx/2)
            numIdx /= 2
        }
    }

    @discardableResult
    mutating func popMin() ->T? {
        // 1. 가장 마지막 노드의 값과 루트 노드의 값을 Swap 해준다.
        if heap.count <= 0 {return nil}
        changeNum(heap: &heap, n1: heap.count-1, n2: 1)
        // 2. 가져올 최솟값을 미리 저장
        var last = heap.popLast()!
        // downHeap()
        // 3. 현재 노드에서 자식 노드와 비교하면서 자식 노드가 더 작은 값이면 Swap
        // 4. 위치를 찾을 때까지 3번 과정을 반복
        downHeap(heap: &heap)
        
        return last
    }

    func downHeap(heap:inout [T]) {
        var pIdx = 1
        while true {
            var cIdx = pIdx * 2
            // 자식 노드 오른쪽 num < 자식 노드 왼쪽 num -> 오른쪽으로 인덱스 +1
            // 더 작은 값이 위로 올라가야 하기 떄문
            if cIdx+1 < heap.count && heap[cIdx] > heap[cIdx+1] { cIdx += 1 }
            // 자식 노드가 부모 노드 num보다 크다면 while문 나가기
            if cIdx >= heap.count || heap[cIdx] > heap[pIdx] { break }
            // 바꾸기
            changeNum(heap: &heap, n1: cIdx, n2: pIdx)
            // 인덱스 바꾸기
            pIdx = cIdx
        }
    }
    
    private func changeNum(heap:inout [T], n1: Int, n2: Int){
        let c = heap[n1]
        heap[n1] = heap[n2]
        heap[n2] = c
    }
    
    func returnHeap()->[T] {
        return self.heap
    }
}

let file = FileIO()

let C = file.readInt()
for _ in 0..<C {
    var n = file.readInt()
    var arr: [[Int]] = []
    for _ in 0..<n {
        arr.append([file.readInt(),file.readInt()])
    }
    var count = 0
    var min = 9999999
    arr.sort(by: {$0[0] < $1[0]})
    for i in 0..<arr.count {
        if min > arr[i][1] {
            count += 1
            min = arr[i][1]
        }
    }
    print(count)
}
