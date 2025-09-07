//
//  AdsList.swift
//  PasarAku
//
//  Created by Sigit Sur on 06/09/25.
//

import Foundation

struct AdsList: Codable {

    var dataIklan: [DataIklan]? = []
    var message: String? = nil
    var code: Int? = nil

    enum CodingKeys: String, CodingKey {

        case dataIklan = "data_iklan"
        case message = "message"
        case code = "code"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        dataIklan = try values.decodeIfPresent(
            [DataIklan].self, forKey: .dataIklan)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(Int.self, forKey: .code)

    }

    init() {

    }

}

struct DataIklan: Codable {

    var iklanId: String? = nil
    var judulIklan: String? = nil
    var deskripsiIklan: String? = nil
    var lokasi: String? = nil
    var foto: [String]? = []
    var harga: String? = nil
    var detail: String? = nil
    var kategori: String? = nil
    var lat: String? = nil
    var lon: String? = nil
    var addedBy: String? = nil
    var idKab: String? = nil
    var idKec: String? = nil
    var idProv: String? = nil
    var kondisi: String? = nil
    var slug: String? = nil
    var addedOn: String? = nil
    var isPremium: String? = nil
    var expired: String? = nil
    var isActived: String? = nil
    var startAt: String? = nil
    var namaLengkap: String? = nil
    var email: String? = nil
    var token: String? = nil
    var nomorTelepon: String? = nil
    var bergabung: String? = nil
    var profilePic: String? = nil
    var kec: String? = nil
    var kab: String? = nil
    var prov: String? = nil
    var lok: String? = nil

    enum CodingKeys: String, CodingKey {

        case iklanId = "iklan_id"
        case judulIklan = "judul_iklan"
        case deskripsiIklan = "deskripsi_iklan"
        case lokasi = "lokasi"
        case foto = "foto"
        case harga = "harga"
        case detail = "detail"
        case kategori = "kategori"
        case lat = "lat"
        case lon = "lon"
        case addedBy = "added_by"
        case idKab = "id_kab"
        case idKec = "id_kec"
        case idProv = "id_prov"
        case kondisi = "kondisi"
        case slug = "slug"
        case addedOn = "added_on"
        case isPremium = "is_premium"
        case expired = "expired"
        case isActived = "is_actived"
        case startAt = "start_at"
        case namaLengkap = "nama_lengkap"
        case email = "email"
        case token = "token"
        case nomorTelepon = "nomor_telepon"
        case bergabung = "bergabung"
        case profilePic = "profile_pic"
        case kec = "kec"
        case kab = "kab"
        case prov = "prov"
        case lok = "lok"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        iklanId = try values.decodeIfPresent(String.self, forKey: .iklanId)
        judulIklan = try values.decodeIfPresent(
            String.self, forKey: .judulIklan)
        deskripsiIklan = try values.decodeIfPresent(
            String.self, forKey: .deskripsiIklan)
        lokasi = try values.decodeIfPresent(String.self, forKey: .lokasi)
        foto = try values.decodeIfPresent([String].self, forKey: .foto)
        harga = try values.decodeIfPresent(String.self, forKey: .harga)
        detail = try values.decodeIfPresent(String.self, forKey: .detail)
        kategori = try values.decodeIfPresent(String.self, forKey: .kategori)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        addedBy = try values.decodeIfPresent(String.self, forKey: .addedBy)
        idKab = try values.decodeIfPresent(String.self, forKey: .idKab)
        idKec = try values.decodeIfPresent(String.self, forKey: .idKec)
        idProv = try values.decodeIfPresent(String.self, forKey: .idProv)
        kondisi = try values.decodeIfPresent(String.self, forKey: .kondisi)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        addedOn = try values.decodeIfPresent(String.self, forKey: .addedOn)
        isPremium = try values.decodeIfPresent(String.self, forKey: .isPremium)
        expired = try values.decodeIfPresent(String.self, forKey: .expired)
        isActived = try values.decodeIfPresent(String.self, forKey: .isActived)
        startAt = try values.decodeIfPresent(String.self, forKey: .startAt)
        namaLengkap = try values.decodeIfPresent(
            String.self, forKey: .namaLengkap)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        nomorTelepon = try values.decodeIfPresent(
            String.self, forKey: .nomorTelepon)
        bergabung = try values.decodeIfPresent(String.self, forKey: .bergabung)
        profilePic = try values.decodeIfPresent(
            String.self, forKey: .profilePic)
        kec = try values.decodeIfPresent(String.self, forKey: .kec)
        kab = try values.decodeIfPresent(String.self, forKey: .kab)
        prov = try values.decodeIfPresent(String.self, forKey: .prov)
        lok = try values.decodeIfPresent(String.self, forKey: .lok)

    }

    init() {

    }

}
