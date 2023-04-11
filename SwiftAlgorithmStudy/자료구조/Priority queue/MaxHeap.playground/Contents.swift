// 제네릭 형식의 최대힙

struct MaxHeap<T: Comparable>{
    //Comparable을 적용해야지 비교할 수 있음
    
    var heap: [T] = []
    
    init(trashZero: T) {
        heap.append(trashZero)
    }
    
    // 1. 제일 마지막 단말 노드에 데이터를 삽입한다.
    mutating func insert(of num: T) {
        heap.append(num)
        var numIdx = heap.count - 1
        // 2. 부모 노드랑 계속 비교하면서 부모 노드가 자신보다 작다면 부모와 자신의 위치를 Swap
        // 3. 2번 조건을 만족하지 않을 때까지 자신이 루트 노드가 아닐 때까지 반복
        while numIdx != 1 && num > heap[numIdx/2] {
            changeNum(n1: numIdx, n2: numIdx/2)
            numIdx /= 2
        }
    }

    @discardableResult
    mutating func popMax() ->T? {
        // 1. 가장 마지막 노드의 값과 루트 노드의 값을 Swap 해준다.
        if heap.count <= 1 {return nil}
        changeNum(n1: heap.count-1, n2: 1)
        // 2. 가져올 최솟값을 미리 저장
        let last = heap.popLast()!
        // downHeap()
        // 3. 현재 노드에서 자식 노드와 비교하면서 자식 노드가 더 큰 값이면 Swap
        // 4. 위치를 찾을 때까지 3번 과정을 반복
        downHeap()
        
        return last
    }
    
    mutating private func downHeap() {
        var pIdx = 1
        while true {
            var cIdx = pIdx * 2
            // 자식 노드 오른쪽 num < 자식 노드 왼쪽 num -> 오른쪽으로 인덱스 +1
            // 더 작은 값이 위로 올라가야 하기 떄문
            if cIdx+1 < heap.count && heap[cIdx] < heap[cIdx+1] { cIdx += 1 }
            // 자식 노드가 부모 노드 num보다 크다면 while문 나가기
            if cIdx >= heap.count || heap[cIdx] < heap[pIdx] { break }
            // 바꾸기
            changeNum(n1: cIdx, n2: pIdx)
            // 인덱스 바꾸기
            pIdx = cIdx
        }
    }
    
    mutating private func changeNum(n1: Int, n2: Int){
        let c = heap[n1]
        heap[n1] = heap[n2]
        heap[n2] = c
    }
}



// ------

var heap: MaxHeap = MaxHeap<Int>(trashZero: 0)

heap.insert(of: 1)
heap.insert(of: 1)
heap.insert(of: 5)
heap.insert(of: 1)
heap.insert(of: 2)
heap.insert(of: 1)
heap.insert(of: 4)
heap.insert(of: 2)
print(heap.popMax()!)


