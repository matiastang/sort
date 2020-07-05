import Foundation

/*
 
 */

let lenght = 100
var originalArr = [Int]()
for _ in 0..<lenght {
    originalArr.append(Int(arc4random_uniform(100)))
}

let startTime = Date().timeIntervalSince1970
print("原始数组：\(originalArr)\n开始时间：\(startTime)")
let newArr = mergeSort(&originalArr)
let endTime = Date().timeIntervalSince1970
print("排序数组：\(newArr)\n结束时间：\(endTime)\n耗时：\(endTime - startTime)")

/// 归并排序
/// - Parameter original: 待排序数组
/// - Returns: 已排序数组
func mergeSort(_ original: inout [Int]) -> [Int] {
    let lenght = original.count
    if lenght < 2 {
        return original
    }
    let middle = Int(floor(Double(lenght / 2)))
    let left = original[0..<middle]
    let right = original[middle..<lenght]
    let mergeArr = merge(mergeSort(left), mergeSort(right))
    return mergeArr
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var mergeArr = [Int]()
    while left.count > 0 && right.count > 0 {
        
    }
}

extension Array {
    
    mutating func merge(_ middle: Int) {
        
    }
    
    /// 交换数组元素
    /// - Parameters:
    ///   - from: 交换元素下标
    ///   - to: 交换元素下标
    /// - Returns: 交换后的元素
    mutating func exchange(_ from: Int, _ to: Int) -> Array {
        (self[from], self[to]) = (self[to], self[from])
        return self
    }
}
