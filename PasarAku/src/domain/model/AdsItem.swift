//
//  AdsItem.swift
//  PasarAku
//
//  Created by Sigit Sur on 06/09/25.
//

struct AdsItem {
    let iklanId: String
    let judulIklan: String
    let deskripsiIklan: String
    let lokasi: String
    let foto: [String]
    let harga: String
    let detail: String
    let kategori: String
    let lat: String
    let lon: String
    let addedBy: String
    let idKab: String
    let idKec: String
    let idProv: String
    let kondisi: String
    let slug: String
    let addedOn: String
    let isPremium: String
    let expired: String
    let isActived: String
    let startAt: String
    let namaLengkap: String
    let email: String
    let token: String
    let nomorTelepon: String
    let bergabung: String
    let profilePic: String
    let kec: String
    let kab: String
    let prov: String
    let lok: String
}

extension DataIklan {
    func toDomain() -> AdsItem {
        AdsItem(
            iklanId: iklanId ?? "",
            judulIklan: judulIklan ?? "",
            deskripsiIklan: deskripsiIklan ?? "",
            lokasi: lokasi ?? "",
            foto: self.imageAdsMapper(
                image: foto ?? [], iklanId: iklanId ?? ""),
            harga: harga ?? "",
            detail: detail ?? "",
            kategori: kategori ?? "",
            lat: lat ?? "",
            lon: lon ?? "",
            addedBy: addedBy ?? "",
            idKab: idKab ?? "",
            idKec: idKec ?? "",
            idProv: idProv ?? "",
            kondisi: kondisi ?? "",
            slug: slug ?? "",
            addedOn: addedOn ?? "",
            isPremium: isPremium ?? "",
            expired: expired ?? "",
            isActived: isActived ?? "",
            startAt: startAt ?? "",
            namaLengkap: namaLengkap ?? "",
            email: email ?? "",
            token: token ?? "",
            nomorTelepon: nomorTelepon ?? "",
            bergabung: bergabung ?? "",
            profilePic: self.profilePictMapper(image: profilePic ?? ""),
            kec: kec ?? "",
            kab: kab ?? "",
            prov: prov ?? "",
            lok: lok ?? ""
        )
    }

    private func imageAdsMapper(image: [String], iklanId: String) -> [String] {
        let imageUrl = "\(baseURL)/assets/iklan/\(iklanId)/"
        return image.map { img in
            "\(imageUrl)\(img)"
        }
    }

    private func profilePictMapper(image: String) -> String {
        let profilePictUrl = "\(baseURL)/assets/user/\(image)"
        return "\(profilePictUrl)\(image)"
    }
}

extension AdsList {
    func toDomainList() -> [AdsItem] {
        (dataIklan ?? []).map { ($0).toDomain() }
    }
}
