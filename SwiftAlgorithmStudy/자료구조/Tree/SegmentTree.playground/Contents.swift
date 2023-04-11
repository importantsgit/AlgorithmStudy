/*
 1. 여러 개의 데이터가 존재할 때 주로 특정 구간의 합을 구하는 데 사용되는 자료 구조
 2. 트리 종류 중에 하나로 이진 트리의 형태이며, 특정 구간의 합을 가장 빠르게 구할 수 있다는 장점이 있음 O(logN)
 3. 핵심은 재귀적 반복에 있음
 4. 만약 배열의 범위가 주어졌을 때, 모든 요소의 합을 구한다면 O(N)임
 5. 큰 차이가 있음
 */

class SegmentTree<T:Comparable> {
    // 값
    // 원자라면 그냥 자신의 값
    // 부모 노드라면 자식 노드 더한 값
    var value: T
    // 연산
    var function: (T,T) -> T
    // 범위
    var leftBounds: Int
    var rightBounds: Int
    // 자식노드들
    var leftChild: SegmentTree<T>?
    var rightChild: SegmentTree<T>?
    
    
    // Designated init -> 모든 프로퍼티가 초기화 될 수 있도록 해줘야 함
    // 클래스 프로퍼티가 하나라도 빠지게 된다면, 오류 발생
    init(array: [T], leftBounds: Int, rightBounds: Int, function: @escaping (T,T) -> T) {
        self.leftBounds = leftBounds
        self.rightBounds = rightBounds
        self.function = function // function에 + 넣었다면 부분합이 구해짐
        
        if leftBounds == rightBounds {
            // 기저사례
            self.value = array[leftBounds]
        } else {
            let middle = (leftBounds + rightBounds) / 2
            self.leftChild = SegmentTree<T>(
                array: array,
                leftBounds: leftBounds,
                rightBounds: middle,
                function: function
            )
            
            self.rightChild = SegmentTree<T>(
                array: array,
                leftBounds: middle + 1,
                rightBounds: rightBounds,
                function: function
            )
            
            self.value = function(leftChild!.value, rightChild!.value)
        }
    }
    
    // convenience init -> 보조: 일부를 기본값으로 설정해서 init 호출하여 초기화
    // 먼저 Designated init 초기화 먼저 진행
    // 파라미터로 넘어오지 않은 값은 임의로 지정하여 전달
    convenience init(array: [T], function: @escaping (T,T) -> T) {
        self.init(array: array, leftBounds: 0, rightBounds: array.count-1, function: function)
    }
    
    
    // 부분합 구하기 O(logN)
    func query(withLeftBounds leftBounds: Int, rightBounds: Int) -> T {
        // left, right가 모두 일치 -> 자기 value 리턴
        if self.leftBounds == leftBounds, self.rightBounds == rightBounds { return self.value }
        
        guard let leftChild = leftChild,
              let rightChild = rightChild
        else { fatalError() }
        
        // 노드 왼쪽에 포함 안됐을 경우 ( 오른쪽 자식에 모두 포함 )
        if leftChild.rightBounds < leftBounds {
            return rightChild.query(withLeftBounds: leftBounds, rightBounds: rightBounds)
            
        // 노드 오른쪽에 포함 안됐을 경우 ( 왼쪽 자식에 모두 포함 )
        } else if rightChild.leftBounds > rightBounds {
            return leftChild.query(withLeftBounds: leftBounds, rightBounds: rightBounds)
            
        // 노드 중간에 걸쳤을 때, ( 왼쪽 오른쪽 자식이 모두 포함된 경우 )
        } else {
            let leftValue = leftChild.query(withLeftBounds: leftBounds, rightBounds: leftChild.rightBounds)
            let rightValue = rightChild.query(withLeftBounds: rightChild.leftBounds, rightBounds: rightBounds)
            return function(leftValue,rightValue)
        }
    }
    
    // 인덱스에 있는 값을 바꿔주기
    func replaceItem(at index: Int, withItem item: T) {
        // 기저사례
        if self.leftBounds == self.rightBounds {
            value = item
            
        // 왼쪽이면 왼쪽의 자식으로, 오른쪽이면 오른쪽 자식으로 타고 가서 값을 바꿔주고
        // 다시 왼쪽, 오른쪽을 연산해서 자신의 값도 바꿔주면 됨
        } else if let leftChild = leftChild, let rightChild = rightChild {
            if leftChild.rightBounds >= index {
                leftChild.replaceItem(at: index, withItem: item)
            } else {
                rightChild.replaceItem(at: index, withItem: item)
            }
            value = function(leftChild.value, rightChild.value)
        }
    }
}

let array = (1...10).map{ $0 }
let segmentTree = SegmentTree<Int>(array: array, function: +)


// 모든 요소 더한 값
print(segmentTree.query(withLeftBounds: 0, rightBounds: 9))
print(array.reduce(0, +))

