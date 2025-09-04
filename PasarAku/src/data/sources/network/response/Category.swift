//
//  Category.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//

import Foundation

struct Category: Codable {

    var dataKategori: [DataKategori] = []
    var message: String? = nil
    var code: Int? = nil

    enum CodingKeys: String, CodingKey {

        case dataKategori = "data_kategori"
        case message = "message"
        case code = "code"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        dataKategori =
            try values.decodeIfPresent(
                [DataKategori].self, forKey: .dataKategori) ?? []
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(Int.self, forKey: .code)    }

    init() {

    }

}

struct DataKategori: Codable {

    var idKategori: String? = nil
    var namaKategori: String? = nil
    var icon: String? = nil
    var addedOn: String? = nil

    enum CodingKeys: String, CodingKey {

        case idKategori = "id_kategori"
        case namaKategori = "nama_kategori"
        case icon = "icon"
        case addedOn = "added_on"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        idKategori = try values.decodeIfPresent(
            String.self, forKey: .idKategori)
        namaKategori = try values.decodeIfPresent(
            String.self, forKey: .namaKategori)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        addedOn = try values.decodeIfPresent(String.self, forKey: .addedOn)

    }

    init() {

    }

}
