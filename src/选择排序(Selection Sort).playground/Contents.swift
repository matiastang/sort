import Foundation

/*
 原始数组：[46, 25, 3, 90, 43, 40, 91, 54, 25, 11, 64, 57, 28, 77, 61, 35, 3, 50, 96, 61, 22, 95, 15, 14, 92, 76, 10, 95, 54, 10, 61, 54, 52, 56, 74, 36, 57, 92, 6, 72, 16, 4, 59, 44, 83, 92, 95, 61, 26, 80, 80, 42, 38, 39, 30, 27, 52, 39, 75, 74, 25, 30, 33, 54, 83, 99, 64, 5, 54, 21, 30, 91, 18, 48, 1, 18, 54, 58, 67, 93, 82, 65, 19, 62, 4, 59, 58, 30, 67, 27, 41, 38, 31, 38, 59, 49, 49, 42, 58, 50]
 开始时间：1593920277.052762
 排序数组：[1, 3, 3, 4, 4, 5, 6, 10, 10, 11, 14, 15, 16, 18, 18, 19, 21, 22, 25, 25, 25, 26, 27, 27, 28, 30, 30, 30, 30, 31, 33, 35, 36, 38, 38, 38, 39, 39, 40, 41, 42, 42, 43, 44, 46, 48, 49, 49, 50, 50, 52, 52, 54, 54, 54, 54, 54, 54, 56, 57, 57, 58, 58, 58, 59, 59, 59, 61, 61, 61, 61, 62, 64, 64, 65, 67, 67, 72, 74, 74, 75, 76, 77, 80, 80, 82, 83, 83, 90, 91, 91, 92, 92, 92, 93, 95, 95, 95, 96, 99]
 结束时间：1593920277.2386808
 耗时：0.18591880798339844
 */

let lenght = 100
var originalArr = [Int]()
for _ in 0..<lenght {
    originalArr.append(Int(arc4random_uniform(100)))
}

let startTime = Date().timeIntervalSince1970
print("原始数组：\(originalArr)\n开始时间：\(startTime)")
let newArr = selectionSort(&originalArr)
let endTime = Date().timeIntervalSince1970
print("排序数组：\(newArr)\n结束时间：\(endTime)\n耗时：\(endTime - startTime)")

/// 选择排序
/// - Parameter original: 待排序数组
/// - Returns: 已排序数组
func selectionSort(_ original: inout [Int]) -> [Int] {
    let lenght = original.count
    var minIndex = 0
    for i in 0..<lenght {
        minIndex = i
        for j in i + 1..<lenght {
            if (original[j] < original[minIndex]) {
                minIndex = j
            }
        }
        if minIndex != i {
            original.exchange(i, minIndex)
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
