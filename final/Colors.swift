//
//  Colors.swift
//  final
//
//  Created by Lijie Zhao on 8/24/17.
//  Copyright © 2017 Lijie Zhao. All rights reserved.
//

import UIKit

struct values: Codable, CustomStringConvertible{
    
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    
    var description: String {
        return "\(red) \(green) \(blue) \(alpha)"
    }
}

struct Color: Codable, CustomStringConvertible {
    var colorCommonName: String
    var colorValues: values
    
    
    var description: String {
        return "\(colorCommonName) \(colorValues.description)"
    }
    
    var formattedJSON: String {
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let json = try? encoder.encode(self) else {
            print("Can't create JSON for color")
            return ""
        }
        
        return String(data: json, encoding: .utf8) ?? ""
    }
}

class Colors {
    var colorArray: [Color]
    
    init() {
        colorArray = []
        colorArray = loadJSON()
        print(loadJSON())
    }
    
    func color(at indexPath: IndexPath) -> Color {
        if indexPath.row >= colorArray.count {
            return colorArray[0]
        }

        return colorArray[indexPath.row]
    }
    
    func loadJSON() -> [Color] {
        let url = Bundle.main.url(forResource: "colors", withExtension: "json")
        
        guard let jsonData = try? Data(contentsOf: url!) else {
            return []
        }
        
        let jsonDecoder = JSONDecoder()
        
        let jsonColorArray = try? jsonDecoder.decode([Color].self, from: jsonData)
        
        return jsonColorArray ?? []
    }
    
    var count: Int{
        return colorArray.count
    }
}
