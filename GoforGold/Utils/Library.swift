//
//  Library.swift
//  InstagramFirebase
//
//  Created by Anson Ng on 22/2/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import Foundation

func printElement<T>(array:[T]){
    for element in array {
        print(element)
    }
}

func secondsToMinutes(seconds: Float) -> String {
    let value = Int(seconds / 10.0) * 10
    let seconds = value % 60
    let minutes = value / 60
    
    let result = "\(minutes):\(seconds)"
    
    return result
}
