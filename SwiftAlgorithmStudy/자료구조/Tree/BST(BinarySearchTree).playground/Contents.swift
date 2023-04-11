/*
 Tree한 Node와 Branch를 이용해서 사이클을 이루지 않도록 구성한 데이터 구조
 - 노드의 왼쪽 하위 트리에는 노드의 키보다 작은 키가 있는 노드만 포함
 - 노드의 오른쪽 하위 트리에는 노드의 키보다 큰 키가 있는 노드만 포함
 - 왼쪽 및 오른쪽 하위 트리에도 각각 이진 검색 트리여야 함
 - 중복된 키를 허용하지 않는다.
 - 노드의 데이터 값은 항상 존재
 
 - 위 조건에 만족하지 않는다면 그냥 이진 트리임
 */

class Node<T: Comparable> {
    var data: T // 항상 있어야 됨
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(data: T){
        self.data = data
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isFull: Bool {
        return left != nil && right != nil
    }
}

class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    func insert(_ data: T){
        // 만약 루트가 없다면, 새로 생성 뒤 추가
        guard let root = self.root else {
            return self.root = Node.init(data: data)
        }
        
        var currentNode = root
        while true {
            if currentNode.data == data {
                print("중복된 값이 존재합니다.")
                return
            }
            
            // 만약 현재 루트 값보다 데이터 값이 작다면
            if currentNode.data > data {
                guard let nextNode = currentNode.left else {
                    currentNode.left = Node.init(data: data)
                    currentNode.left?.parent = currentNode
                    return
                }
                currentNode = nextNode
                
            // 만약 현재 루트 값보다 데이터 값이 크다면
            } else {
                guard let nextNode = currentNode.right else {
                    currentNode.right = Node.init(data: data)
                    currentNode.right?.parent = currentNode
                    return
                }
                currentNode = nextNode
            }
        }
    }
    
    func search(from data: T) -> Bool {
        if root == nil { return false }
        
        var currentNode = root
        while let node = currentNode {
            if node.data == data {
                return true
            }
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        return false
    }
    
    func searchNode(from data: T) -> Node<T>? {
        var currentNode: Node? = root
        while let node = currentNode {
            if node.data == data { break }
            currentNode = node.data > data ? node.left : node.right
        }
        return currentNode
    }
    
    
    //MARK: 이 부분 다시 보기!!!!!!
    func remove(from data: T) -> Bool {
        guard let targetNode = searchNode(from: data) else {
            return false
        }
        if targetNode.isRoot {
            removeRoot(targetNode)
        } else if targetNode.isLeaf {
            removeLeaf(targetNode, data: data)
        } else {
            targetNode.isFull ?
                removeFullNode(targetNode, data: data)
            : removeSingleChildNode(targetNode, data: data)
        }
        
        return true
    }
    
    func removeRoot(_ node: Node<T>) {
        if node.isLeaf {
            root = nil
        } else if node.isFull {
            var changeNode = node.right!
            while let nextNode = changeNode.left {
                changeNode = nextNode 
            }
            
            changeNode.left = root?.left
            changeNode.right = root?.right
            root = changeNode
        }
    }
    
    func removeLeaf(_ node: Node<T>, data: T) {
        if node.parent?.left?.data == data { //왼쪽 노드일 경우
            node.parent?.left = nil
        } else { //오른쪽 노드일 경우
            node.parent?.right = nil
        }
        node.parent = nil
    }
    
    func removeSingleChildNode(_ node: Node<T>, data: T) {
        guard let parent = node.parent else { return }
        
        if node.left != nil { //target의 왼쪽 노드가 존재하는 경우
            if parent.data > data {
                parent.left = node.left
            } else {
                parent.right = node.left
            }
            node.left?.parent = parent
        } else { //target의 오른쪽 노드가 존재하는 경우
            if parent.data > data {
                parent.left = node.right
            } else {
                parent.right = node.right
            }
            node.right?.parent = parent
        }
    }
    
    func removeFullNode(_ node: Node<T>, data: T){
        guard let parent = node.parent else { return }
        guard let rightNode = node.right else { return }
        
        var changeNode = rightNode
        while let nextNode = changeNode.left {
            changeNode.parent = changeNode
            changeNode = nextNode
        }
                
        if let changeChildNode = changeNode.right {
            //변경할 노드가 leaf가 아닌 경우 -> right 노드가 있는 경우
            changeNode.parent?.right = changeChildNode
            changeChildNode.parent = changeNode
        } else {
            changeNode.parent?.right = nil
        }
        
        if parent.data > changeNode.data {
            parent.left = changeNode
        } else {
            parent.right = changeNode
        }
        changeNode.parent = parent
        
        changeNode.left = node.left
        changeNode.right = node.right
    }
    
    func drawDiagram() {
        print(diagram(for: self.root))
    }
     
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }

}

let BST = BinarySearchTree<Int>()
BST.insert(20)
BST.insert(15)
BST.insert(30)
BST.insert(12)
BST.insert(16)
BST.insert(35)
BST.insert(37)

BST.drawDiagram()

