//: Playground - noun: a place where people can play

import UIKit

let sampleArray : Array<Int> = [1,22,33,45,56,67,72,81,95,1430]

// brute force approach - O(n) linear time
func linearSearch(key:Int) {
    for number in sampleArray {
        if number == key {
            println("I found it : key = \(number)")
            break
        }
    }
}


// binary search - O(log n) logarithmic time

func binarySearch(key: Int,imin : Int, imax:Int) {
    
    // find midle index
    
    var midleIndex = ( imin + imax ) / 2
    
    var midleNumber = sampleArray[midleIndex]
    
    if midleNumber > key {
        binarySearch(key, imin, midleIndex - 1)
    }
    else if midleNumber < key {
        binarySearch(key, midleIndex + 1, imax)
    }
    else
    {
        println("key = \(key) with index:\(midleIndex)")
    }
}
binarySearch(45, 0, 9)


var numberList : Array<Int> = [4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3,4,6,3,5,6,7,3,2,6,6,2,4,6,7,3]

func insertionSort() {
    var numberList : Array<Int> = [4,6,3,5,6,7,3,2,6,6,2,4,6,7,3]
    
    var x,y,key : Int
    
    for (x = 0 ; x < numberList.count; x++) {
        
        key = numberList[x]
        
        for (y = x ;y > -1 ; y--) {
            
            if key < numberList[y] {
                
                numberList.removeAtIndex(y+1)
                
                numberList.insert(key, atIndex: y)
            }
        }
    }
    println(numberList)
}
insertionSort()


// Quick sort

func partition(start :Int,end :Int,inout inputArr:Array<Int>) {
    if (end - start < 2){return}
    
    var p = inputArr[start + (end - start)/2]
    var l = start
    var r = end - 1
    
    while( l <= r ) {
        if inputArr[l] < p {
            l += 1
            continue
        }
        if inputArr[r] > p {
            r -= 1
            continue
        }
        
        var t = inputArr[l]
        inputArr[l] = inputArr[r]
        inputArr[r] = t
        l += 1
        r -= 1
    }
    partition(start, r+1, &inputArr)
    partition(r+1, end, &inputArr)
}
func quickSort() {
    partition(0, numberList.count-1, &numberList)
}
let swift_start:UInt64 = mach_absolute_time()
quickSort()
let swift_stop:UInt64 = mach_absolute_time() - swift_start

var info : mach_timebase_info = mach_timebase_info(numer: 0, denom: 0)
mach_timebase_info(&info)

let total = (swift_stop * UInt64(info.numer) / UInt64(info.denom)) / 1_000_000
println("\(total) µs.")






