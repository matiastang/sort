import Foundation

/*
 原始数组：[87, 30, 61, 54, 71, 26, 38, 73, 99, 16, 76, 2, 29, 36, 62, 75, 56, 35, 66, 74, 70, 31, 64, 16, 75, 34, 33, 69, 91, 38, 83, 99, 65, 16, 57, 52, 95, 45, 83, 10, 81, 89, 4, 43, 72, 61, 56, 1, 97, 73, 65, 40, 63, 6, 61, 75, 97, 23, 93, 82, 31, 67, 19, 37, 60, 60, 34, 49, 86, 52, 22, 85, 48, 21, 34, 97, 73, 70, 91, 92, 24, 56, 1, 78, 12, 72, 42, 89, 67, 4, 70, 3, 55, 63, 71, 35, 85, 87, 9, 89]
 开始时间：1593921225.103883
 排序数组：[1, 1, 2, 3, 4, 4, 6, 9, 10, 12, 16, 16, 16, 19, 21, 22, 23, 24, 26, 29, 30, 31, 31, 33, 34, 34, 34, 35, 35, 36, 37, 38, 38, 40, 42, 43, 45, 48, 49, 52, 52, 54, 55, 56, 56, 56, 57, 60, 60, 61, 61, 61, 62, 63, 63, 64, 65, 65, 66, 67, 67, 69, 70, 70, 70, 71, 71, 72, 72, 73, 73, 73, 74, 75, 75, 75, 76, 78, 81, 82, 83, 83, 85, 85, 86, 87, 87, 89, 89, 89, 91, 91, 92, 93, 95, 97, 97, 97, 99, 99]
 结束时间：1593921229.098071
 耗时：3.994188070297241
 */

let lenght = 100
var originalArr = [Int]()
for _ in 0..<lenght {
    originalArr.append(Int(arc4random_uniform(100)))
}

let startTime = Date().timeIntervalSince1970
print("原始数组：\(originalArr)\n开始时间：\(startTime)")
let newArr = insertionSort(&originalArr)
let endTime = Date().timeIntervalSince1970
print("排序数组：\(newArr)\n结束时间：\(endTime)\n耗时：\(endTime - startTime)")

/// 插入排序
/// - Parameter original: 待排序数组
/// - Returns: 已排序数组
func insertionSort(_ original: inout [Int]) -> [Int] {
    let lenght = original.count
    for i in 1..<lenght {// 第一个元素默认认为已经排序了
        var okIndex = i - 1
        while okIndex >= 0 && original[okIndex] > original[okIndex + 1] {
            original.exchange(okIndex, okIndex + 1)
            okIndex -= 1
        }
    }
    return original
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
