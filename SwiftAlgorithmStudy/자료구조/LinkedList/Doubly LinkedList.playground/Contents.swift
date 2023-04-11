
class Node<T> {
    var prev: Node?
    var data: T?
    var next: Node?
    
    init(data: T?,prev: Node? = nil, next: Node? = nil) {
        self.prev = prev
        self.next = next
        self.data = data
    }
}

class DoublylinkedList<T:Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    // tail은 늘 마지막 노드 (새로운 노드 추가시 tail에 추가)
    func append(data : T?) {
        if head == nil {
            head = Node.init(data: data)
            tail = head
            count += 1
            
            return
        }
        
        let newNode = Node.init(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        count += 1
    }
    
    func insert(data: T?, at index: Int) {
        if count-1 < index {
            print("노드리스트 범위를 벗어났습니다.")
            return
        }
        
        // head가 없는 경우 Node를 생성 후 head로 지정한다.
        if head == nil {
            print("링크 리스트에 노드가 전혀 없습니다.")
            return
        }
        
        var node = head
        for _ in 0 ..< (index - 1) { // 입력된 인덱스 전까지 올라감
            if node?.next == nil {
                print("인덱스 범위를 넘어갔습니다.")
                return
            }
            node = node?.next
        }
            
        // change node
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.prev = node
        node?.next?.next = nextNode
        nextNode?.prev = node?.next
        count += 1
    }
    
    func popLast() -> T? {
        if head == nil {
            print("링크 리스트에 노드가 전혀 없습니다.")
            return nil
        }
        
        // head를 삭제하는 경우 (연결 리스트에 노드가 1개 밖에 없는 경우)
        if head?.next == nil {
            let data = head?.data
            head = nil
            tail = nil
            count -= 1
            return data
        }
        
        let data = tail?.data
        tail?.prev?.next = nil
        tail = tail?.prev
        count -= 1
        
        return data
    }
    
    func pop(at index: Int) -> T? {
        if count-1 < index {
            print("노드리스트 범위를 벗어났습니다.")
            return nil
        }
        
        if head == nil {
            print("현재 저장된 노드가 전혀 없습니다.")
            return nil
        }
        
        var node = head
        for _ in 0 ..< index-1 {
            if node?.next?.next == nil {break}
            node = node?.next
        }
        
        // 가운데 노드 연결 끊기
        let data = node?.next?.data
        node?.next = node?.next?.next
        node?.next?.prev = node
        count -= 1
        return data
    }
    
    func returnArray()->[T]? {
        var arr:[T] = []
        if head == nil {
            print("현재 저장된 노드가 전혀 없습니다.")
            return nil
        }
        var node = head
        while node != nil {
            arr.append((node?.data!)!)
            node = node?.next
        }
        return arr
    }
}

var linkList: DoublylinkedList = DoublylinkedList<Int>()

linkList.append(data: 1)
linkList.append(data: 5)
linkList.append(data: 4)
linkList.append(data: 3)
linkList.append(data: 2)

print(linkList.returnArray()!)

print(linkList.pop(at: 2))

print(linkList.returnArray()!)

print(linkList.count)

for _ in 0..<7 {
    print(linkList.popLast())
}
