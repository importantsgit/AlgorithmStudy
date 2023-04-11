// 구간합 구하기

import Foundation

final class FileIO {
    
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
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
}

class SegmentTree {

    var value: Int
    var function: (Int,Int) -> Int
    var leftBounds: Int
    var rightBounds: Int
    var leftChild: SegmentTree?
    var rightChild: SegmentTree?
    
    init(array: [Int], leftBounds: Int, rightBounds: Int, function: @escaping (Int,Int) -> Int) {
        self.leftBounds = leftBounds
        self.rightBounds = rightBounds
        self.function = function
        
        if leftBounds == rightBounds {
            self.value = array[leftBounds]
        } else {
            let middle = (leftBounds + rightBounds) / 2
            self.leftChild = SegmentTree(
                array: array,
                leftBounds: leftBounds,
                rightBounds: middle,
                function: function
            )
            
            self.rightChild = SegmentTree(
                array: array,
                leftBounds: middle + 1,
                rightBounds: rightBounds,
                function: function
            )
            
            self.value = function(leftChild!.value, rightChild!.value)
        }
    }
    
    convenience init(array: [Int], function: @escaping (Int,Int) -> Int) {
        self.init(array: array, leftBounds: 0, rightBounds: array.count-1, function: function)
    }
    
    func query(withLeftBounds leftBounds: Int, rightBounds: Int) -> Int {
        if self.leftBounds == leftBounds, self.rightBounds == rightBounds { return self.value }
        
        guard let leftChild = leftChild,
              let rightChild = rightChild
        else { fatalError() }
        
        if leftChild.rightBounds < leftBounds {
            return rightChild.query(withLeftBounds: leftBounds, rightBounds: rightBounds)
            
        } else if rightChild.leftBounds > rightBounds {
            return leftChild.query(withLeftBounds: leftBounds, rightBounds: rightBounds)
            
        } else {
            let leftValue = leftChild.query(withLeftBounds: leftBounds, rightBounds: leftChild.rightBounds)
            let rightValue = rightChild.query(withLeftBounds: rightChild.leftBounds, rightBounds: rightBounds)
            return function(leftValue,rightValue)
        }
    }
    
    func replaceItem(at index: Int, withItem item: Int) {
        // 기저사례
        if self.leftBounds == self.rightBounds {
            value = item
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

let file = FileIO()
var arr: [Int] = []
var n = file.readInt()
var CP = file.readInt() + file.readInt()

for _ in 0..<n {
    arr.append(file.readInt())
}

let segmentTree = SegmentTree(array: arr, function: +)

for _ in 0..<CP {
    if file.readInt() == 1 {
        segmentTree.replaceItem(at: file.readInt()-1, withItem: file.readInt())
    } else {
        print(segmentTree.query(withLeftBounds: file.readInt()-1, rightBounds: file.readInt()-1))
    }
}

//arr = [1,2,3,4,5]
//let segmentTree = SegmentTree<Int>(array: arr, function: +)
//segmentTree.replaceItem(at: 3-1, withItem: 6)
//segmentTree.query(withLeftBounds: 2-1, rightBounds: 5-1)
//segmentTree.replaceItem(at: 5-1, withItem: 2)
//segmentTree.query(withLeftBounds: 3-1, rightBounds: 5-1)
