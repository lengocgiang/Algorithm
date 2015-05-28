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





