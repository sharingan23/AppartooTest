//
//  ParseJson.swift
//  AppartooTest
//
//  Created by Vigneswaranathan Sugeethkumar on 13/03/2019.
//  Copyright © 2019 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import Foundation
import MapKit

struct PenseBete: Codable {
    var bars: [Bar?]
    enum CodingKeys: String, CodingKey {
        case bars
    }
}

extension PenseBete {
    struct Bar: Codable {
        var id: Int
        var name: String
        var address : String
        var image : String
        var latitude : Double
        var longitude : Double
        
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case image = "image_url"
            case address
            case latitude
            case longitude
            
        }
    }
}

class ParseJson {
    static func getDataFromJson(data : Data) -> PenseBete? {
            guard let bars = try? JSONDecoder().decode(PenseBete.self, from: data) else {
                print("Error: Couldn't decode data into bar")
                return nil
            }
            return bars
    }

    static var jsonData: Data? {
        let bundle = Bundle(for: ParseJson.self)
        let url = bundle.url(forResource: "Pensebete", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
}
