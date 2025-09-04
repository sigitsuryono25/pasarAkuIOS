//
//  Slider.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//

import Foundation

struct Slider: Codable {

    var dataSlider: [DataSlider] = []
    var message: String? = nil
    var code: Int? = nil

    enum CodingKeys: String, CodingKey {

        case dataSlider = "data_slider"
        case message = "message"
        case code = "code"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        dataSlider =
            try values.decodeIfPresent(
                [DataSlider].self, forKey: .dataSlider) ?? []
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(Int.self, forKey: .code)

    }

    init() {

    }

}

struct DataSlider: Codable {

    var id: String? = nil
    var cover: String? = nil
    var active: String? = nil
    var addedOn: String? = nil

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case cover = "cover"
        case active = "active"
        case addedOn = "added_on"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decodeIfPresent(String.self, forKey: .id)
        cover = try values.decodeIfPresent(String.self, forKey: .cover)
        active = try values.decodeIfPresent(String.self, forKey: .active)
        addedOn = try values.decodeIfPresent(String.self, forKey: .addedOn)

    }

    init() {

    }

}
