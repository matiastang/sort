import Foundation

/*
 原始数组：[62, 49, 51, 90, 4, 21, 82, 1, 11, 51, 31, 27, 78, 84, 55, 27, 96, 92, 78, 89, 52, 85, 58, 80, 67, 52, 27, 69, 91, 16, 51, 79, 87, 95, 86, 75, 20, 60, 33, 26, 18, 38, 60, 7, 22, 59, 91, 37, 66, 15, 63, 54, 65, 41, 60, 4, 98, 9, 2, 96, 4, 81, 73, 70, 83, 24, 35, 23, 29, 72, 59, 75, 80, 29, 17, 59, 38, 73, 17, 67, 99, 21, 1, 55, 69, 14, 15, 5, 42, 85, 22, 82, 28, 4, 27, 4, 97, 29, 48, 49]
 开始时间：1593960294.582543
 排序数组：[1, 1, 2, 4, 4, 4, 4, 4, 5, 7, 9, 11, 14, 15, 15, 16, 17, 17, 18, 20, 21, 21, 22, 22, 23, 24, 26, 27, 27, 27, 27, 28, 29, 29, 29, 31, 33, 35, 37, 38, 38, 41, 42, 48, 49, 49, 51, 51, 51, 52, 52, 54, 55, 55, 58, 59, 59, 59, 60, 60, 60, 62, 63, 65, 66, 67, 67, 69, 69, 70, 72, 73, 73, 75, 75, 78, 78, 79, 80, 80, 81, 82, 82, 83, 84, 85, 85, 86, 87, 89, 90, 91, 91, 92, 95, 96, 96, 97, 98, 99]
 结束时间：1593960295.6569161
 耗时：1.0743732452392578
 */

let lenght = 100
var originalArr = [Int]()
for _ in 0..<lenght {
    originalArr.append(Int(arc4random_uniform(100)))
}

let startTime = Date().timeIntervalSince1970
print("原始数组：\(originalArr)\n开始时间：\(startTime)")
let newArr = quickSort(&originalArr, left: 0, right: originalArr.count - 1)
let endTime = Date().timeIntervalSince1970
print("排序数组：\(newArr)\n结束时间：\(endTime)\n耗时：\(endTime - startTime)")

/// 快速排序
/// - Parameter original: 待排序数组
/// - Returns: 已排序数组
func quickSort(_ original: inout [Int], left: Int, right: Int) -> [Int] {
    let lenght = original.count
    if lenght < 2 {
        return original
    }
    if right <= left {
        return original
    }
    let partitionIndex = partition(&original, left: left, right: right)
    quickSort(&original, left: left, right: partitionIndex - 1)
    quickSort(&original, left: partitionIndex + 1, right: right)
    return original
}

func partition(_ original: inout [Int], left: Int, right: Int) -> Int {
    if left == right {
        return left
    }
    var pivotInedex = left// 以第一个为基准
    var index = pivotInedex + 1
    for key in index...right {
        if original[key] < original[pivotInedex] {
            original.exchange(key, index)
            index += 1
        }
    }
    original.exchange(pivotInedex, index - 1)
    return index - 1
}

extension Array {
    
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
